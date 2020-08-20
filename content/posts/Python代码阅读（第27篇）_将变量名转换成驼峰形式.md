---
title: Python代码阅读（第27篇）：将变量名转换成驼峰形式
date: 2020-08-20T17:12:59+08:00
lastmod: 2020-08-20T17:12:59+08:00
author: Zhang nan
cover: /post/Python代码阅读（第27篇）_将变量名转换成驼峰形式-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现将变量名称转换为驼峰形式。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `camel`

```python
from re import sub

def camel(s):
  s = sub(r"(_|-)+", " ", s).title().replace(" ", "")
  return s[0].lower() + s[1:]

# EXAMPLES
camel('some_database_field_name') # 'someDatabaseFieldName'
camel('Some label that needs to be camelized') # 'someLabelThatNeedsToBeCamelized'
camel('some-javascript-property') # 'someJavascriptProperty'
camel('some-mixed_string with spaces_underscores-and-hyphens') # 'someMixedStringWithSpacesUnderscoresAndHyphens'
```

`camel`函数接收一个字符串形式的变量名，并将其转化成驼峰形式。和之前的两个转换函数类似，该函数考虑的是变量形式的字符串，单词与单词之间有相关分隔，并不是直接连续的单词，如`somefunctionname`。

函数先使用`re.sub`函数将字符串中符号形式的分隔符替换成空格形式。然后使用`str.title()`将单词的首字母转换为大写。再使用`str.replace`函数将所有的空格去除，将所有单词连接起来。最后函数返回的时候，将字符串的首字母变为小写。`s[1:]`提取字符串从下标`1`开始到结尾的切片。
