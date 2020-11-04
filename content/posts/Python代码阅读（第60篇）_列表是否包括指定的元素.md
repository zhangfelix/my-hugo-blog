---
title: Python代码阅读（第60篇）：列表是否包括指定的元素
date: 2020-10-27T12:29:35+08:00
lastmod: 2020-10-27T12:29:35+08:00
author: Felix
cover: /post/Python代码阅读（第60篇）_列表是否包括指定的元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码分别实现了判断给出的元素是否都在指定的列表中出现过，以及判断任一给出的元素是否在指定的列表中出现过。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `includes_all`

```python
def includes_all(lst, values):
  for v in values:
    if v not in lst:
      return False
  return True

# EXAMPLES
includes_all([1, 2, 3, 4], [1, 4]) # True
includes_all([1, 2, 3, 4], [1, 5]) # False
```

`includes_all`函数接收两个列表`lst`和`values`，如果`values`中的所有元素都在`lst`中出现过，则返回`True`，否则返回`False`。并不对元素的出现次数做要求。

函数用`for` 循环遍历`values`中的元素，用`not in`关键词判断该元素是否在`lst`中存在。如果`values`中的任意一个元素在`lst`中不存在，就返回`False`，只有`values`中的所有元素在`lst`中存在，才返回`True`。

`x not in s`这种形式的写法中，如果列表`s`中的某项等于`x`则结果为`False`，否则为`True`。

## `includes_any`

```python
def includes_any(lst, values):
  for v in values:
    if v in lst:
      return True
  return False

# EXAMPLES
includes_any([1, 2, 3, 4], [2, 9]) # True
includes_any([1, 2, 3, 4], [8, 9]) # False
```

`includes_any`函数类似，也是接收两个列表`lst`和`values`，如果`values`中的任意元素在`lst`中出现过，返回`True`，否则返回`False`。并不对元素的出现次数做要求。

在该函数的`for`循环中，使用`in`关键词判断元素是在`lst`中存在。

`x in s`这种形式的写法中，如果列表`s`中的某项等于`x`则结果为`True`，否则为`False`。

虽然`in`和`not in`操作在通常情况下仅被用于简单的成员检测，某些专门化序列 (例如`str`,`bytes`和`bytearray`) 也使用它们进行子序列检测:

```python
>>> "cd" in "abcdef"
True
```

