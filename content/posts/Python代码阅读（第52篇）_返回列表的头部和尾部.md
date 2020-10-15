---
title: Python代码阅读（第52篇）：返回列表的头部和尾部
date: 2020-10-15T19:02:33+08:00
lastmod: 2020-10-15T19:02:33+08:00
author: Felix
cover: /post/Python代码阅读（第52篇）_返回列表的头部和尾部-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了返回除了最后一个以外，列表所有元素；以及返回除了第一个以外，列表所有元素的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `initial`

```python
def initial(lst):
  return lst[0:-1]

# EXAMPLES
initial([1, 2, 3]) # [1,2]
```

`initial`函数接收一个列表，返回去除最后一个元素的新列表。

函数使用列表切片来获取新列表。在形如`s[i:j]`的列表切片中，如果`i`或`j`为负值，则索引顺序是相对于序列`s`的末尾: 索引号会被替换为`len(s) + i`或`len(s) + j`。 但要注意`-0`仍然为`0`。

## `tail`

```python
def tail(lst):
  return lst[1:] if len(lst) > 1 else lst

# EXAMPLES
tail([1, 2, 3]) # [2,3]
tail([1]) # [1]
```

相对应的函数`tail`一样使用列表切片的方式提取新列表。这里的用法比较常见，就是从索引`1`开始进行切片即可。需要注意的是，如果原列表的长度等于`1`，该函数返回原列表。
