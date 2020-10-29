---
title: Python代码阅读（第62篇）：列表是否包含相同元素判断
date: 2020-10-29T18:35:59+08:00
lastmod: 2020-10-29T18:35:59+08:00
author: Felix
cover: /post/Python代码阅读（第62篇）_列表是否包含相同元素判断-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了在不考虑顺序的情况下，判断两个列表是否包含了相同的元素。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `have_same_contents`

```python
def have_same_contents(a, b):
  for v in set(a + b):
    if a.count(v) != b.count(v):
      return False
  return True

# EXAMPLES
have_same_contents([1, 2, 4], [2, 4, 1]) # True
```

`have_same_contents`函数接收两个列表，如果两个列表包含相同的元素，则返回`True`，否则返回`False`。

函数不考虑元素出现的顺序，所以只需要计算所有元素在两个列表的个数是否一样，即可进行判断。函数在两个列表的组合上使用`set()`获取元素的唯一值。再使用`for`循环比较每个列表中每个唯一值的`count()`，对它们进行迭代。如果任何元素的计数不匹配，则返回`False`，否则返回`True`。
