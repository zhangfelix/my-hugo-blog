---
title: Python代码阅读：根据过滤器拆分列表
date: 2020-06-23T21:45:19+08:00
lastmod: 2020-06-23T21:45:19+08:00
author: Zhang nan
cover: /post/Python代码阅读_根据过滤器拆分列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本文中的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `bifurcate`

```python
def bifurcate(lst, filter):
  return [
    [x for i, x in enumerate(lst) if filter[i] == True],
    [x for i, x in enumerate(lst) if filter[i] == False]
  ]

# EXAMPLES
bifurcate(['beep', 'boop', 'foo', 'bar'], [True, True, False, True]) # [ ['beep', 'boop', 'bar'], ['foo'] ]
```

`bifurcate`函数通过一个过滤器`filter`定义的内容，将输入列表`lst`分成两组。将`filter`中为`True`的对应的`lst`的项放入结果的第一个列表中，将`filter`中为`False`的对应的`lst`的项放入结果的第二个列表中。

## `enumerate`

```python
enumerate(iterable, start=0)
```

`enumerate`函数接收一个可迭代对象，并返回一个迭代对象。该迭代对象每次迭代返回一个元组，该元组包括一个序号和接收的可迭代对象的迭代值。`start`参数用于设定序号的初始值，默认为`0`。示例使用为：

```python
>>> seasons = ['Spring', 'Summer', 'Fall', 'Winter']
>>> list(enumerate(seasons))
[(0, 'Spring'), (1, 'Summer'), (2, 'Fall'), (3, 'Winter')]
>>> list(enumerate(seasons, start=1))
[(1, 'Spring'), (2, 'Summer'), (3, 'Fall'), (4, 'Winter')]
```

`enumerate`函数的实现逻辑相当于如下代码：

```python
def enumerate(sequence, start=0):
    n = start
    for elem in sequence:
        yield n, elem
        n += 1
```

## 列表推导式

该函数使用列表推导式判断`lst`里面值对应位置的`filter`的值，并生成对应的分组列表。

列表推导式的简单介绍可以查看[Python代码阅读：过滤掉列表中的唯一值](https://www.zhangfelix.com/posts/python代码阅读_过滤掉列表中的唯一值/)中的“列表推导式”章节。
