---
title: Python代码阅读（第61篇）：延迟调用函数
date: 2020-10-28T18:35:30+08:00
lastmod: 2020-10-28T18:35:30+08:00
author: Felix
cover: /post/Python代码阅读（第61篇）_延迟调用函数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了在给定的延迟时间后，调用指定函数的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `delay`

```python
from time import sleep

def delay(fn, ms, *args):
  sleep(ms / 1000)
  return fn(*args)

# EXAMPLES
delay(
  lambda x: print(x),
  1000,
  'later'
) # prints 'later' after one second
```

`delay`函数接收一个指定函数`fn`，一个延迟时间`ms`和指定函数的参数`*args`，在指定延迟后，返回指定函数`fn`的调用结果。

函数使用`sleep()`方法来进行延迟，然后调用指定函数。`delay`函数在调用的时候，可以使用`lambda`表达式的匿名函数，也可以使用一般函数。需要注意的是当`fn`存在关键字参数时会发生异常。

```python
>>> from time import sleep
>>>
>>> def delay(fn, ms, *args):
...   sleep(ms / 1000)
...   return fn(*args)
...
>>> def f(pos_only, /, standard, *, kwd_only):
...     print('pos_only:{}\nstandard:{}\nkwd_only:{}'.format(pos_only,standard,kwd_only))
...
>>> delay(f, 1000, 1, 2, 3)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 3, in delay
TypeError: f() takes 2 positional arguments but 3 were given
>>> delay(f, 1000, 1, 2, kwd_only = 3)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: delay() got an unexpected keyword argument 'kwd_only'
```

