---
title: Python代码阅读（第11篇）：展开嵌套列表
date: 2020-07-21T12:12:15+08:00
lastmod: 2020-07-21T12:12:15+08:00
author: Zhang nan
cover: /post/Python代码阅读（第11篇）_展开嵌套列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了展开嵌套列表的功能，将一个嵌套的list展开成一个一维list（不改变原有列表的顺序）。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `flatten`

```python
def flatten(lst):
  return [x for y in lst for x in y]

# EXAMPLES
flatten([[1,2,3,4],[5,6,7,8]]) # [1, 2, 3, 4, 5, 6, 7, 8]
```

`flatten`函数接收一个嵌套列表（以列表为元素的列表），返回一个按照原有顺序展开后的一维列表。

该函数使用了列表推导式进行数据处理。该推导式使用了两层`for`循环，等价于

```python
def flatten(lst):
  flatten_list = []
  for y in lst:
    for x in y:
      flatten_list.append(x)
  return flatten_list
```

