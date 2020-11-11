---
title: Python代码阅读（第72篇）：回文
date: 2020-11-12T12:26:40+08:00
lastmod: 2020-11-12T12:26:40+08:00
author: Felix
cover: /post/Python代码阅读（第72篇）_回文-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了判断一个字符串是否为回文的功能（忽略特殊字符和大小写）。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `palindrome`

```python
from re import sub

def palindrome(s):
  s = sub('[\W_]', '', s.lower())
  return s == s[::-1]

# EXAMPLES
palindrome('taco cat') # True
```

`palindrome`函数输入一个字符串，返回`True`，如果字符串是回文；返回`False`，如果字符串不是回文。

函数先使用`s.lower()`将字符串转换成小写。再使用正则表达式`'[\W_]'`将输入字符串中的特殊符号替换成空字符串`''`。最后将字符串倒序后与倒序前相比较，相等，则原字符串是回文；不相等，则不是回文。

`re.sub(pattern, repl, string, count=0, flags=0)`返回通过使用`repl`替换在`string`最左边非重叠出现的`pattern`而获得的字符串。 如果样式没有找到，则不加改变地返回`string`。
