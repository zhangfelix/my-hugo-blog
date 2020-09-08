---
title: Python代码阅读（第35篇）：完全（深度）展开嵌套列表
date: 2020-09-08T18:01:47+08:00
lastmod: 2020-09-08T18:01:47+08:00
author: Zhang nan
cover: /post/Python代码阅读（第35篇）_完全（深度）展开嵌套列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将一个嵌套列表的所有嵌套层次完全展开，形成一个简单的列表的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `deep_flatten`

```python
from collections.abc import Iterable

def deep_flatten(lst): 
  return [a for i in lst for a in deep_flatten(i)] if isinstance(lst, Iterable) else [lst]

# EXAMPLES
deep_flatten([1, [2], [[3], 4], 5]) # [1,2,3,4,5]
```

`deep_flatten`函数接收一个嵌套列表，返回完全展开后的列表。函数使用`isinstance()`与`collections.abc.Iterable`来检查一个元素是否可迭代（是否为`list`）。如果是，则在列表推导式内递归调用`deep_flatten()`函数，否则返回`[lst]`。

原函数：

```python
def deep_flatten(lst): 
  return [a for i in lst for a in deep_flatten(i)] if isinstance(lst, Iterable) else [lst]
```

可以改写成：

```python
def deep_flatten(lst): 
  if isinstance(lst, Iterable):
    return [a for i in lst for a in deep_flatten(i)]
  else:
    return [lst]
```

函数判断如果`lst`是可迭代对象的话，就执行`return [a for i in lst for a in deep_flatten(i)]`。这时如果`i`是可迭代对象，在`deep_flatten(i)`中就会继续调用该列表推导式，继续展开嵌套的列表；如果`i`不是可迭代对象，在在`deep_flatten(i)`中就会返回`[i]`，此时`a`的值就是`i`，在列表推导式中就会得到一个非可迭代对象的元素，解开了元素上的嵌套层。

更近一步，函数可以改写成：

```python
from collections.abc import Iterable

def deep_flatten(lst):
  temp = []
  def f(lst):
    if isinstance(lst, Iterable):
      for i in lst:
        for a in f(i):
          temp.append(a)
      return []
    else:
      return [lst]
  f(lst)
  return temp

print(deep_flatten([1, [2], [[3], 4], 5])) # [1,2,3,4,5]
```

