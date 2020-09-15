---
title: Python代码阅读（第40篇）：通过两个列表生成字典
date: 2020-09-15T12:37:57+08:00
lastmod: 2020-09-15T12:37:57+08:00
author: Zhang nan
cover: /post/Python代码阅读（第40篇）_通过两个列表生成字典-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了使用两个列表中的元素分别作为`key`和`value`生成字典。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

# `to_dictionary`

```python
def to_dictionary(keys, values):
  return {key:value for key, value in zip(keys, values)}

# EXAMPLES
to_dictionary(['a', 'b'], [1, 2]) # { a: 1, b: 2 }
```

`to_dictionary`函数接收两个列表作为`key`和`value`，返回由这两个列表的元素组成的字典。

函数使用字典推导式生成新的字典，使用列表`key`中的元素作为字典的键，使用列表`value`中对应的元素作为对应的值。推导式使用`zip`函数同时迭代两个列表，获取两个列表中相对应的元素。

`zip(*iterables)`创建一个聚合了来自每个可迭代对象中的元素的迭代器。它返回一个元组的迭代器，其中的第`i`个元组包含来自每个参数序列或可迭代对象的第`i`个元素。 当所输入可迭代对象中最短的一个被耗尽时，迭代器将停止迭代。 当只有一个可迭代对象参数时，它将返回一个单元组的迭代器。不带参数时，它将返回一个空迭代器。

```python
>>> x = [1, 2, 3]
>>> y = [4, 5, 6]
>>> zipped = zip(x, y)
>>> list(zipped)
[(1, 4), (2, 5), (3, 6)]
```

