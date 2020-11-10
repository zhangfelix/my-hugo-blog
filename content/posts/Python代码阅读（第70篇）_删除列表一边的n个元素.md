---
title: Python代码阅读（第70篇）：删除列表一边的n个元素
date: 2020-11-10T18:25:27+08:00
lastmod: 2020-11-10T18:25:27+08:00
author: Felix
cover: /post/Python代码阅读（第70篇）_删除列表一边的n个元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了去除列表左边或者右边`n`个元素的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `drop`

```python
def drop(a, n = 1):
  return a[n:]

# EXAMPLES
drop([1, 2, 3]) # [2, 3]
drop([1, 2, 3], 2) # [3]
drop([1, 2, 3], 42) # []
```

`drop`函数接收一个列表，和一个拟删除元素数量`n`，返回删除左边指定数量元素后的列表。

函数使用分片的方法，直接从索引为`n`的元素（第`n+1`个元素）开始，返回新的列表。


## `drop_right`

```python
def drop_right(a, n = 1):
  return a[:-n]

# EXAMPLES
drop_right([1, 2, 3]) # [1, 2]
drop_right([1, 2, 3], 2) # [1]
drop_right([1, 2, 3], 42) # []
```

`drop_right`函数和上个函数类似，但是在分片的时候，使用了负数，`a[:-n]`相当于`a[:len(a)-n]`，这样列表切片就会舍弃最右边的`n`个元素。

例如第一个示例`drop_right([1, 2, 3])`中，`a = [1, 2, 3]`，`len(a) = 3`，`n = 1`。函数返回`a[:len(a)-n]`，即`a[:2]`，即`[1, 2]`舍弃了右边`n`个元素。
