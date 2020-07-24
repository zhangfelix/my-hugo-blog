---
title: Python代码阅读（第14篇）：列表求并集
date: 2020-07-24T12:03:43+08:00
lastmod: 2020-07-24T12:03:43+08:00
author: Zhang nan
cover: /post/Python代码阅读（第14篇）_列表求并集-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了实现了两个列表求并集的功能。同时支持使用一个过滤条件函数，列表中所有元素根据该条件求取并集，并集中是两个列表的原始元素。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `union_by`

```python
def union_by(a, b, fn):
  _a = set(map(fn, a))
  return list(set(a + [item for item in b if fn(item) not in _a]))

# EXAMPLES
from math import floor
union_by([2.1], [1.2, 2.3], floor) # [2.1, 1.2]
```

`union_by`函数接收两个列表和一个过滤条件函数。将提供的函数应用于两个列表中的每个元素后，返回一个新的列表，包含所有存在于两个列表的不重复的元素。

`map`函数之前已经讲解过，它会返回一个迭代器，该迭代器会将变换函数`fn`应用于所有的列表元素上。

`set`是`Python`的一个特殊的数据类型，是由不重复元素组成的无序的集。本函数直接使用`set`类型消除了列表中的重复元素。

特别的，当过滤条件函数是`lamda x:x`时，函数转化为直接求取两个列表的并集。
