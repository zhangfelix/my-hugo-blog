---
title: Python代码阅读（第77篇）：生成指定日期之间的日期列表
date: 2020-11-17T16:10:19+08:00
lastmod: 2020-11-17T16:10:19+08:00
author: Felix
cover: /post/Python代码阅读（第77篇）_生成指定日期之间的日期列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码在日期类型上实现了类似`range`的功能，生成一个在两个指定日期之间的日期列表。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `daterange`

```python
from datetime import timedelta, date

def daterange(start, end):
  return [start + timedelta(n) for n in range(int((end - start).days))]

# EXAMPLES
from datetime import date

daterange(date(2020, 10, 1), date(2020, 10, 5)) 
# [date(2020, 10, 1), date(2020, 10, 2), date(2020, 10, 3), date(2020, 10, 4)]
```

`daterange`函数接收一个开始日期和一个终止日期，返回这两个日期之间的日期列表，包括开始日期，不包括终止日期。

函数使用`datetime`模块里的类型和方法对日期进行处理。
1. 首先将两个`date`类型的日期相减，得到`timedelta`类型的日期差值`timedelta = date1 - date2`。
2. 然后通过`timedelta`的`days`属性获取相差的天数。
3. 将天数差值转换为`int`数据后，通过`range`函数生成一个从零开始的可迭代对象，并用`for`语句进行访问。
4. 最后使用`date2 = date1 + timedelta`的运算形式，通过对开始日期加上相差日期，计算中间的日期。最后形成一个`date`类型的列表。

具体`datetime`模块的内容和相关的计算规则可以查看`Python`的[官方文档](https://docs.python.org/zh-cn/3/library/datetime.html)。
