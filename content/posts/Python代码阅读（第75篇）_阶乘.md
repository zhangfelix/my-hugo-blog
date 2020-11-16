---
title: Python代码阅读（第75篇）：阶乘
date: 2020-11-17T12:37:59+08:00
lastmod: 2020-11-17T12:37:59+08:00
author: Felix
cover: /post/Python代码阅读（第75篇）_阶乘-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了阶乘的计算功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `factorial`

```python
def factorial(num):
  if not ((num >= 0) and (num % 1 == 0)):
    raise Exception("Number can't be floating point or negative.")
  return 1 if num == 0 else num * factorial(num - 1)

# EXAMPLES
factorial(6) # 720
```

`factorial`函数接收一个数字，返回该数字的阶乘结果。

函数首先判断数字是否大于`0`，是否为整数（`num % 1 == 0`）。然后采用递归的方式进行求值，并给出递归终止条件（`num == 0`）。
