---
title: Python代码阅读（第17篇）：列表元素按位合并
date: 2020-07-29T12:30:50+08:00
lastmod: 2020-07-29T12:30:50+08:00
author: Felix
cover: /post/Python代码阅读（第17篇）_列表元素按位合并-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了多个列表按照元素的位置依序合并成一个新的嵌套列表。每个子列表都是原列表对应位置的元素。`zip()`和`itertools.zip_longest()`提供了类似于这段代码的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `merge`

```python
def merge(*args, fill_value=None):
  max_length = max([len(lst) for lst in args])
  result = []
  for i in range(max_length):
    result.append([
      args[k][i] if i < len(args[k]) else fill_value for k in range(len(args))
    ])
  return result

# EXAMPLES
merge(['a', 'b'], [1, 2], [True, False]) # [['a', 1, True], ['b', 2, False]]
merge(['a'], [1, 2], [True, False]) # [['a', 1, True], [None, 2, False]]
merge(['a'], [1, 2], [True, False], fill_value = '_') # [['a', 1, True], ['_', 2, False]]
```

`merge`函数接收多个列表和一个填充值`fill_value`，返回一个嵌套列表。该嵌套列表的元素个数等于最长的输入列表的长度，每个子列表的元素依次来自于输入列表的相同位置，输入列表的元素不足的情况下，使用填充值代替。也就是说`merge_list[0]`是一个列表，其中的元素依次为输入列表索引为`0`的元素。

函数使用`max`结合list comprehension得到参数中最长的列表的长度。结合使用`range()`和`max_length`变量来循环。如果一个列表的长度短于`max_length`，则剩余的项目使用`fill_value`（默认为None）来进行填充。

函数调用同时使用了“关键字参数”和“可变参数”的方式。在第9篇的时候介绍了单独使用“可变参数”调用的方式。一般来说，这些“可变参数”将在形式参数列表的末尾，因为它们收集传递给函数的所有剩余输入参数。出现在`*args`参数之后的任何形式参数都是“仅限关键字参数”。
