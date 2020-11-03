---
title: Python代码阅读（第65篇）：根据条件应用指定函数
date: 2020-11-03T12:30:06+08:00
lastmod: 2020-11-03T12:30:06+08:00
author: Felix
cover: /post/Python代码阅读（第65篇）_根据条件应用指定函数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码可以构造一个函数，在其入参满足条件函数的情况下，对其应用指定函数。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `when`

```python
def when(predicate, when_true):
  return lambda x: when_true(x) if predicate(x) else x

# EXAMPLES
double_even_numbers = when(lambda x: x % 2 == 0, lambda x : x * 2)
double_even_numbers(2) # 4
double_even_numbers(1) # 1
```

`when`函数接收一个谓词判断函数和一个应用函数，返回一个新的函数。新的函数使用判断函数检测入参，满足条件的情况下，调用应用函数。

函数使用`lambda`表达式返回一个新的函数。该匿名函数接收参数`x`，如果通过`predicate(x)`的判断，则返回调用`when_true(x)`的结果；如果不通过，则直接返回`x`。

示例中，使用`lambda x: x % 2 == 0`作为判断函数，该函数接收一个参数`x`，返回`x % 2 == 0`。即如果`x`是偶数，返回`True`；如果`x`是奇数，返回`False`。

使用`lambda x : x * 2`最为应用函数。该函数接收一个参数`x`，并将其乘以`2`。
