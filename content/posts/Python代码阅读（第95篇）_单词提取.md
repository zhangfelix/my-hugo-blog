---
title: Python代码阅读（第95篇）：单词提取
date: 2020-12-21T12:30:05+08:00
lastmod: 2020-12-21T12:30:05+08:00
author: Felix
cover: /post/Python代码阅读（第95篇）_单词提取-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了从字符串中提取单词的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## words

```py
import re

def words(s, pattern = '[a-zA-Z-]+'):
  return re.findall(pattern, s)

# EXAMPLES
words('I love Python!!') # ['I', 'love', 'Python']
words('python, javaScript & coffee') # ['python', 'javaScript', 'coffee']
words('build -q --out one-item', r'\b[a-zA-Z-]+\b')
# ['build', 'q', 'out', 'one-item']
```

`words`函数接收一个字符串和一个可选的正则表达式，返回提取出来的单词列表。

函数使用`re.findall()`来获取所有满足条件的字符串（即单词），形成一个列表。

`re.findall(pattern, string, flags=0)`对`string`返回一个不重复的`pattern`的匹配列表，`string`从左到右进行扫描，匹配按找到的顺序返回。

默认的正则表达式参数`'[a-zA-Z-]+'`匹配所有的字母以及“-”符号组成的字符串，适合大部分情况。对于特殊情况也可以自定义正则表达式，例如`example`中的`r'\b[a-zA-Z-]+\b'`，匹配`\w`（`[a-zA-Z0-9_]`）定义的单词的开头或结尾，所以这个表达式匹配开头结尾为字母的由字母和短横线组成的单词。

实际上`words`函数定义了一个默认的正则表达式，来提取常见情况的单词。其内部直接调用了`re.findall()`，所以，可以使用任意正则表达式达到其他的目的。
