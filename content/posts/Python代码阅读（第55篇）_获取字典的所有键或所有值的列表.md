---
title: Python代码阅读（第55篇）：获取字典的所有键或所有值的列表
date: 2020-10-20T12:37:57+08:00
lastmod: 2020-10-20T12:37:57+08:00
author: Felix
cover: /post/Python代码阅读（第55篇）_获取字典的所有键或所有值的列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码分别生成了给定字典的键、值列表。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `keys_only`

```python
def keys_only(flat_dict):
  return list(flat_dict.keys())

# EXAMPLES
ages = {
  "Peter": 10,
  "Isabel": 11,
  "Anna": 9,
}
keys_only(ages) # ['Peter', 'Isabel', 'Anna']
```

`keys_only`函数接收一个字典，返回该字典的键组成的列表。

函数使用`dict.keys()`方法获得字典键的视图对象，该对象可以被迭代，因此可以使用`list()`生成对应的列表。

## `values_only`

```python
def values_only(flat_dict):
  return list(flat_dict.values())

# EXAMPLES
ages = {
  "Peter": 10,
  "Isabel": 11,
  "Anna": 9,
}
values_only(ages) # [10, 11, 9]
```

`keys_only`函数接收一个字典，返回该字典的值组成的列表。

和`keys_only`函数一样，使用`dict.values()`会生成字典值组成的视图对象。然后使用`list()`生成对应的列表。
