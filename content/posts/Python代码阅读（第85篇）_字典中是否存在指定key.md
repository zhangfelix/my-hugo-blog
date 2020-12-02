---
title: Python代码阅读（第85篇）：字典中是否存在指定key
date: 2020-12-02T12:26:09+08:00
lastmod: 2020-12-02T12:26:09+08:00
author: Felix
cover: /post/Python代码阅读（第85篇）_字典中是否存在指定key-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了判断指定`key`是否在指定字典中存在的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `key_in_dict`

```py
def key_in_dict(d, key):
  return (key in d)

# EXAMPLES
d = {'one': 1, 'three': 3, 'five': 5, 'two': 2, 'four': 4}
key_in_dict(d, 'three') # True
```

`key_in_dict`函数接收一个字典`d`和一个`key`，返回提供的字典中是否包含该`key`。

函数使用`in`关键词判断字典`d`中是否包含`key`。对于字典类型而言，这种判断`key in d`只会在字典键中搜索判断。如果`d`中存在键`key`则返回`True`，否则返回`False`。