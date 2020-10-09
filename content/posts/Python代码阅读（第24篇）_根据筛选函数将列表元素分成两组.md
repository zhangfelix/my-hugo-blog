---
title: Python代码阅读（第24篇）：根据筛选函数将列表元素分成两组
date: 2020-08-13T12:15:46+08:00
lastmod: 2020-08-13T12:15:46+08:00
author: Felix
cover: /post/Python代码阅读（第24篇）_根据筛选函数将列表元素分成两组-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现根据筛选函数将列表元素分成两组。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `bifurcate_by`

```python
def bifurcate_by(lst, fn):
  return [
    [x for x in lst if fn(x)],
    [x for x in lst if not fn(x)]
  ]

# EXAMPLES
bifurcate_by(
  ['beep', 'boop', 'foo', 'bar'], 
  lambda x: x[0] == 'b'
) # [ ['beep', 'boop', 'bar'], ['foo'] ]
```

`bifurcate_by`函数接收一个列表和一个筛选函数作为输入。根据筛选函数返回的值将列表元素归入不同的组中。当筛选函数返回`True`时，归入第一组，当筛选函数返回`False`时，归入第二组。

函数使用两个列表推导式生成两个子列表，用于放置两个组的元素。
