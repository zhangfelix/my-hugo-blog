---
title: Python代码阅读（第80篇）：n天后的日期
date: 2020-11-24T12:15:47+08:00
lastmod: 2020-11-24T12:15:47+08:00
author: Felix
cover: /post/Python代码阅读（第80篇）_n天后的日期-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码使用日期类型实现了计算`n`天后的日期的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `days_from_now`

```python
from datetime import timedelta, date

def days_from_now(n):
  return date.today() + timedelta(n)

# EXAMPLES
days_from_now(5) # date(2020, 11, 02)
```

`days_from_now`函数接收一个天数`n`，返回`n`天后的日期。

函数使用`date.today()`获取今天的日期表示，然后通过`date2 = date1 + timedelta`运算，计算`n`天后的日期。