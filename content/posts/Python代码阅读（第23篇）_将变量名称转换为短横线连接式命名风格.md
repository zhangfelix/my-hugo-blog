---
title: Python代码阅读（第23篇）：将变量名称转换为短横线连接式命名风格
date: 2020-08-12T12:10:25+08:00
lastmod: 2020-08-12T12:10:25+08:00
author: Zhang nan
cover: /post/Python代码阅读（第23篇）_将变量名称转换为短横线连接式命名风格-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现将变量名称转换为短横线连接式命名风格（`kebab case`）的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `kebab`

```python
from re import sub

def kebab(s):
  return '-'.join(
    sub(r"(\s|_|-)+"," ",
    sub(r"[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+",
    lambda mo: ' ' + mo.group(0).lower(), s)).split())

# EXAMPLES
kebab('camelCase') # 'camel-case'
kebab('some text') # 'some-text'
kebab('some-mixed_string With spaces_underscores-and-hyphens') # 'some-mixed-string-with-spaces-underscores-and-hyphens'
kebab('AllThe-small Things') # "all-the-small-things"
```

函数kebab接收一个字符串，使用[正则表达式](https://docs.python.org/zh-cn/3.8/library/re.html#module-re)将字符串变形、分解成单词，并加上`-`作为分隔符组合起来。

函数最内层的`re.sub(pattern, repl, string, count=0, flags=0)`函数使用正则表达式将字符串中的单词匹配出来。然后使用`repl`函数`lambda mo: ' ' + mo.group(0).lower()`来处理匹配到的单词，将单词用空格分开，并转换成小写。`repl`函数将匹配信息作为`mo`传入函数，`mo.group(0)`返回匹配到的字符串。

第二层`sub`函数将各种空白字符、下划线以及短横线都先统一替换成空格。然后再将字符串根据空格分割成单词。

最后函数将分割出来的单词使用短横线`'-'`连接起来，即可得到`kebab case`风格的命名字符串。
