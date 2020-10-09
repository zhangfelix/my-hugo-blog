---
title: Python代码阅读（第48篇）：返回最大元素的索引
date: 2020-10-09T16:01:54+08:00
lastmod: 2020-10-09T16:01:54+08:00
author: Felix
cover: /post/Python代码阅读（第48篇）_返回最大元素的索引-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了返回列表中最大元素索引的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `max_element_index`

```python
def max_element_index(arr):
  return arr.index(max(arr))

# EXAMPLES
max_element_index([5, 8, 9, 7, 10, 3, 0]) # 4
```

`max_element_index`函数接收一个列表，返回列表中最大元素的索引。

函数使用`max`函数获取列表中值最大的元素，再使用`list.index()`获取该元素的索引。

`arr.index(x[, i[, j]])`函数返回在`arr`中首次出现项的索引（索引在`i`或其后且在`j`之前）。