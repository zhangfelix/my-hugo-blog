---
title: Python代码阅读（第66篇）：两个列表的包含关系
date: 2020-11-04T12:30:26+08:00
lastmod: 2020-11-04T12:30:26+08:00
author: Felix
cover: /post/Python代码阅读（第66篇）_两个列表的包含关系-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了判断一个列表是否被另一个列表包含的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `is_contained_in`

```python
def is_contained_in(a, b):
  for v in set(a):
    if a.count(v) > b.count(v):
      return False
  return True

# EXAMPLES
is_contained_in([1, 4], [2, 4, 1]) # True
```

`is_contained_in`函数接收两个列表，返回列表`a`中的元素是否包含在列表`b`中。函数统计列表`a`中各个元素的数量是否都小于等于该元素在列表`b`中的数量。如果发现任一一个元素在列表`b`中不存在，或者数量少于其在列表`a`中的数量，函数返回`False`。

和之前《Python代码阅读（第60篇）：列表是否包括指定的元素》不同，`is_contained_in`函数对元素的数量作出要求，不是判断元素是否在另一个列表中出现，而是判断两个列表之间的包含关系。
