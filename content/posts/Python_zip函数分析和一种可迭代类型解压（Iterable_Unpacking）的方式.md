---
title: Python zip函数分析和一种可迭代类型解压（Iterable Unpacking）的方式
date: 2021-01-07T18:36:58+08:00
lastmod: 2021-01-07T18:36:58+08:00
author: Felix
cover: /post/Python_zip函数分析和一种可迭代类型解压（Iterable_Unpacking）的方式-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

针对Python的zip函数进行解释分析，并在此延伸出可迭代类型的解压问题。

<!--more-->

## `zip`的解释

### [官方文档](https://docs.python.org/zh-cn/3/library/functions.html#zip)

`zip(*iterables)`
创建一个聚合了来自每个可迭代对象中的元素的迭代器。返回一个元组的迭代器，其中的第`i`个元组包含来自每个参数序列或可迭代对象的第`i`个元素。 当所输入可迭代对象中最短的一个被耗尽时，迭代器将停止迭代。 当只有一个可迭代对象参数时，它将返回一个单元组的迭代器。 不带参数时，它将返回一个空迭代器。 相当于:

```python
def zip(*iterables):
    # zip('ABCD', 'xy') --> Ax By
    sentinel = object()
    iterators = [iter(it) for it in iterables]
    while iterators:
        result = []
        for it in iterators:
            elem = next(it, sentinel)
            if elem is sentinel:
                return
            result.append(elem)
        yield tuple(result)
```

函数会保证可迭代对象按从左至右的顺序被求值。 使得可以通过 `zip(*[iter(s)]*n)`这样的惯用形式将一系列数据聚类为长度为`n`的分组。 这将重复同样的迭代器`n`次，以便每个输出的元组具有第`n`次调用该迭代器的结果。 它的作用效果就是将输入拆分为长度为`n`数据块。

当你不用关心较长可迭代对象末尾不匹配的值时，则`zip()`只须使用长度不相等的输入即可。 如果那些值很重要，则应改用`itertools.zip_longest()`。

`zip()`与`*`运算符相结合可以用来拆解一个列表:

```python
>>> x = [1, 2, 3]
>>> y = [4, 5, 6]
>>> zipped = zip(x, y)
>>> list(zipped)
[(1, 4), (2, 5), (3, 6)]
>>> x2, y2 = zip(*zip(x, y))
>>> x == list(x2) and y == list(y2)
True
```

### `zip(*zip(x, y))`的解释

根据官方文档`zip(x, y)`会生成一个迭代器，一个迭代器是一个可迭代对象。根据`zip(*iterables)`中的[`*iterables`定义](https://docs.python.org/zh-cn/3/tutorial/controlflow.html#arbitrary-argument-lists)和[函数传参中`*`的定义](https://docs.python.org/zh-cn/3/tutorial/controlflow.html#unpacking-argument-lists)（一个是说函数接收任意数量参数，一个是对参数列表进行解包）。`zip(*zip(x, y))`会将内部`zip`生成的可迭代对象的所有元素独立的传入外层`zip`中。

`zip(x, y)`可以迭代3次，生成三个元组：`(1,4), (2, 5), (3, 6)`。将其传入外层`zip`中，即`zip( (1,4), (2, 5), (3, 6) )`。根据定义外层`zip`可以迭代2次，生成两个元组：`(1, 2, 3), (4, 5, 6)`。

`x2, y2 = zip(*zip(x, y))`这种形式，将分别将这两个元组赋值给`x2`和`y2`。

```python
>>> x = [1, 2, 3]
>>> y = [4, 5, 6]
>>> x2, y2 = zip(*zip(x, y))
>>> type(x2)
<class 'tuple'>
>>> x2
(1, 2, 3)
>>> y2
(4, 5, 6)
```

这里就产生了一个疑问，为什么`a, b = iterables`可以解压可迭代元素呢？这个会在后续研究。我们先来看看`zip(*[iter(s)]*n)`。

### `zip(*[iter(s)]*n)`的解释

参考资料：[https://stackoverflow.com/questions/2233204/how-does-zipitersn-work-in-python](https://stackoverflow.com/questions/2233204/how-does-zipitersn-work-in-python)

```python
>>> s = [1, 2, 3, 4, 5, 6, 7, 8, 9]
>>> n = 3
>>> a, b, c = zip(*[iter(s)]*n)
>>> a
(1, 2, 3)
>>> b
(4, 5, 6)
>>> c
(7, 8, 9)
```

`iter(s)`将`s`转换成了一个迭代器`x`，而`[x] * 3`则会将`x`重复三遍，生成`[x, x, x]`。所以`zip(*[iter(s)]*n)`可以改写为`zip(*[x, x, x])`，[解包参数列表](https://docs.python.org/zh-cn/3/tutorial/controlflow.html#unpacking-argument-lists)，就得到`zip(x, x, x)`。根据`zip`的定义，每次`zip`迭代时，都会从输入的可迭代对象中，获取一个元素。因为`zip(x, x, x)`中三个入参都是同一个迭代器，所以这个`zip`返回的第一个元素，是`x`的前三个元素组成的元组`(1, 2, 3)`。以此类推，这个`zip`下两次迭代的结果是`(4, 5, 6)`和`(7, 8, 9)`。

## 可迭代类型的解压

`a, b = iterables`上面提到了这种可迭代类型解压的方式。可以试着多尝试几次：

```python
>>> a, b, c, d, e = range(5)
>>> a
0
>>> b
1
>>> e
4
>>> x, *y, z = range(5)
>>> x
0
>>> y
[1, 2, 3]
>>> z
4
>>> a, *b, c, d = range(3)
>>> a
0
>>> b
[]
>>> c
1
>>> d
2
>>> x = [1, 2, 3]
>>> y = [4, 5, 6]
>>> zipped = zip(x, y)
>>> x1, *y1 = zipped
>>> x1
(1, 4)
>>> y1
[(2, 5), (3, 6)]
>>> next(zipped)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
>>> temp = iter(range(5))
>>> next(temp)
0
>>> a1, *b1 = temp
>>> a1
1
>>> b1
[2, 3, 4]
```

可以看到这种语法不仅可以将可迭代对象依次赋值给不同的变量，也可使用星号表达式的形式，获取除了明确指定的以外，剩下的元素（甚至可以为空列表）。

这种形式的语法与迭代器的迭代也有影响。用这种方式取值之后，使用`next()`也无法进行迭代。使用`next()`迭代之后，已取出的元素也不能再被赋值。注意，这里说的是迭代器，而不是可迭代对象。

```python
>>> t = range(3)
>>> a, b, c = t
>>> a
0
>>> b
1
>>> c
2
>>> d, e, f = t
>>> d
0
>>> e
1
>>> f
2
>>> it = iter(t)
>>> a1, b1, c1 = it
>>> a1
0
>>> b1
1
>>> c1
2
>>> d1, e1, f1 = it
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: not enough values to unpack (expected 3, got 0)
>>> next(it)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```

这项语法说明记录在[PEP 3132 -- Extended Iterable Unpacking](https://www.python.org/dev/peps/pep-3132/)。
