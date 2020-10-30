---
title: Python代码阅读（第63篇）：数字奇偶性
date: 2020-10-30T18:35:31+08:00
lastmod: 2020-10-30T18:35:31+08:00
author: Felix
cover: /post/Python代码阅读（第63篇）_数字奇偶性-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了判断数字的奇偶性质，以及扩展判断一个数字能否被另一个数字整除的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `is_odd`

```python
def is_odd(num):
  return num % 2 != 0

# EXAMPLES
is_odd(3) # True
```

`is_odd`函数接收一个数字，返回这个数字是否是奇数。

函数使用`%`运算符进行取余计算。奇数无法被`2`整除，所以使用`%`取余不等于`0`。

## `is_even`

```python
def is_even(num):
  return num % 2 == 0

# EXAMPLES
is_even(3) # False
```

`is_even`函数和`is_odd`函数类似，使用`%`判断是否可以被`2`整除。

## `is_divisible`

```python
def is_divisible(dividend, divisor):
  return dividend % divisor == 0

# EXAMPLES
is_divisible(6, 3) # True
```

`is_divisible`函数扩展了前两个函数，使用指定的`divisor`进行取余计算。判断`dividend`能否被`divisor`整除。
