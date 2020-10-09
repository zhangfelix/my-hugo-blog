---
title: Python代码阅读（第43篇）：构造组合函数
date: 2020-09-22T12:33:15+08:00
lastmod: 2020-09-22T12:33:15+08:00
author: Felix
cover: /post/Python代码阅读（第43篇）_构造组合函数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了构造将输入函数依次调用的组合函数。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

# `compose`

```python
from functools import reduce

def compose(*fns):
  return reduce(lambda f, g: lambda *args: f(g(*args)), fns)

# EXAMPLES
add5 = lambda x: x + 5
multiply = lambda x, y: x * y
multiply_and_add_5 = compose(add5, multiply)

multiply_and_add_5(5, 2) # 15
```

`compose`函数接收多个函数，返回将这些函数从右至左依次调用的组合函数。接收的函数中，只有最右边的函数（组合函数中第一个调用的函数）可以接收多于一个参数，其他函数只能接收一个参数。

函数使用`reduce`将一个`lambda`表达式依次作用于接收的函数列表`fns`。`reduce`中接收两个参数的`lambda`表达式返回一个新的匿名函数（`lambda`表达式）。通过`reduce`函数的迭代，将会把所有的`fns`中的函数依次调用组合成一个函数。假设`fns`为`(a,b,c,d,e)`，那么`reduce`函数返回的合成函数为`a(b(c(d(e(*arg)))))`

**下面我们深入`compose`函数的实现**

函数`compose(*fns)`接收任意数量的参数，所有这些参数会被包含在一个名为`fns`的元组里。

```python
>>> def fun(*arg):
...   print(arg)
...   print(type(arg))
...
>>> fun(1,2,3)
(1, 2, 3)
<class 'tuple'>
```

`functools.reduce(function, iterable[, initializer])`将两个参数的 function 从左至右积累地应用到`iterable`的条目，以便将该可迭代对象缩减为单一的值。 例如，`reduce(lambda x, y: x+y, [1, 2, 3, 4, 5])`是计算`((((1+2)+3)+4)+5)`的值。 左边的参数`x`是积累值而右边的参数`y`则是来自`iterable`的更新值。

`compose`函数中`reduce`的匿名函数`lambda f, g: lambda *args: f(g(*args))`可以写成如下形式：

```python
def function1(f,g):
  def function2(*args):
    return f(g(*args))
  return function2
```

假设`fns`为`(a,b,c,d,e)`，`reduce`函数累积的调用`function1`构造函数`function2`。`a,b`首先作为`function1`的入参，构造出运算内容是`a(b(*arg))`的函数`function2`。本次迭代构造出的`function2`和`c`作为入参调用`function1`函数进行第二次迭代，`function1(function2,c)`将构造运算内容是`function2(c(*arg))`的函数，解开上一个迭代的`function2`，新函数的运算内容是`a(b(c(*arg)))`。如此依次迭代，最后获得的函数的实际运算内容是`a(b(c(d(e(*arg)))))`。

```python
>>> from functools import reduce
>>> def function1(f,g):
...   def function2(*args):
...     return f(g(*args))
...   return function2
...
>>> def a(arg):
...   return 'a'+arg
...
>>> def b(arg):
...   return 'b'+arg
...
>>> def c(arg):
...   return 'c'+arg
...
>>> def d(arg):
...   return 'd'+arg
...
>>> def e(arg):
...   return 'e'+arg
...
>>> f = reduce(function1, (a,b,c,d,e))
>>> print(f('f'))
abcdef
```

# `compose_right`

和上文`compose`函数一样的原理，只需要将`reduce`函数中的调用顺序交换，就可以构造一个反方向，从左至右依次调用的组合函数。

```python
from functools import reduce

def compose_right(*fns):
  return reduce(lambda f, g: lambda *args: g(f(*args)), fns)

# EXAMPLES
add = lambda x, y: x + y
square = lambda x: x * x
add_and_square = compose_right(add,square)

add_and_square(1, 2) # 9
```

