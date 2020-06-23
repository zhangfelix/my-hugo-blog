---
title: Python代码阅读：average_by
date: 2020-06-18T22:57:04+08:00
lastmod: 2020-06-18T22:57:04+08:00
author: Zhang nan
cover: /post/Python代码阅读_average_by-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本文中的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `average_by`

```python
def average_by(lst, fn=lambda x: x):
  return sum(map(fn, lst), 0.0) / len(lst)

# EXAMPLES
average_by([{ 'n': 4 }, { 'n': 2 }, { 'n': 8 }, { 'n': 6 }], lambda x: x['n']) # 5.0
```

该函数用于在列表中求取平均数。该代码片段中主要使用了`lambda`表达式和`map`函数。该函数的主要逻辑是使用`lambda`表达式和`map`函数提取由待计算的数值组成的迭代器，然后使用`sum`函数计算列表的和，再除以列表长度。

### `lambda`表达式

形如`lambda parameters: expression`的表达式可以创建一个匿名函数。在该代码片段中，`lambda`表达式出现在函数`average_by`的**参数**定义中，作为一个参数传给了`fn`。因此在`average_by`函数体中`fn`作为刚刚在参数中定义的函数发挥作用。

函数`average_by`的默认参数中的`lambda`表达式是一个直接返回输入参数的函数。在例子中，向`average_by`传入的匿名函数返回字典中`key`值为`n`项的值。

### `map`函数

`map`函数是Python内置的一个高阶函数，这个函数很有意思，它的参数是一个函数以及一个可迭代对象。它会返回一个迭代器，这个迭代器会将参数中的函数应用在参数中可迭代对象上。

## 其他类似函数

在[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)中还有一些类似的代码片段。在理解了`average_by`函数之后，这些都很容理解。

### `max_by`

```python
def max_by(lst, fn):
  return max(map(fn, lst))

# EXAMPLES
max_by([{ 'n': 4 }, { 'n': 2 }, { 'n': 8 }, { 'n': 6 }], lambda v : v['n']) # 8
```

### `min_by`

```python
def min_by(lst, fn):
  return min(map(fn, lst))

# EXAMPLES
min_by([{ 'n': 4 }, { 'n': 2 }, { 'n': 8 }, { 'n': 6 }], lambda v : v['n']) # 2
```

### `sum_by`

```python
def sum_by(lst, fn):
  return sum(map(fn, lst))

# EXAMPLES
sum_by([{ 'n': 4 }, { 'n': 2 }, { 'n': 8 }, { 'n': 6 }], lambda v : v['n']) # 20
```
