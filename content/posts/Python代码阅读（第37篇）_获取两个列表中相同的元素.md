---
title: Python代码阅读（第37篇）：获取两个列表中相同的元素
date: 2020-09-10T12:54:58+08:00
lastmod: 2020-09-10T12:54:58+08:00
author: Zhang nan
cover: /post/Python代码阅读（第37篇）_获取两个列表中相同的元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了返回两个列表中相同元素的列表的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `similarity`

```python
def similarity(a, b):
  return [item for item in a if item in b]

# EXAMPLES
similarity([1, 2, 3], [1, 2, 4]) # [1, 2]
```

`similarity`函数接收两个列表，返回由两个列表中的相同元素组成的列表。

函数使用列表推导式，遍历所有`a`列表中的元素，使用`in`关键词判断这些元素是否在`b`列表中存在。