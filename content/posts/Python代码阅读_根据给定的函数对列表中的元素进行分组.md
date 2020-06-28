---
title: Python代码阅读：根据给定的函数对列表中的元素进行分组
date: 2020-06-28T09:30:57+08:00
lastmod: 2020-06-28T09:30:57+08:00
author: Zhang nan
cover: /post/Python代码阅读_根据给定的函数对列表中的元素进行分组-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本文中的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `group_by`

```python
def group_by(lst, fn):
  return {key : [el for el in lst if fn(el) == key] for key in map(fn, lst)}

# EXAMPLES
from math import floor
group_by([6.1, 4.2, 6.3], floor) # {4: [4.2], 6: [6.1, 6.3]}
group_by(['one', 'two', 'three'], len) # {3: ['one', 'two'], 5: ['three']}
```

`group_by`接收一个列表和一个函数`fn`，返回一个分组字典。函数中的字典推导式使用`map`将`fn`应用于列表中的元素上以生成返回字典的`key`。同时使用列表推导式生成生成每个`key`对应的分组列表。

字典推导式有`{ key_expr: value_expr for value in collection if condition }`这样的形式。`group_by`函数中字典推导式的`value_expr`是一个列表，该列表使用了列表推导式来生成。即

```python
{ key_expr: [x for x in collection2 if condition2] for value in collection1 if condition1 }
```

同时，我们可以看到根据`group_by`代码中的字典推导式，可能计算出`key`相同的项，根据[Pyrhon中字典的类型的规则](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)，`key`相同的，只保留最新的`key-value`对。实际上当`key`相同时，`value`值也一样。`[el for el in lst if fn(el) == key]`推导式的`for`语句中只有`key`一个变量。

```python
>>> d = {'one': 1, 'two': 2, 'three': 3, 'two': 2}
>>> d
{'one': 1, 'two': 2, 'three': 3}
>>> d = {'one': 1, 'two': 2, 'three': 3, 'two': 22}
>>> d
{'one': 1, 'two': 22, 'three': 3}
>>>
```

