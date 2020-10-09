---
title: Python代码阅读（第32篇）：随机返回列表中的一个元素
date: 2020-09-01T17:59:26+08:00
lastmod: 2020-09-01T17:59:26+08:00
author: Felix
cover: /post/Python代码阅读（第32篇）_随机返回列表中的一个元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了返回列表中的一个随机元素的功能。

`random.sample()`提供了类似于这个代码片段的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `sample`

```python
from random import randint

def sample(lst):
  return lst[randint(0, len(lst) - 1)]

# EXAMPLES
sample([3, 7, 9, 11]) # 9
```

`sample`函数接收一个列表，返回其中一个随机元素。函数使用`random.randint()`生成一个与列表中的索引相对应的随机数，返回该索引处的元素。

`random.randint(a, b)`函数返回随机整数`N`满足`a <= N <= b`。
