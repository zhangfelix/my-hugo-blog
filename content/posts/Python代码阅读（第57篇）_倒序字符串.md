---
title: Python代码阅读（第57篇）：倒序字符串
date: 2020-10-22T12:30:39+08:00
lastmod: 2020-10-22T12:30:39+08:00
author: Felix
cover: /post/Python代码阅读（第57篇）_倒序字符串-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了字符串倒序输出的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `reverse_string`

```python
def reverse_string(s):
  return s[::-1]

# EXAMPLES
reverse_string("snippet") #"teppins" 
```

`reverse_string`函数接收一个字符串，返回它的倒序形式。

函数使用的是类似列表的切片方式，通过`-1`的步长将字符串倒序。字符串属于一种不可变序列，除了字符串类型自身的方法以外，也实现了[通用序列的操作](https://docs.python.org/zh-cn/3/library/stdtypes.html#common-sequence-operations)，包括切片等。
