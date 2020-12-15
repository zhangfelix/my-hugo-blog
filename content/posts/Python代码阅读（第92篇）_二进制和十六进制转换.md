---
title: Python代码阅读（第92篇）：二进制和十六进制转换
date: 2020-12-15T12:30:08+08:00
lastmod: 2020-12-15T12:30:08+08:00
author: Felix
cover: /post/Python代码阅读（第92篇）_二进制和十六进制转换.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将十进制数转换为二进制和十六进制表示的方法。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `to_binary`

```py
def to_binary(n):
  return bin(n)

# EXAMPLES
to_binary(100) # 0b1100100
```

`to_binary`函数接收一个十进制数，返回对应的数的二进制表示。

函数直接使用`bin()`函数进行转换。`bin()`函数将一个整数转换为一个前缀为`“0b”`的二进制字符串。

```py
>>> bin(3)
'0b11'
>>> bin(-3)
'-0b11'
```

## `to_hex`

```py
def to_hex(dec):
  return hex(dec)

# EXAMPLES
to_hex(41) # 0x29
to_hex(332) # 0x14c
```

`to_hex`函数接收一个十进制数，返回对应的数的十六进制表示。

函数直接使用`hex()`函数进行转换。`hex()`函数将一个整数转换为一个前缀为`“0x”`的小写十六进制字符串。

```py
>>> hex(255)
'0xff'
>>> hex(-255)
'-0xff'
>>>
```
