---
title: Python代码阅读（第18篇）：变形词判断
date: 2020-07-30T12:33:09+08:00
lastmod: 2020-07-30T12:33:09+08:00
author: Zhang nan
cover: /post/Python代码阅读（第18篇）_变形词判断-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了判断两个字符串是否互为变形词的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `is_anagram`

```python
from collections import Counter

def is_anagram(s1, s2):
  return Counter(
    c.lower() for c in s1 if c.isalnum()
  ) == Counter(
    c.lower() for c in s2 if c.isalnum()
  )

# EXAMPLES
is_anagram("#anagram", "Nag a ram!")  # True
```

`is_anagram`函数输入两个字符串，检查一个字符串是否是另一个字符串的变形词（不区分大小写，忽略空格、标点符号和特殊字符）。函数依次判断输入字符串中的字符是否是字母或数字，并通过`Counter`生成字母和数字的计数字典。通过比较根据两个输入字符串创建的字典，判断他们是否互为变体。当技术字典相同时，表示两个输入字符串包含相同的字母或数字，并且他们的计数相同，两个输入字符串互为变形词。

`class collections.Counter([iterable-or-mapping])`接收一个可迭代对象，并返回一个`dict`的子类，用于计数可哈希对象。它是一个集合，元素像字典键(key)一样存储，它们的计数存储为值。计数可以是任何整数值，包括0和负数。它可以接收一个可迭代对象，并对其元素进行计数。

`str.isalnum()`如果字符串中的所有字符都是字母或数字且至少有一个字符，则返回`True`， 否则返回`False`。

`str.lower()`函数返回原字符串的副本，其所有区分大小写的字符均转换为小写。
