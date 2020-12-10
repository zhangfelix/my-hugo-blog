---
title: Python代码阅读（第89篇）：数字填充
date: 2020-12-10T12:36:02+08:00
lastmod: 2020-12-10T12:36:02+08:00
author: Felix
cover: /post/Python代码阅读（第89篇）_数字填充-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了在给定数字前面填充`0`，至指定长度的功能。对于负数，会在符号之后填充`0`。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `pad_number`

```py
def pad_number(n, l):
  return str(n).zfill(l)

# EXAMPLES
pad_number(1234, 6) # '001234'
pad_number(-1234, 6) # '-01234'
pad_number(+1234, 6) # '001234'
```

`pad_number`函数接收一个数字和一个指定长度，返回将数字填充到指定长度的字符串。该字符串使用`'0'`在数字字符串前面填充。

函数将数字转换为字符串并使用`str.zfill()`函数进行填充。

`str.zfill(width)`返回原字符串的副本，在左边填充`ASCII '0'`数码使其长度变为`width`。 正负值前缀 (`'+'/'-'`) 的处理方式是在正负符号之后填充而非在之前。 如果`width`小于等于`len(s)`则返回原字符串的副本。

```py
>>> "42".zfill(5)
'00042'
>>> "-42".zfill(5)
'-0042'
>>> "+42".zfill(5)
'+0042'
```

在`pad_number`函数中`'+'`不在出现的原因是`str(int)`转化过程中，会省略`'+'`。
