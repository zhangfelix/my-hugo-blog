---
title: Python代码阅读（第53篇）：字符串重复拼接
date: 2020-10-16T12:30:55+08:00
lastmod: 2020-10-16T12:30:55+08:00
author: Felix
cover: /post/Python代码阅读（第53篇）_字符串重复拼接-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将字符串重复`n`次的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `n_times_string`

```python
def n_times_string(s, n):
  return (s * n)

# EXAMPLES
n_times_string('py', 4) #'pypypypy'
```

`n_times_string`函数接收一个字符串`s`和重复次数`n`，返回重复之后的字符串。

函数直接使用`*`运算进行字符串重复拼接。字符串同样适用通用序列操作，包括重复拼接。`s * n`或`n * s`的形式相当于`s`与自身进行`n`次拼接。小于`0`的`n`值会被当作`0`来处理 ，生成一个与`s`同类型的空序列。

```python
>>> s = "123"
>>> s * 3
'123123123'
>>> s * 0
''
>>> s * -1
''
```

