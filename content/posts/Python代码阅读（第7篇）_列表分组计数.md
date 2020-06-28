---
title: Python代码阅读（第7篇）：列表分组计数
date: 2020-06-28T13:44:44+08:00
lastmod: 2020-06-28T13:44:44+08:00
author: Zhang nan
cover: /post/Python代码阅读（第7篇）_列表分组计数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本文阅读的代码将根据给定的函数对列表中的元素进行分组，并返回每组中元素的数量。

<!--more-->

## `count_by`[^1]

```python
def count_by(arr, fn=lambda x: x):
  key = {}
  for el in map(fn, arr):
    key[el] = 1 if el not in key else key[el] + 1
  return key

# EXAMPLES
from math import floor
count_by([6.1, 4.2, 6.3], floor) # {6: 2, 4: 1}
count_by(['one', 'two', 'three'], len) # {3: 2, 5: 1}
```

`count_by`根据给定的函数对列表中的元素进行分组，并返回每组中元素的数量。该使用map()使用给定函数映射给定列表的值。在映射上迭代，并在每次出现时增加元素数。

该函数使用`not in`判断目前字典中是否含有指定的`key`，如果不含有，就将该`key`加入字典，并将对应的`value`设置为`1`；如果含有，就将`value`加`1`。

## 使用字典推导式

在** Python代码阅读：根据给定的函数对列表中的元素进行分组**中使用了字典推导式，将列表进行了分组。这里也可以使用同样的方式，在分组之后直接获取列表长度。不过这种写法遍历了两次列表，会使程序效率变低。

```python
def count_by(lst, fn):
  return {key : len([el for el in lst if fn(el) == key]) for key in map(fn, lst)}
```

##  使用`collections.defaultdict`简化代码

```python
class collections.defaultdict([default_factory[, ...]])
```

`collections.defaultdict`包含一个`default_factory`属性，可以用来快速构造指定样式的字典。

当使用`int`作为`default_factory`，可以使`defaultdict`用于计数。因此可以直接使用它来简化代码。相比字典推导式的方法，只需要对列表进行一次循环即可。

```python
 from collections import defaultdict

def count_by(lst, fn):
  d = defaultdict(int)
  for el in lst:
    d[fn(el)] += 1
  return d
```

当使用 `list` 作为 `default_factory`时，很轻松地将（键-值对组成的）序列转换为（键-列表组成的）字典。因此我们也可以据此改写** Python代码阅读：根据给定的函数对列表中的元素进行分组**中的实现方式，提高效率。

```python
def group_by(lst, fn):
  d = defaultdict(list)
  for el in lst:
    d[fn(el)].append(el)
  return d

# EXAMPLES
from math import floor
group_by([6.1, 4.2, 6.3], floor) # {4: [4.2], 6: [6.1, 6.3]}
group_by(['one', 'two', 'three'], len) # {3: ['one', 'two'], 5: ['three']}
```

[^1]:	本文阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。
