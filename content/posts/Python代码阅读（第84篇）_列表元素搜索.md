---
title: Python代码阅读（第84篇）：列表元素搜索
date: 2020-12-01T18:35:27+08:00
lastmod: 2020-12-01T18:35:27+08:00
author: Felix
cover: /post/Python代码阅读（第84篇）_列表元素搜索-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了搜索整个列表，并返回列表中所有和指定值相等的元素的索引。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `index_of_all`

```py
def index_of_all(lst, value):
  return [i for i, x in enumerate(lst) if x == value]

# EXAMPLES
index_of_all([1, 2, 1, 4, 5, 1], 1) # [0, 2, 5]
index_of_all([1, 2, 3, 4], 6) # [] 
```

`index_of_all`函数接收一个列表和一个指定值，函数返回所有和该值相等的元素在列表中的索引。

函数使用`enumerate(lst)`获取一个可迭代的枚举对象，每次迭代，得到一个元组，包含一个默认从`0`开始的计数器和迭代`lst`获得的值。也就是说将`lst`列表，转化成一个个索引值和对应的元素所组成的元组。然后使用列表推导式生成所有满足条件的元素的索引组成的列表。
