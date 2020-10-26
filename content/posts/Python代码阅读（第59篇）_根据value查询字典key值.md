---
title: Python代码阅读（第59篇）：根据value查询字典key值
date: 2020-10-26T18:30:22+08:00
lastmod: 2020-10-26T18:30:22+08:00
author: Felix
cover: /post/Python代码阅读（第59篇）_根据value查询字典key值-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了根据`value`查询字典`key`的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `find_keys`

```python
def find_keys(dict, val):
  return list(key for key, value in dict.items() if value == val)

# EXAMPLES
ages = {
  "Peter": 10,
  "Isabel": 11,
  "Anna": 10,
}
find_keys(ages, 10) # [ "Peter", "Anna" ]
```

`find_keys`函数接收一个字典和一个`val`值，返回一个键值列表。

函数在生成器表达式中，使用`items()`获取字典的`k-v`值对，当`value`值和输入相等时，获取`key`的值。最后再用`list()`将生成器转化成一个列表。

## `find_key`

```python
def find_key(dict, val):
  return next(key for key, value in dict.items() if value == val)

# EXAMPLES
ages = {
  "Peter": 10,
  "Isabel": 11,
  "Anna": 9,
}
find_key(ages, 11) # "Isabel"
```

`find_key`函数接收一个字典和一个`val`值，返回第一个`value`值相同的`key`值。

和`find_keys`类似，使用生成器表达式获取指定`value`的键值。不同的是，生成器外面使用`next()`函数获取生成器的下一个取值。在本函数中`next()`只调用一次，因此会获取第一符合要求的`key`值。

`next(iterator[, default])`函数通过调用`iterator`的 `__next__()`方法获取下一个元素。如果迭代器耗尽，则返回给定的`default`，如果没有默认值则触发`StopIteration`。
