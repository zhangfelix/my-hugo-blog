---
title: Python代码阅读（第97篇）：字典按照值进行排序
date: 2020-12-30T12:30:28+08:00
lastmod: 2020-12-30T12:30:28+08:00
author: Felix
cover: /post/Python代码阅读（第97篇）_字典按照值进行排序-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将字典各项根据值按照字典顺序进行排序的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `sort_dict_by_value`

```py
def sort_dict_by_value(d, reverse = False):
  return dict(sorted(d.items(), key = lambda x: x[1], reverse = reverse))

# EXAMPLES
d = {'one': 1, 'three': 3, 'five': 5, 'two': 2, 'four': 4}
sort_dict_by_value(d) # {'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5}
sort_dict_by_value(d, True)
# {'five': 5, 'four': 4, 'three': 3, 'two': 2, 'one': 1}
```

函数接收一个字典`d`和一个`reverse`标识，返回按照值排序后的新字典。

函数使用`dict.item()`获取字典`(key, value)`的可迭代对象。然后使用`sorted()`函数进行排序，最后将排序结果重新转换成字典。

`sorted(iterable, *, key=None, reverse=False)`函数可以指定一个带单个参数的函数（由`key`参数指定），用于从可迭代对象中提取一个排序的比较键。该函数的输入即为可迭代对象的每个元素，输出即为用于比较的键。因此，为了能够依据字典值来进行排序，所以需要提取字典每个`item`的第二个元素，即`(key, value)[1]`。所以这里指定使用的函数是`lambda x: x[1]`
