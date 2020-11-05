---
title: Python代码阅读（第68篇）：指定值出现次数
date: 2020-11-06T12:30:01+08:00
lastmod: 2020-11-06T12:30:01+08:00
author: Felix
cover: /post/Python代码阅读（第68篇）_指定值出现次数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了计算列表中给定值出现次数的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `count_occurences`

```python
def count_occurrences(lst, val):
  return len([x for x in lst if x == val and type(x) == type(val)])

# EXAMPLES
count_occurrences([1, 1, 2, 1, 2, 3], 1) # 3
```

`count_occurences`函数接收一个列表和一个指定值，返回指定值出现的次数。

函数内部使用列表推导式遍历接收到的列表，并提取列表中和指定值大小相同，类型一样的元素，形成新的列表。最后通过获取新列表的长度，计算接收列表中指定值的出现次数。