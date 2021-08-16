---
title: MongoDB防止插入重复数据
date: 2021-08-16T18:00:34+08:00
lastmod: 2021-08-16T18:00:34+08:00
author: Felix
cover: /post/MongoDB防止插入重复数据.jpg
categories: ["技术"]
tags: ["MongoDB"]
draft:  false
---

重复数据，指的是某些字段是相同的文档重复插入。也就是说在一个集合里面，某些字段有重复值。

<!--more-->

## 没有并发的环境下

最直接的想法是先查询相关字段，如果查询到，就更新，如果没有查询到就插入。
```python
if db.collection.find(filter).count() == 0：
    db.collection.insert_one(document)
else:
    # 重置更新abbs字段
    db.collection.update_one(filter, update)
```

或者在使用`update_one()`操作时，将参数`upsert`设置为`true`。该设置会查找有没有匹配的文档，有的话就更新，没有的话就插入。如果`upsert`为默认值`false`时，如果没有找到匹配的文档，并不会执行插入。

```python
db.collection.update_one(filter, update, upsert=true)
```

但是这两种操作并不原子，也就是说，存在并发的场景下，可能出现冲突。`upsert`设置为`true`的`update`函数也不是线程安全的。多个命令同时进行，都没有查询到匹配的文档时，会都执行插入，这样就会有多个文档了。

## 存在并发的环境下

想要解决这个问题，我们需要建立唯一索引，这样就不会有重复插入的情况了。

```python
db.collection.createIndex( <key and index type specification>, { unique: true } )
# 单一字段索引
db.collection.createIndex({key:1},{unique:true}
# 组合字段索引
db.collection.createIndex({key_one:1,key_two:1},{unique:true})
```

然后直接尝试插入或者更新，抛出异常的时候再次使用更新即可。

```python
try:
    db.collection.insert_one(document)
except DuplicateKeyError:
    db.collection.update_one(filter, update)
```

或者：

```python
try:
    db.collection.update_one(filter, update, upsert=true)
except DuplicateKeyError:
    db.collection.update_one(filter, update, upsert=true)
```

## `upsert`的官方说明

### [参数说明](https://docs.mongodb.com/v4.0/reference/method/db.collection.update/#definition)

如果该参数设置为`true`，则在没有文档匹配查询条件时创建新文档。默认值为`false`，当没有找到匹配项时，它不会插入新文档。

### [关于重复数据的说明](https://docs.mongodb.com/v4.0/reference/method/db.collection.update/#use-unique-indexes)

为了避免多次插入同一个文档，只有在查询字段是唯一索引的情况下才使用`upsert: true`。

给定一个名为`people`的集合，其中没有文档的`name`字段持有值`Andy`。考虑当多个客户端同时发出以下`upsert: true`的更新时。

```python
db.people.update(
   { name: "Andy" },
   {
      name: "Andy",
      rating: 1,
      score: 1
   },
   { upsert: true }
)
```

如果所有的`update()`操作都在任何客户端成功插入数据之前完成了查询部分，并且在`name`字段上没有唯一索引，那么每次`update`操作都可能导致插入。

为了防止`MongoDB`不止一次地插入同一个文档，请在`name`字段上创建一个唯一索引。有了唯一索引，如果多个应用程序以`upsert: true`发出同一个更新，只会有一个`update()`成功插入一个新文档。

可能的剩余操作：
- 更新最新插入的文件，或者
- 试图插入一个重复的文档时失败。
	如果操作因为重复的索引键错误而失败，应用程序可以重试操作，该操作将作为更新操作成功。
