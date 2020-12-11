---
title: Python代码阅读（第90篇）：将字符串转换成URL友好形式
date: 2020-12-11T18:10:11+08:00
lastmod: 2020-12-11T18:10:11+08:00
author: Felix
cover: /post/Python代码阅读（第90篇）_将字符串转换成URL友好形式-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将给定字符串转换成URL友好形式的功能。即将字符串转换成小写，移除前后的空格，使用`-`链接各个单词，并移除所有特殊字符。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `slugify`

```py
import re

def slugify(s):
  s = s.lower().strip()
  s = re.sub(r'[^\w\s-]', '', s)
  s = re.sub(r'[\s_-]+', '-', s)
  s = re.sub(r'^-+|-+$', '', s)
  return s

# EXAMPLES
slugify('Hello World!') # 'hello-world'
```

`slugify`函数接收一个字符串，并将其转换成URL友好的形式。函数将字符串转换成小写，移除前后的空格，使用`-`链接各个单词，并移除所有特殊字符。

函数首先使用`str.lower()`和`str.strip()`规范化输入字符串，将其都变为小写，并移除开头和结尾的空格符。

然后使用使用三次`re.sub()`将字符串中的空格、破折号和下划线替换为`-`，并删除特殊字符。

1. `re. .sub(r'[^\w\s-]', '', s)`会移除字符串中的非单词字符和非空白字符，保留`-`。也就是说移除所有特殊符号，除了`-`，例如标点等。注意，下划线`_`算作单词字符。也就是说`[^\w] = [^a-zA-Z0-9_]`。空白字符则包括`[ \t\n\r\f\v]`等。
2. `re.sub(r'[\s_-]+', '-', s)`将所有空白字符、`-`和`_`的一个或多个组合替换成`-`。
3. `re.sub(r'^-+|-+$', '', s)`将所有开头和结尾的一个或多个`-`移除。
