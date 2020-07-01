---
title: Python代码阅读（第10篇）：随机打乱列表元素
date: 2020-07-01T20:15:00+08:00
lastmod: 2020-07-01T20:15:00+08:00
author: Zhang nan
cover: /post/Python代码阅读（第10篇）_随机打乱列表元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了随机打乱列表元素的功能，将原有列表乱序排列，并返回一个新的列表（不改变原有列表的顺序）。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `shuffle`

```python
from copy import deepcopy
from random import randint

def shuffle(lst):
  temp_lst = deepcopy(lst)
  m = len(temp_lst)
  while (m):
    m -= 1
    i = randint(0, m)
    temp_lst[m], temp_lst[i] = temp_lst[i], temp_lst[m]
  return temp_lst

# EXAMPLES
foo = [1,2,3]
shuffle(foo) # [2,3,1], foo = [1,2,3]
```

Python实际上提供了和`shuffle`功能类似的标准库函数`random.shuffle`，不过这个函数会在原列表上进行打乱，改变原列表的元素顺序。现在我们还是看下上面这段代码，如何实现乱序排列，如何实现返回新列表而不改变原列表内容。

## `copy.deepcopy(x[, memo])`
`shuffle`函数使用了深拷贝将原始列表拷贝了一份传递给了临时列表，后续的所有操作都是基于临时列表进行的，所以不会影响到原有的列表。

那么为什么不直接使用赋值语句呢？`temp_lst = lst`或者`temp_lst = lst[:]`？因为Python的赋值语句实际上是将一个`name`绑定到了对象上。上面的两种赋值语句实际上使得多个`name`绑定到了一个对象上。那么对于可变类型的对象而言，自身的改变会反映到不同的`name`上。所以使用上面两种赋值语句都不能做到不影响原始列表。

```python
>>> from copy import deepcopy
>>> o = [[1,2,3],4,5]
>>> c1 = o
>>> c2 = o[:]
>>> c3 = deepcopy(o)
>>> c1[2] = 6
>>> c2[0][0] = 0
>>> c3[0][1] = 0
>>> c3[1] = 6
>>> o
[[0, 2, 3], 4, 6]
```

## `Fisher-Yates algorithm`

`Fisher-Yates algorithm`算法实现了洗牌算法。对于长度为n的列表，它的现代实现可以描述为以下伪代码：

```
-- To shuffle an array a of n elements (indices 0..n-1):
for i from n−1 downto 1 do
     j ← random integer such that 0 ≤ j ≤ i
     exchange a[j] and a[i]
```

这个算法在数学上的基本思想是不放回的随机从原始列表中取出元素，并将取出的元素按顺序放入新的列表中。使用这种方式就实现了新列表元素顺序的随机。这个算法的伪代码实现，优化了整体的效率，将元素的取出和放入新的数组，替换成了在原数组上将元素进行交换。
