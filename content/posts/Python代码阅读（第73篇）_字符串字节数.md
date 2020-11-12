---
title: Python代码阅读（第73篇）：字符串字节数
date: 2020-11-12T12:30:49+08:00
lastmod: 2020-11-12T12:30:49+08:00
author: Felix
cover: /post/Python代码阅读（第73篇）_字符串字节数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了计算一个字符串编码后的字节数的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `byte_size`

```python
def byte_size(s):
  return len(s.encode('utf-8'))

# EXAMPLES
byte_size('😀') # 4
byte_size('Hello World') # 11
```

`byte_size`函数接收一个字符串，返回该字符串的字节数。

函数使用`s.encode()`将一个字符串进行编码，然后使用`len()`返回编码后的长度。此处指定编码为`utf-8`。

`str.encode(encoding="utf-8", errors="strict")`函数返回原字符串编码为字节串对象的版本。默认编码为`utf-8`。
