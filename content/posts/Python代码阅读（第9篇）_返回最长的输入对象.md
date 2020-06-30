---
title: Python代码阅读（第9篇）：返回最长的输入对象
date: 2020-06-30T12:03:09+08:00
lastmod: 2020-06-30T12:03:09+08:00
author: Zhang nan
cover: /post/Python代码阅读（第9篇）_返回最长的输入对象-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码的功能是返回最长输入对象。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `longest_item`

```python
def longest_item(*args):
  return max(args, key=len)

# EXAMPLES
longest_item('this', 'is', 'a', 'testcase') # 'testcase'
longest_item([1, 2, 3], [1, 2], [1, 2, 3, 4, 5]) # [1, 2, 3, 4, 5]
longest_item([1, 2, 3], 'foobar') # 'foobar'
```

`longest_item`函数可以接收不限个数个可迭代对象或者含有`len`属性的对象，并返回其中最长的那个。如果有多个最长的对象，返回第一个。

## `max`

`max`是个Python内置函数。它包括两种形式`max(iterable, *[, key, default])`和`max(arg1, arg2, *args[, key])`。第一种形式的`max`返回可迭代对象中最大的元素，第二种形式返回两个及以上实参中较大的那个。如果有多个最大元素，则此函数将返回第一个找到的。`key`关键词参数指定排序的依据，也就是按照什么属性进行排序。

## `*args`可变参数

在`longest_item`和`max`中都出现了`*args`参数。这个不是一些其他编程语言中的指针。它是一种特殊的参数传递方式。使用这种形式的参数可以将任意数量的参数传递给函数。这些参数会被包含在一个元组里面。在函数中，就可以使用`args`来获取这个元组。那么在`longest_item`函数中，调用的`max`是哪种形式的呢？
