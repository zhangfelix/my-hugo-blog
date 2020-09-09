---
title: Python代码阅读（第36篇）：列表偏移
date: 2020-09-09T12:26:59+08:00
lastmod: 2020-09-09T12:26:59+08:00
author: Zhang nan
cover: /post/Python代码阅读（第36篇）_列表偏移-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将一个列表向左或向右偏移指定位数的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `offset`

```python
def offset(lst, offset):
  return lst[offset:] + lst[:offset]

# EXAMPLES
offset([1, 2, 3, 4, 5], 2) # [3, 4, 5, 1, 2]
offset([1, 2, 3, 4, 5], -2) # [4, 5, 1, 2, 3]
```

`offset`函数接收一个列表`lst`和一个偏移量`offset`，返回根据偏移量`offset`偏移后的列表。当偏移量为正的时候，向左移动；当偏移量为负的时候，向右移动。

函数使用列表的切片功能，将原列表根据偏移量分成两个新列表，并将其按照新的顺序组合成偏移后的新列表。

当`offset`为正时，`lst[offset:]`表示从下标`offset`开始，到列表结尾的切片；`lst[:offset]`表示从列表开头，到下标为`offset`前一个元素的切片。因为列表下标是从`0`开始计算的，所以列表前`offset`个元素移动到了列表的末尾，实现了列表向左移动`offset`个位数。

当`offset`为负时，`lst[offset:]`表示从列表结尾倒数第`offset`个元素开始，到列表结尾的切片；`lst[:offset]`表示从列表开头，到从列表结尾倒数第`offset`个元素的前一个元素的切片。也就是说当`offset`为负时，代表从列表结尾倒数第`offset`个元素，其他和`offset`为正时相同。所以列表最后`offset`个元素移动到了列表的开头，实现了列表向左移动`offset`个位数。
