---
title: Python代码阅读（第31篇）：将一个列表分割成指定大小的小列表
date: 2020-08-31T14:58:13+08:00
lastmod: 2020-08-31T14:58:13+08:00
author: Zhang nan
cover: /post/Python代码阅读（第31篇）_将一个列表分割成指定大小的小列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将列表分割成指定大小的小列表的功能。最后一个小列表的长度由实际剩余的项而定。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `chunk`

```python
from math import ceil

def chunk(lst, size):
  return list(
    map(lambda x: lst[x * size:x * size + size],
      list(range(0, ceil(len(lst) / size)))))

# EXAMPLES
chunk([1, 2, 3, 4, 5], 2) # [[1,2],[3,4],[5]]
```

`chunk`函数接收一个列表和一个规模参数，返回分割后的小列表。函数使用`list()`和`range()`来创建一个序号列表，指明分割后的列表序号。在序号列表上使用`map()`并用输入列表的切片来填充它。最后，返回新创建的列表。

`math.ceil(x)`函数返回`x`的上限，即大于或者等于`x`的最小整数。输入列表的长度无法被分割规模整除的时候，最后剩余的项仍然会合并成一个列表，所以，这里需要使用`math.ceil(x)`获取大于或者等于 `(len(lst) / size)`的最小整数。

函数通过`list()`和`range()`生成长度为小列表个数的序号列表（从`0`开始），输入列表`lst`的切片`lst[x * size:x * size + size]`就是第`x`个小列表的内容。
