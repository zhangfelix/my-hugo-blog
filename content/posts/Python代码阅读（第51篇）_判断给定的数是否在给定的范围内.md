---
title: Python代码阅读（第51篇）：判断给定的数是否在给定的范围内
date: 2020-10-14T12:30:56+08:00
lastmod: 2020-10-14T12:30:56+08:00
author: Felix
cover: /post/Python代码阅读（第51篇）_判断给定的数是否在给定的范围内-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了判断给定的数是否在给定的范围内的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `in_range`

```python
def in_range(n, start, end = 0):
  return start <= n <= end if end >= start else end <= n <= start

# EXAMPLES
in_range(3, 2, 5) # True
in_range(3, 4) # True
in_range(2, 3, 5) # False
in_range(3, 2) # False
```

`in_range`函数接收一个指定的数，和由两个数指定的取值范围，返回指定的数是否在该取值范围之内。`end`参数的默认取值为`0`。

函数使用条件表达式来对`n`是否在指定的范围内进行判断。条件表达式先判断给定范围的两端`start`和`end`的大小关系。然后使用不同的顺序对`n`、`start`和`end`的大小进行判断。

条件表达式（有时称为“三元运算符”）在所有`Python`运算中具有最低的优先级。

表达式`x if C else y`首先是对条件`C`而非`x`求值。 如果`C`为真，`x`将被求值并返回其值；否则将对`y`求值并返回其值。
