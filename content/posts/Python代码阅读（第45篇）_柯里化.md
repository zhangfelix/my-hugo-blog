---
title: Python代码阅读（第45篇）：柯里化
date: 2020-09-27T12:30:16+08:00
lastmod: 2020-09-27T12:30:16+08:00
author: Zhang nan
cover: /post/Python代码阅读（第45篇）_柯里化-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将函数柯里化的功能。

在计算机科学中，柯里化（英语：Currying），又译为卡瑞化或加里化，是把接受多个参数的函数变换成接受一个单一参数（最初函数的第一个参数）的函数，并且返回接受余下的参数而且返回结果的新函数的技术。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `curry`

```python
from functools import partial

def curry(fn, *args):
  return partial(fn,*args)

# EXAMPLES
add = lambda x, y: x + y
add10 = curry(add, 10)

add10(20) # 30
```

`curry`函数接收一个接受多个参数的初始函数和部分参数，返回接受单一参数的函数。

函数使用`functools.partial()`生成一个部分对象。该部分对象被调用时的行为类似于`fn`给定了部分参数被调用，需要提供剩余参数。

在直觉上，柯里化声称“如果你固定某些参数，你将得到接受余下参数的一个函数”。所以对于有两个变量的函数`x+y`，如果固定了`y=2`，则得到有一个变量的函数`x+2`。

`functools.partial(func, /, *args, **keywords)`
返回一个新的 部分对象，当被调用时其行为类似于 func 附带位置参数`args`和关键字参数`keywords`被调用。 如果为调用提供了更多的参数，它们会被附加到`args`。 如果提供了额外的关键字参数，它们会扩展并重载`keywords`。 大致等价于:

```python
def partial(func, /, *args, **keywords):
  def newfunc(*fargs, **fkeywords):
    newkeywords = {**keywords, **fkeywords}
    return func(*args, *fargs, **newkeywords)
  newfunc.func = func
  newfunc.args = args
  newfunc.keywords = keywords
  return newfunc
```

