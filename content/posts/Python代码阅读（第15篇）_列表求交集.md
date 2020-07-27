---
title: Python代码阅读（第15篇）：列表求交集
date: 2020-07-27T12:15:18+08:00
lastmod: 2020-07-27T12:15:18+08:00
author: Zhang nan
cover: /img/Python代码阅读（第15篇）_列表求交集-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了实现了两个列表求交集的功能。同时支持使用一个过滤条件函数，列表中所有元素根据该条件求取交集，交集中是两个列表的原始元素。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `intersection_by`

```python
def intersection_by(a, b, fn):
  _b = set(map(fn, b))
  return [item for item in a if fn(item) in _b]

# EXAMPLES
from math import floor
intersection_by([2.1, 1.2], [2.3, 3.4],floor) # [2.1]
```

`intersection_by`函数接收两个列表和一个过滤条件函数。将提供的函数应用于两个列表中的每个元素后，返回一个存在于两个列表中的元素的列表。函数通过对`b`中的每个元素应用`fn`来创建一个集合，然后在`a`上结合使用列表推导式和`fn`来只保留同时存在于两个列表中的值。

`map`函数之前已经讲解过，它会返回一个迭代器，该迭代器会将变换函数`fn`应用于所有的列表元素上。

`set`是`Python`的一个特殊的数据类型，是由不重复元素组成的无序的集。本函数直接使用`set`类型消除了列表中的重复元素。

特别的，当过滤条件函数是`lamda x:x`时，函数转化为直接求取两个列表的交集。
