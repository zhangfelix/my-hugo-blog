---
title: Python代码阅读（第58篇）：压缩列表
date: 2020-10-23T18:31:46+08:00
lastmod: 2020-10-23T18:31:46+08:00
author: Felix
cover: /post/Python代码阅读（第58篇）_压缩列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了去除列表中的“假值”的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `compact`

```python
def compact(lst):
  return list(filter(None, lst))

# EXAMPLES
compact([0, 1, False, 2, '', 3, 'a', 's', 34]) # [ 1, 2, 3, 'a', 's', 34 ]
```

`compact`函数接收一个列表，返回去除“假值”之后的列表。

函数使用`filter`函数返回一个新的迭代器，再使用`list`函数生成新的列表。

`filter(function, iterable)`函数用`iterable`中函数`function`返回真的那些元素，构建一个新的迭代器。`iterable`可以是一个序列，一个支持迭代的容器，或一个迭代器。如果`function`是`None`，则会假设它是一个身份函数，即`iterable`中所有返回假的元素会被移除。也就是如下的生成器表达式。

```python
(item for item in iterable if item)
```

