---
title: Python代码阅读（第42篇）：将输入转换成列表形式
date: 2020-09-21T12:30:17+08:00
lastmod: 2020-09-21T12:30:17+08:00
author: Felix
cover: /post/Python代码阅读（第42篇）_将输入转换成列表形式-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将非列表形式的输入转换成列表形式。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

# `cast_list`

```python
def cast_list(val):
  return list(val) if isinstance(val, (tuple, list, set, dict)) else [val]

# EXAMPLES
cast_list('foo') # ['foo']
cast_list([1]) # [1]
cast_list(('foo', 'bar')) # ['foo', 'bar']
```

`cast_list`函数输入一个参数，输出该参数转换成列表的形式。

函数使用`isinstance()`检查给定的值是否是可枚举的，并通过使用`list()`将参数的形式进行转换，或直接封装在一个列表中返回。

原始代码片中没有`set`和`dict`类型的样例，接下来我们测试一下这两种输入的输出。

```python
>>> cast_list({'one', 'two', 'three'})
['three', 'one', 'two']
>>> cast_list({"one": 1, "two": 2, "three": 3})
['one', 'two', 'three']
```

集合类型的输出元素的顺序不一致，这是因为集合是无序。字典类型中，最后`list`中只有`key`，没有`value`。
