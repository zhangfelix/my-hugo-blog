---
title: Python代码阅读（第34篇）：列表元素出现频率字典
date: 2020-09-03T12:27:43+08:00
lastmod: 2020-09-03T12:27:43+08:00
author: Felix
cover: /post/Python代码阅读（第34篇）_列表元素出现频率字典-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了从一个列表生成以其元素为`key`，以该元素出现频率为`value`的字典。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `frequencies`

```python
from functools import reduce

def frequencies(lst):
  f = {}
  for x in lst:
    f[x] = f[x] + 1 if x in f else 1
  return f

# EXAMPLES
frequencies(['a', 'b', 'a', 'c', 'a', 'a', 'b']) # { 'a': 4, 'b': 2, 'c': 1 }
```

`frequencies`函数接收一个列表，返回以该列表元素为`key`，以该元素出现频率为`value`的字典。函数使用`for`循环遍历输入列表，遇到字典中存在的值的时候，将该值对应的`value`加`1`；遇到不存在的值时，将该值作为新的`key`并将`value`设置为`1`。
