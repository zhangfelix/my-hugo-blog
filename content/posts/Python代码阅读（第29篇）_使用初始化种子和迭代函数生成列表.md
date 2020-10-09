---
title: Python代码阅读（第29篇）：使用初始化种子和迭代函数生成列表
date: 2020-08-26T18:00:56+08:00
lastmod: 2020-08-26T18:00:56+08:00
author: Felix
cover: /post/Python代码阅读（第29篇）_使用初始化种子和迭代函数生成列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现使用一个初始化种子和迭代函数，通过嵌套函数对初始化种子进行迭代，最终生成一个列表。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `unfold`

```python
def unfold(fn, seed):
  def fn_generator(val):
    while True: 
      val = fn(val[1])
      if val == False: break
      yield val[0]
  return [i for i in fn_generator([None, seed])]

# EXAMPLES
f = lambda n: False if n > 50 else [-n, n + 10]
unfold(f, 10) # [-10, -20, -30, -40, -50]
```

`unfold`函数接收一个迭代函数和一个初始化种子，生成一个列表。迭代函数`fn`接受一个参数`seed`，并且必须总是返回一个有两个元素的列表`[value，nextSeed]`，或者返回`False`来终止生成器函数。`unfold`函数内部定义生成器`fn_generator`。该生成器使用`while`循环调用迭代器函数并产生值，直到它返回False。最后使用列表推导式返回生成器函数产生的列表。

**生成器**是一个用于创建迭代器的简单而强大的工具。 它的写法类似于标准的函数，但当它们要返回数据时会使用`yield`语句。 每次在生成器上调用`next()`时，它会从上次离开的位置恢复执行（它会记住上次执行语句时的所有数据值）。

`fn_generator`是一个生成器，在其中`while`语句的最后，使用`yield`返回当前`while`循环中`val[0]`的值。下一次调用的时候，会继续下一个循环，继续返回下一个循环中`val[0]`的值，直到迭代函数`fn`返回`false`结束`while`循环。

在`unfold`函数的`return`语句中，使用列表推导式不断调用`fn_generator`生成器，直到生成器退出循环，形成一个列表并返回。