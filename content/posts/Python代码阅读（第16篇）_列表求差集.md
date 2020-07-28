---
title: Python代码阅读（第16篇）：列表求差集
date: 2020-07-28T12:26:46+08:00
lastmod: 2020-07-28T12:26:46+08:00
author: Zhang nan
cover: /post/Python代码阅读（第16篇）_列表求差集-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读三种不同的列表差集的实现方式。分别是列表直接求差`difference`，列表中所有元素根据条件函数求差`difference_by`，列表中所有元素根据条件函数求对称差`symmetric_difference_by`。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `difference`

```python
def difference(a, b):
  _b = set(b)
  return [item for item in a if item not in _b]

# EXAMPLES
difference([1, 2, 3], [1, 2, 4]) # [3]
```

`difference`函数返回两个可迭代对象之间的差。该函数从`b`中创建一个集合`_b`，然后在`a`上使用列表推导式，只保留`_b`中不包含的值。该函数中`a`和`b`是有顺序关系的，`a-b`是从`a`中删除`b`中包含的数据。

`set`是`Python`的一个特殊的数据类型，是由不重复元素组成的无序的集。本函数直接使用`set`类型消除了列表中的重复元素。

## `difference_by`

```python
def difference_by(a, b, fn):
  _b = set(map(fn, b))
  return [item for item in a if fn(item) not in _b]

# EXAMPLES
from math import floor
difference_by([2.1, 1.2], [2.3, 3.4], floor) # [1.2]
difference_by([{ 'x': 2 }, { 'x': 1 }], [{ 'x': 1 }], lambda v : v['x']) # [ { x: 2 } ]
```

`difference_by`函数接收两个列表和一个过滤条件函数。将提供的函数应用于两个列表中的每个元素后，返回两个原始列表的差。函数通过对`b`中的每个元素应用`fn`来创建一个集合，然后在`a`上使用列表推导式与`fn`相结合，只保留之前创建的集合`_b`中没有包含的值。

特别的，当过滤条件函数是`lamda x:x`时，函数转化为直接求取两个列表的差。

## `symmetric_difference_by`

```python
def symmetric_difference_by(a, b, fn):
  _a, _b = set(map(fn, a)), set(map(fn, b))
  return [item for item in a if fn(item) not in _b] + [item for item in b if fn(item) not in _a]

# EXAMPLES
from math import floor
symmetric_difference_by([2.1, 1.2], [2.3, 3.4],floor) # [1.2, 3.4]
```

`symmetric_difference_by`函数对两个列表中的每个列表元素应用所提供的函数后，返回两个原始列表之间的对称差。函数通过分别对每个列表中的每个元素应用`fn`来创建两个集合`_a`和`_b`，然后在每个元素上使用列表理解与`fn`相结合，只保留不包含在之前创建的其他集合中的值（在`a` 中，不在`_b`中；在`b`中，不在`_a`中。）。

特别的，当过滤条件函数是`lamda x:x`时，函数转化为直接求取两个列表的对称差。
