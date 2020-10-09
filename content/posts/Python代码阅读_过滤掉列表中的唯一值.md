---
title: Python代码阅读：过滤掉列表中的唯一值
date: 2020-06-22T22:07:59+08:00
lastmod: 2020-06-22T22:07:59+08:00
author: Felix
cover: /post/Python代码阅读_过滤掉列表中的唯一值-cover.jpg
categories: ["技术"]
tags: ["Python"]
# showcase: true
draft: false
---

本文中的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `filter_unique`

```python
from collections import Counter

def filter_unique(lst):
  return [item for item, count in Counter(lst).items() if count > 1]

# EXAMPLES
filter_unique([1, 2, 2, 3, 4, 4, 5]) # [2, 4]
```

该函数的作用是过滤掉列表中的唯一值。函数使用`collections.Counter`函数对列表进行计数，在通过列表推导式，将非唯一值过滤出去（过滤掉计数大于1的值）。

## `collections.Counter`

```python
class collections.Counter([iterable-or-mapping])
```

`Counter`是一个`dict`的子类，用于计数可哈希对象。它是一个集合，元素像字典键(key)一样存储，它们的计数存储为值。计数可以是任何整数值，包括0和负数。它可以接收一个可迭代对象，并对其元素进行计数。

其成员函数`items()`将返回一个字典的键值对的新视图。再结合`collections.Counter`，上述代码中`Counter(lst).items()`将一个列表转化成了（元素，计数）对。

## 列表推导式

列表推导式提供了一个更简单的创建列表的方法。常见的用法是把某种操作应用于序列或可迭代对象的每个元素上，然后使用其结果来创建列表，或者通过满足某些特定条件元素来创建子序列。

列表推导式的结构是由一对方括号所包含的以下内容：一个表达式，后面跟一个`for`子句，然后是零个或多个`for`或`if`子句。 其结果将是一个新列表，由对表达式依据后面的`for`和`if`子句的内容进行求值计算而得出。

上面`filter_unique`可以等价的写成：

```python
from collections import Counter

def filter_unique(lst):
  temp_list = []
  for item, count in Counter(lst).items():
    if count > 1:
      temp_list.append(item)
  return temp_list

# EXAMPLES
filter_unique([1, 2, 2, 3, 4, 4, 5]) # [2, 4]
```

## `filter_non_unique`

```python
from collections import Counter

def filter_non_unique(lst):
  return [item for item, count in Counter(lst).items() if count == 1]

# EXAMPLES
filter_non_unique([1, 2, 2, 3, 4, 4, 5]) # [1, 3, 5]
```

`filter_non_unique`和上面的代码相似，功能是过滤掉列表中的非唯一值。