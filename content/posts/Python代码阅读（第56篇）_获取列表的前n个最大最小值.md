---
title: Python代码阅读（第56篇）：获取列表的前n个最大/最小值
date: 2020-10-21T18:33:40+08:00
lastmod: 2020-10-21T18:33:40+08:00
author: Felix
cover: /post/Python代码阅读（第56篇）_获取列表的前n个最大最小值-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码分别获取列表的前`n`个最大/最小值。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `max_n`

```python
def max_n(lst, n=1):
  return sorted(lst, reverse=True)[:n]

# EXAMPLES
max_n([1, 2, 3]) # [3]
max_n([1, 2, 3], 2) # [3,2]
```

`max_n`函数接收一个列表和取值个数`n`，返回列表前`n`个最大数组成的列表。

函数使用`sorted()`函数和列表切片获取列表前`n`个最大数组成的列表。

`sorted(iterable, *, key=None, reverse=False)`根据`iterable`中的项返回一个新的已排序列表。它具有两个可选参数，它们都必须指定为关键字参数。`key`指定带有单个参数的函数，用于从`iterable`的每个元素中提取用于比较的键 (例如`key=str.lower`)。 默认值为 None (直接比较元素)。`reverse`为一个布尔值。 如果设为`True`，则每个列表元素将按反向顺序比较进行排序。

## `min_n`

```python
def min_n(lst, n=1):
  return sorted(lst, reverse=False)[:n]

# EXAMPLES
min_n([1, 2, 3]) # [1]
min_n([1, 2, 3], 2) # [1,2]
```

`min_n`函数接收一个列表和取值个数`n`，返回列表前`n`个最小数组成的列表。

函数和`max_n`类似，只需要将`sorted()`的`reverse`设置为`False`，使排序的方向相反即可。
