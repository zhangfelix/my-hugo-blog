---
title: Python代码阅读（第69篇）：首字母大小写变换
date: 2020-11-09T12:30:01+08:00
lastmod: 2020-11-09T12:30:01+08:00
author: Felix
cover: /post/Python代码阅读（第69篇）_首字母大小写变换-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将字符串首字母变换成大写，或小写的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `capitalize`

```python
def capitalize(s, lower_rest = False):
  return ''.join([s[:1].upper(), (s[1:].lower() if lower_rest else s[1:])])

# EXAMPLES
capitalize('fooBar') # 'FooBar'
capitalize('fooBar', True) # 'Foobar'
```

`capitalize`函数接收一个字符串和指示标识，返回首字母转换后的字符串。

函数使用列表切片`s[:1]`获取字符串首字母，使用`upper()`函数将其转换成大写。然后根据`lower_rest`值，判断是否需要将剩余字符转换成小写。然后使用`''.join(iterable)`方式以`''`空字符串为分隔元素，将`iterable`中的字符串拼接起来。

当`lower_rest`为缺省值`False`时，剩余字符保持不变；当`lower_rest`传入`True`时，剩余字符都转换成小写。

## `decapitalize`

```python
def decapitalize(s, upper_rest = False):
  return ''.join([s[:1].lower(), (s[1:].upper() if upper_rest else s[1:])])

# EXAMPLES
decapitalize('FooBar') # 'fooBar'
decapitalize('FooBar', True) # 'fOOBAR'
```

`decapitalize`函数和`capitalize`功能相反，实现方式一样。使用`s[:1].lower()`将首字母变换成小写。当`upper_rest`为缺省值`False`时，剩余字符保持不变；当`upper_rest`传入`True`时，剩余字符都转换成大写。
