---
title: Python代码阅读（第87篇）_字符串填充
date: 2020-12-07T19:16:09+08:00
lastmod: 2020-12-07T19:16:09+08:00
author: Felix
cover: /post/Python代码阅读（第87篇）_字符串填充-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了使用指定字符在字符串两边填充至指定长度的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `pad`

```py
from math import floor

def pad(s, length, char = ' '):
  return s.rjust(floor((len(s) + length)/2), char).ljust(length, char)

# EXAMPLES
pad('cat', 8) # '  cat   '
pad('42', 6, '0') # '004200'
pad('foobar', 3) # 'foobar'
```

`pad`函数接收一个字符串、指定长度和填充字符，返回填充后的字符串。如果原字符串的长度短于指定的长度，则用指定的字符在字符串的两边进行填充。

函数先使用右对齐，并使用指定字符串填充左边的空位。再使用左对齐，并使用指定字符串填充右边的空位。

- 针对右对齐。如果函数指定的长度小于字符串长度，那么`(len(s) + length)/2 < len(s)`无需填充；如果长度大于字符串长度，那么需要填充的长度为`(len(s) + length)/2 - len(s) = (length - len(s))/2`，也就是说左侧填充长度是指定长度减去字符串长度后的一半，符合函数要求。
- 针对左对齐。在已经正确填充左侧之后，直接使用指定长度，填充字符串右侧。特别的，当指定的长度小于字符串长度时，不做填充。

```py
>>> s.rjust(6, '#')
'###123'
>>> s.ljust(9, '#')
'123######'
>>> s.rjust(6, '#')
'###123'
>>> s.ljust(6, '#')
'123###'
>>> s.rjust(6, '#').ljust(9, '#')
'###123###'
```

