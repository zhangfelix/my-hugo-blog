---
title: Python代码阅读（第78篇）：获取n天前的日期
date: 2020-11-20T12:24:12+08:00
lastmod: 2020-11-20T12:24:12+08:00
author: Felix
cover: /post/Python代码阅读（第78篇）_获取n天前的日期-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码在日期类型上实现了获取`n`天前的日期的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `days_ago`

```python
from datetime import timedelta, date

def days_ago(n):
  return date.today() - timedelta(n)

# EXAMPLES
days_ago(5) # date(2020, 10, 23)
```

`days_ago`函数接收一个整数`n`，返回`n`天前的日期。

函数使用`date.today()`获取几天的日期，再使用`date2 = date1 - timedelta`运算方式计算`n`天前的日期。

具体`datetime`模块的内容和相关的计算规则可以查看`Python`的[官方文档](https://docs.python.org/zh-cn/3/library/datetime.html)。
