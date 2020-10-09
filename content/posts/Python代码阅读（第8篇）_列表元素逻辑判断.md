---
title: Python代码阅读（第8篇）：列表元素逻辑判断
date: 2020-06-29T14:54:08+08:00
lastmod: 2020-06-29T14:54:08+08:00
author: Felix
cover: /post/Python代码阅读（第8篇）_列表元素逻辑判断-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的三份代码的功能分别是判断列表中的元素是否都符合给定的条件；判断列表中是否存在符合给定的条件的元素；以及判断列表中的元素是否都不符合给定的条件。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `every`

```python
def every(lst, fn=lambda x: x):
  return all(map(fn, lst))

# EXAMPLES
every([4, 2, 3], lambda x: x > 1) # True
every([1, 2, 3]) # True
```

`every`用于判断列表`lst`中的元素是否都符合给定的判断条件`fn`。

代码中首先使用`map`返回一个迭代器，该迭代器会将判断条件`fn`应用于所有的列表元素上。然后使用`all`函数判断迭代器中的元素是否都为`True`。

`all(iterable)` 接收一个可迭代对象，如果这个对象中的所有元素都为`True`，则函数返回`True`。注意，当该对象为空时，也返回`True`。该函数等价于：

```python
def all(iterable):
  for element in iterable:
    if not element:
      return False
  return True
```

## `some`

```python
def some(lst, fn=lambda x: x):
  return any(map(fn, lst))

# EXAMPLES
some([0, 1, 2, 0], lambda x: x >= 2 ) # True
some([0, 0, 1, 0]) # True
```

`some`用于判断列表`lst`列表中是否存在符合给定的条件`fn`的元素。

代码中首先使用`map`返回一个迭代器，该迭代器会将判断条件`fn`应用于所有的列表元素上。然后使用`any`函数判断迭代器中是否至少有一个元素为`True`。

`any(iterable)` 接收一个可迭代对象，如果这个对象中有任一元素为`True`，则函数返回`True`。注意，当该对象为空时，返回`False`。该函数等价于：

```python
def any(iterable):
  for element in iterable:
    if element:
      return True
  return False
```

## `none`

```python
def none(lst, fn=lambda x: x):
  return all(not fn(x) for x in lst)

# EXAMPLES
none([0, 1, 2, 0], lambda x: x >= 2 ) # False
none([0, 0, 0]) # True
```

`none`用于判断列表`lst`中的元素是否都不符合给定的判断条件`fn`。

代码中首先使用生成器表达式生成一个生成器，该生成器会将判断条件`not fn`应用于所有的列表元素上。然后使用`all`函数判断迭代器中的元素是否都为`True`。

```python
lst = [0, 1, 2, 0]

def fn(x):
  return x >= 2

type(not fn(x) for x in lst) # <class 'generator'>
```

