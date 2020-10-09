---
title: Python代码阅读（第30篇）：找到列表中的奇偶异常项
date: 2020-08-27T18:52:15+08:00
lastmod: 2020-08-27T18:52:15+08:00
author: Felix
cover: /post/Python代码阅读（第30篇）_找到列表中的奇偶异常项-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了从输入列表中寻找奇偶异常项。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `find_parity_outliers`

```python
from collections import Counter

def find_parity_outliers(nums):
  return [
    x for x in nums
    if x % 2 != Counter([n % 2 for n in nums]).most_common()[0][0]
  ]

# EXAMPLES
find_parity_outliers([1, 2, 3, 4, 6]) # [1, 3]
```

`find_parity_outliers`函数接收一个列表，并返回列表中的奇偶异常项。奇偶异常项指的是和列表中大多数项奇偶性质不同的项。函数使用列表推导式来逐个检查输入列表中的每一项是否为奇偶异常项。`Counter`中使用列表推导式和取余操作（`% 2`）逐个提取其输入列表每项的奇偶性质。使用`collections.Counter.most_common()`来获取列表中最常见的奇偶性。

### `class collections.Counter([iterable-or-mapping])`

`Counter`是一个`dict`的子类，用于计数可哈希对象。它是一个集合，元素像字典键(key)一样存储，它们的计数存储为值。计数可以是任何整数值，包括0和负数。`most_common([n])`是`Counter`提供的一个方法，该方法
返回一个列表，其中包含`n`个最常见的元素及出现次数，按常见程度由高到低排序。 如果`n`被省略或为`None`，`most_common()`将返回计数器中的所有元素。 计数值相等的元素按首次出现的顺序排序。

```python
>>> from collections import Counter
>>> Counter('abracadabra').most_common(3)
[('a', 5), ('b', 2), ('r', 2)]
```

`[0][0]`是在结果列表里面定位元素，会把最常出现的元素提取出来。

```python
>>> Counter('abracadabra').most_common(3)[0][0]
'a'
```

