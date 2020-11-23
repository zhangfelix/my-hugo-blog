---
title: Python代码阅读（第79篇）：日期差计算
date: 2020-11-23T18:35:08+08:00
lastmod: 2020-11-23T18:35:08+08:00
author: Felix
cover: /post/Python代码阅读（第79篇）_日期差计算-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码在日期类型上实现了日期差的计算（按天作为单位以及按月作为单位）。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `days_diff`

```python
def days_diff(start, end):
  return (end - start).days

# EXAMPLES
from datetime import date

days_diff(date(2020, 10, 25), date(2020, 10, 28)) # 3
```

`days_diff`函数接收一个开始日期和一个结束日期，返回两个日期相差的天数。

函数直接使用`timedelta = date1 - date2`运算方式计算日期差，然后通过`timedelta`的`days`属性获取相差的天数。

## `months_diff`

```py
from math import ceil

def months_diff(start, end):
  return ceil((end - start).days / 30)

# EXAMPLES
from datetime import date

months_diff(date(2020, 10, 28), date(2020, 11, 25)) # 1
```

`months_diff`函数在`days_diff`基础上除以`30`，并通过`math.ceil(x)`取大于等于`x`的最大整数。也就是说不满一个月的，按照一个月计算。

```py
from math import ceil

def days_diff(start, end):
  return (end - start).days

def months_diff(start, end):
  return ceil((end - start).days / 30)
```

