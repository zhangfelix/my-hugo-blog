---
title: Python代码阅读_digitize
date: 2020-06-19T19:19:35+08:00
lastmod: 2020-06-19T19:19:35+08:00
author: Zhang nan
cover: /post/Python代码阅读_digitize-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本文中的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `digitize`

```python
def digitize(n):
  return list(map(int, str(n)))

# EXAMPLES
digitize(123) # [1, 2, 3]
```

该函数的作用是将输入的数字转化成一个列表，输入数字中的每一位按照从左到右的顺序成为列表中的一项。

该函数的主体逻辑是先将输入的数字转化成字符串，再使用`map`函数将字符串按次序转花成`int`类型，最后转化成`list`。

为什么输入的数字经过这种转化就可以得到一个列表呢？这是因为Python中`str`是一个可迭代类型。所以`str`可以使用`map`函数，同时`map`返回的是一个迭代器，也是一个可迭代类型。最后再使用这个迭代器构建一个列表。

## Python判断对象是否可迭代

目前网络上的常见的判断方法是使用使用`collections.abc`（该模块在3.3以前是`collections`的组成部分）模块的`Iterable`类型来判断。

```python
from collections.abc import Iterable
isinstance('abc', Iterable) # True
isinstance(map(int,a), Iterable) # True
```

虽然在当前场景中这么使用没有问题，但是根据[官方文档](https://docs.python.org/3/library/collections.abc.html#collections.abc.Iterable)的描述，检测一个对象是否是`iterable`的唯一可信赖的方法是调用`iter(obj)`。

> class collections.abc.Iterable
> ABC for classes that provide the __iter__() method.
> 
> Checking isinstance(obj, Iterable) detects classes that are registered as Iterable or that have an __iter__() method, but it does not detect classes that iterate with the __getitem__() method. The only reliable way to determine whether an object is iterable is to call iter(obj).

```python
>>> iter('abc')
<str_iterator object at 0x10c6efb10>
```

