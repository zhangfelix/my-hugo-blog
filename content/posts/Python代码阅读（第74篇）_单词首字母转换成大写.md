---
title: Python代码阅读（第74篇）：单词首字母转换成大写
date: 2020-11-16T12:32:51+08:00
lastmod: 2020-11-16T12:32:51+08:00
author: Felix
cover: /post/Python代码阅读（第74篇）_单词首字母转换成大写-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将一个字符串中的每个单词的首字母转换成大写的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `capitalize_every_word`

```python
def capitalize_every_word(s):
  return s.title()

# EXAMPLES
capitalize_every_word('hello world!') # 'Hello World!'
```

`capitalize_every_word`函数接收一个字符串，输出该字符串中每个单词都转换成大写后的形式。

函数使用`s.title()`将字符串中的每个单词的首字母都转换成大写。

`str.title()`函数返回原字符串的标题版本，其中每个单词第一个字母为大写，其余字母为小写。该函数简单的将连续的字母组合视为单词。 它在多数情况下都很有效，但也意味着代表缩写形式与所有格的撇号也会成为单词边界，这可能导致不希望的结果:

```python
>>> "they're bill's friends from the UK".title()
"They'Re Bill'S Friends From The Uk"
```

