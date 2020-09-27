---
title: Python代码阅读（第44篇）：寻找符合条件的元素的位置
date: 2020-09-25T18:50:00+08:00
lastmod: 2020-09-25T18:50:00+08:00
author: Zhang nan
cover: /post/Python代码阅读（第44篇）_寻找符合条件的元素的位置-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了在列表中寻找符合条件的元素的位置。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `find_index`

```python
def find_index(lst, fn):
  return next(i for i, x in enumerate(lst) if fn(x))

# EXAMPLES
find_index([1, 2, 3, 4], lambda n: n % 2 == 1) # 0
```

`find_index`函数接收一个列表和一个判别函数，返回第一个使判别函数为真的元素的下标。

函数使用列表推导式、`enumerate()`和`next()`来返回`lst`中第一个 是判别函数`fn`的返回为`True`的元素的索引。

`next(iterator[, default])`获取迭代器的下一个元素。如果迭代器耗尽，则返回给定的 default，如果没有默认值则触发 `StopIteration`

`enumerate(iterable, start=0)`
返回一个枚举对象。`enumerate()`返回的迭代器的`__next__()`方法返回一个元组，里面包含一个计数值（从`start`开始，默认为`0`）和通过迭代`iterable`获得的值。如果`start`从`0`开始，相当于获取了列表的下标。

```python
>>> seasons = ['Spring', 'Summer', 'Fall', 'Winter']
>>> list(enumerate(seasons))
[(0, 'Spring'), (1, 'Summer'), (2, 'Fall'), (3, 'Winter')]
>>> list(enumerate(seasons, start=1))
[(1, 'Spring'), (2, 'Summer'), (3, 'Fall'), (4, 'Winter')]
```

## `find_last_index`

类似的，可以实现`find_last_index`函数，使用`lst[::-1]`切片形式，将列表倒序。然后使用`len(lst)`和倒序后的列表中第一个符合判别函数的元素的位置，计算该元素在原列表中的位置。

```python
def find_last_index(lst, fn):
  return len(lst) - 1 - next(i for i, x in enumerate(lst[::-1]) if fn(x))

# EXAMPLES
find_last_index([1, 2, 3, 4], lambda n: n % 2 == 1) # 2
```

