---
title: Python代码阅读（第28篇）：计算列表中位数
date: 2020-08-25T16:32:43+08:00
lastmod: 2020-08-25T16:32:43+08:00
author: Felix
cover: /post/Python代码阅读（第28篇）_计算列表中位数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现计算列表中位数的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `median`

```python
def median(list):
  list.sort()
  list_length = len(list)
  if list_length % 2 == 0:
    return (list[int(list_length / 2) - 1] + list[int(list_length / 2)]) / 2
  return list[int(list_length / 2)]

# EXAMPLES
median([1,2,3]) # 2
median([1,2,3,4]) # 2.5
```

`median`函数接收一个列表，然后计算其中位数并返回。

中位数可以将一个数集、一个列表分成数量相等的上下两部分。对一组有限个数的数据来说，其中位数是这样的一种数：这群数据的一半的数据比它大，而另外一半数据比它小。

计算有限列表的中位数首先需要讲列表排序。如果数据的个数是奇数，则中间那个数据就是这群数据的中位数；如果数据的个数是偶数，则中间那2个数据的算术平均值就是这群数据的中位数。

函数`median`首先将列表排序，然后根据列表长度是否为偶数（`list_length % 2 == 0`），使用不同的方式计算中位数。`%`是取余的计算符。

_列表长度是偶数的情况：_

因为列表下标从`0`开始计算，所以`list_length / 2`和`(list_length / 2) - 1`分别为列表中间的两个数。这两个数的算数平均数就是中位数。

_当列表长度是奇数的情况：_

列表长度无法被`2`整除，使用`int()`强制转换，会向零舍入（如果是正数就向下取整，如果是负数就向上取整）。因此`int(list_length / 2)`就是列表中间的数，即中位数。

`n`为奇数的时候，`int(n/2) = (n-1)/2`为整数。列表开始下标为`0`，结尾下标是`n-1`，因为`(n-1)/2 - 0 = (n-1) - (n-1)/2`，所以`(n-1)/2`是中位数的下标。


