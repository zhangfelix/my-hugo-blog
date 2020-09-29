---
title: Python代码阅读（第47篇）：从列表右边开始执行给定函数
date: 2020-09-29T18:31:39+08:00
lastmod: 2020-09-29T18:32:39+08:00
author: Zhang nan
cover: /post/Python代码阅读（第47篇）_从列表右边开始执行给定函数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将给定的函数倒序依次应用在列表元素上的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `for_each_right`

```python
def for_each_right(itr, fn):
  for el in itr[::-1]:
    fn(el)

# EXAMPLES
for_each_right([1, 2, 3], print) # 3 2 1
```

`for_each_right`函数接收一个迭代列表和一个应用函数，返回将函数从右到左应用函数的结果。

函数使用`for`循环和列表切片`itr[::-1]`倒序遍历列表，在`for`循环体内，对每个列表元素应用函数`fn`。
