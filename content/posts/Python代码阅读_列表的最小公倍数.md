---
title: Python代码阅读_列表的最小公倍数
date: 2020-06-20T17:12:26+08:00
lastmod: 2020-06-20T17:12:26+08:00
author: Zhang nan
cover: /post/Python代码阅读_列表的最小公倍数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: true
---

本文中的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `lcm`

```python
from functools import reduce
from math import gcd

def lcm(numbers):
  return reduce((lambda x, y: int(x * y / gcd(x, y))), numbers)

# EXAMPLES
lcm([12, 7]) # 84
lcm([1, 3, 4, 5]) # 60
```

两个数的最大公约数和最小公倍数满足如下公式：

```mathematica
lcm(a, b) * gcd(a, b) = abs(a * b)
```

而对于两个以上数据的列表时，只需要将任意两个数的最小公倍数和剩下的其他数字继续计算最小公倍数即可。也就是说：

```mathematica
lcm(a, b, c, ...) = lcm(lcm(a, b), c, ...)
```

因此我们使用`functools.reduce`函数对列表进行迭代。

## `functools.reduce`

```python
functools.reduce(function, iterable[, initializer])
```

`reduce`函数中的第一个参数是函数`function`，它接受两个参数。`reduce`函数将`function`累积的应用在第二个参数，`iterable`，可迭代的对象上。`function`使用可迭代对象的前两个值作为输入参数，并将返回值和可迭代对象的下一个值作为`function`的输入参数进行下一次迭代，直到用尽可迭代对象的所有值。例如以下的例子：

```python
# ((((1+2)+3)+4)+5)
reduce(lambda x, y: x+y, [1, 2, 3, 4, 5])
```

`reduce`函数大致相当于：
```python
def reduce(function, iterable, initializer=None):
    it = iter(iterable)
    if initializer is None:
        value = next(it)
    else:
        value = initializer
    for element in it:
        value = function(value, element)
    return value
```

## 实际使用

上面的代码片段是展示了Python一种使用方法。细心的同学可以看出来，如果要投入实际生产应用，`lcm`函数是有一些问题的，主要是两点，一是异常处理，包括除零等；另一个是最小公倍数都是正整数，而该函数的返回值可能出现负数。
