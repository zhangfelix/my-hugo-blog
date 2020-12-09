---
title: Python代码阅读（第88篇）：获取多个字典的特定键值
date: 2020-12-09T19:59:29+08:00
lastmod: 2020-12-09T19:59:29+08:00
author: Felix
cover: /post/Python代码阅读（第88篇）_获取多个字典的特定键值-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了从多个字典中获取特定键键值的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `pluck`

```py
def pluck(lst, key):
  return [x.get(key) for x in lst]

# EXAMPLES
simpsons = [
  { 'name': 'lisa', 'age': 8 },
  { 'name': 'homer', 'age': 36 },
  { 'name': 'marge', 'age': 34 },
  { 'name': 'bart', 'age': 10 }
]
pluck(simpsons, 'age') # [8, 36, 34, 10]
```

`pluck`函数接收一个字典列表和一个指定键，返回所有输入列表中该键对应的值的列表。

函数使用列表推导式和`dict.get(x)`的方式获取字典中对应键的值。

`dict.get(key[, default])`如果`key`存在于字典中则返回`key`的值，否则返回`default`。 如果`default`未给出则默认为`None`，
