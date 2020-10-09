---
title: Python代码阅读（第19篇）：合并多个字典
date: 2020-08-03T09:52:36+08:00
lastmod: 2020-08-03T09:52:36+08:00
author: Felix
cover: /post/Python代码阅读（第19篇）_合并多个字典-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了合并多个字典的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `merge_dictionaries`

```python
def merge_dictionaries(*dicts):
  res = dict()
  for d in dicts:
    res.update(d)
  return res

# EXAMPLES
ages_one = {'Peter': 10, 'Isabel': 11}
ages_two = {'Anna': 9}
merge_dictionaries(ages_one, ages_two) # { "Peter": 10, "Isabel": 11, "Anna": 9 }
```

`merge_dictionaries`函数使用“可变参数”的形式接受多个字典，并返回合并后的字典对象。

`update([other])`使用来自 other 的键/值对更新字典，覆盖原有的键。 返回`None`。`update()`接受另一个字典对象，或者一个包含键/值对（以长度为二的元组或其他可迭代对象表示）的可迭代对象。 如果给出了关键字参数，则会以其所指定的键/值对更新字典：`d.update(red=1, blue=2)`。
