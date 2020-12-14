---
title: Python代码阅读（第91篇）：连续底数相同幂数之和
date: 2020-12-14T18:19:31+08:00
lastmod: 2020-12-14T18:19:31+08:00
author: Felix
cover: /post/Python代码阅读（第91篇）_连续底数相同幂数之和-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了对连续底数计算相同的幂数，并求和的功能。即`a^b + (a + 1)^b + (a + 2)^b + ... + (a + n) ^ b`。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `sum_of_powers`

```py
def sum_of_powers(end, power = 2, start = 1):
  return sum([(i) ** power for i in range(start, end + 1)])

# EXAMPLES
sum_of_powers(10) # 385
sum_of_powers(10, 3) # 3025
sum_of_powers(10, 3, 5) # 2925
```

函数接收一个截止数`end`，一个起始数`start`和一个幂数`power`，返回从`start`至`end`的数字的`power`次幂的和。

函数使用列表推导式，生成每个数字的`power`次幂的值。再使用`sum(lst)`计算它们的和。

函数入参中第二个参数`power`默认值为`2`，第三个参数`start`的默认值为`1`。
