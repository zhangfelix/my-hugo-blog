---
title: Python代码阅读（第46篇）：寻找符合条件的元素
date: 2020-09-28T12:30:42+08:00
lastmod: 2020-09-28T12:30:42+08:00
author: Zhang nan
cover: /post/Python代码阅读（第46篇）_寻找符合条件的元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了在列表中寻找符合条件的元素。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `find`

```python
def find(lst, fn):
  return next(x for x in lst if fn(x))

# EXAMPLES
find([1, 2, 3, 4], lambda n: n % 2 == 1) # 1
```

`find`函数接收一个列表和一个判别函数，返回第一个使判别函数为真的元素。

函数使用列表推导式和`next()`来返回`lst`中第一个 是判别函数`fn`的返回为`True`的元素。

`next(iterator[, default])`获取迭代器的下一个元素。如果迭代器耗尽，则返回给定的 default，如果没有默认值则触发 `StopIteration`

## `find_last`

类似的，可以实现`find_last`函数，使用`lst[::-1]`切片形式，将列表倒序。然后使用相同的方法获取使判别函数`fn`为`True`的元素。

```python
def find_last(lst, fn):
  return next(x for x in lst[::-1] if fn(x))

# EXAMPLES
find_last([1, 2, 3, 4], lambda n: n % 2 == 1) # 3
```

```python
>>> lst = [1,2,3,4,5,6]
>>> lst[::-1]
[6, 5, 4, 3, 2, 1]
```

