---
title: Python代码阅读（第81篇）：根据选择器获取嵌套字典的键值
date: 2020-11-26T12:21:49+08:00
lastmod: 2020-11-26T12:21:49+08:00
author: Felix
cover: /post/Python代码阅读（第81篇）_根据选择器获取嵌套字典的键值-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码根据给定选择器定义的查询结构（路径），获取嵌套字典中对应的键值。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `get`

```python
from functools import reduce 
from operator import getitem

def get(d, selectors):
  return reduce(getitem, selectors, d)

# EXAMPLES
users = {
  'freddy': {
    'name': {
      'first': 'fred',
      'last': 'smith' 
    },
    'postIds': [1, 2, 3]
  }
}
get(users, ['freddy', 'name', 'last']) # 'smith'
get(users, ['freddy', 'postIds', 1]) # 2
```

`get`函数接收一个字典`d`，和一个选择器（列表形式）`selectors`，返回由选择器指定的路径的键的值。 

函数使用`reduce`函数在选择器上逐一使用`operator.getitem(a, b)`函数，选择器元素的指示，逐一获取嵌套的子字典结构（或最终值）。

`operator`模块提供了一套与`Python`的内置运算符对应的高效率函数。例如，`operator.add(x, y)`与表达式`x+y`相同，`operator.getitem(a, b)`则是返回`a`上面索引为`b`的值。

`reduce(getitem, selectors, d)`函数将`getitem()`累计的作用于`selectors`的元素上，并将`d`做为左边参数的初始值参与第一次`getitem`的调用。例如`reduce(getitem, [a, b, c], d)`是计算`getitem(getitem(getitem(d, a), b), c)`。也就是从输入字典开始，不断的根据`key`来获取对应的子字典（或最终值）。
