---
title: Python代码阅读（第26篇）：将列表映射成字典
date: 2020-08-19T17:28:14+08:00
lastmod: 2020-08-19T17:28:14+08:00
author: Felix
cover: /post/Python代码阅读（第26篇）_将列表映射成字典-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码使用提供的映射函数，将传入的列表映射成字典。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `map_dictionary`

```python
def map_dictionary(itr, fn):
  ret = {}
  for x in itr:
    ret[x] = fn(x)
  return ret

# EXAMPLES
map_dictionary([1,2,3], lambda x: x * x) # { 1: 1, 2: 4, 3: 9 }
```

`map_dictionary`函数接收一个列表以及一个映射函数，并返回一个字典，字典的`key`是列表的元素，字典的`value`是对`key`使用映射函数`fn`之后的返回值。

函数先使用`ret = {}`新建一个空字典。然后用`for`循环遍历每一个列表元素。`ret[x] = value`这种形式将会改变`key-value`对的值，或者增加一对。最后，函数返回新生成的字典。
