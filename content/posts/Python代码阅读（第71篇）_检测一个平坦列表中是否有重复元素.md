---
title: Python代码阅读（第71篇）：检测一个平坦列表中是否有重复元素
date: 2020-11-11T12:32:28+08:00
lastmod: 2020-11-11T12:32:28+08:00
author: Felix
cover: /post/Python代码阅读（第71篇）_检测一个平坦列表中是否有重复元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了检测平坦列表中是否包含重复元素的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `has_duplicates`

```python
def has_duplicates(lst):
  return len(lst) != len(set(lst))

# EXAMPLES
x = [1, 2, 3, 4, 5, 5]
y = [1, 2, 3, 4, 5]
has_duplicates(x) # True
has_duplicates(y) # False
```

`has_duplicates`函数接收一个列表，返回`True`，如果该列表中包含重复元素，返回`False`，如果该列表中不包含重复元素。

函数使用`set(lst)`形成不包含重复项的列表元素的集合。计算并比较原列表的长度和集合的长度。如果长度一致，则说明列表中不包含重复元素；不一致，则说明列表中包含重复元素。
