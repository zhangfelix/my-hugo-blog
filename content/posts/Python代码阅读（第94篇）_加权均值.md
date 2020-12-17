---
title: Python代码阅读（第94篇）：加权均值
date: 2020-12-17T18:22:22+08:00
lastmod: 2020-12-17T18:22:22+08:00
author: Felix
cover: /post/Python代码阅读（第94篇）_加权均值-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了计算加权均值的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `weighted_average`

```py
def weighted_average(nums, weights):
  return sum(x * y for x, y in zip(nums, weights)) / sum(weights)

# EXAMPLES
weighted_average([1, 2, 3], [0.6, 0.2, 0.3]) # 1.72727
```

`weighted_average`函数接收一个待求均值的数字列表`nums`和一个对应的权重列表`weights`，返回加权均值。

函数使用`zip()`将两个列表组合提取，同时获得`nums`的当前值和对应的权重。再使用列表推导式迭代所有值和权重对，并将其两两相乘生成一个新的列表。最后使用`sum()`函数计算新列表元素的和，除以权重的和，计算出加权均值。

`zip(*iterables)`创建一个聚合了来自每个可迭代对象中的元素的迭代器。返回一个元组的迭代器，其中的第`i`个元组包含来自每个参数序列或可迭代对象的第`i`个元素。 当所输入可迭代对象中最短的一个被耗尽时，迭代器将停止迭代。 当只有一个可迭代对象参数时，它将返回一个单元组的迭代器。 不带参数时，它将返回一个空迭代器。 相当于:

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
