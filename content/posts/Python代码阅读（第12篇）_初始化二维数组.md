---
title: Python代码阅读（第12篇）：初始化二维数组
date: 2020-07-22T12:23:53+08:00
lastmod: 2020-07-22T12:23:53+08:00
author: Felix
cover: /post/Python代码阅读（第12篇）_初始化二维数组-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了二维数组的初始化功能，根据给定的宽高初始化二维数组。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `initialize_2d_list`

```python
def initialize_2d_list(w,h, val = None):
  return [[val for x in range(w)] for y in range(h)]

# EXAMPLES
initialize_2d_list(2, 2, 0) # [[0,0], [0,0]]
```

`initialize_2d_list`接收二维数组的宽、高和初始值，返回一个二维数组。

函数通过列表推导式和`range()`函数生成`h`行长度为`w`的列表。列表中的元素的初始值由参数`val`指定。

`[[val for x in range(w)] for y in range(h)]`该列表推导式的第一个部分是生成一个列表，该列表长度为`w`，所有的值为`val`。第二部分是将第一部分生成的列表作为元素生成一个长度为`h`的列表。

### `range`

`range`类型表示不可变的数字序列，通常用于在`for`循环中循环指定的次数。它有两种形式：`class range(stop)`和`class range(start, stop[, step])`。如果省略 step 参数，其默认值为`1`。 如果省略`start`参数，其默认值为`0`，如果`step`为零则会引发`ValueError`。

如果`step`为正值，确定`range r`内容的公式为`r[i] = start + step*i 其中 i >= 0 且 r[i] < stop`。

如果`step`为负值，确定`range`内容的公式仍然为`r[i] = start + step*i，但限制条件改为 i >= 0 且 r[i] > stop`。

如果`r[0]`不符合值的限制条件，则该`range`对象为空。`range`对象确实支持负索引，但是会将其解读为从正索引所确定的序列的末尾开始索引。
