---
title: Python代码阅读（第39篇）：获取列表出现频率最高的元素
date: 2020-09-14T12:30:06+08:00
lastmod: 2020-09-14T12:30:06+08:00
author: Zhang nan
cover: /post/Python代码阅读（第39篇）_获取列表出现频率最高的元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了获取列表中出现频率最高的元素的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

# `most_frequent`

```python
def most_frequent(list):
  return max(set(list), key=list.count)

# EXAMPLES
most_frequent([1, 2, 1, 2, 3, 2, 1, 4, 2]) #2
```

`most_frequent`函数接收一个列表，返回出现频率最高的元素。

函数利用`set(list)`获取列表中元素的集合（去除重复元素），再使用`max`和`list.count`寻找出现频率最高的元素。

`set([iterable])`方法从一个可迭代对象构建一个集合，集合容器中的元素具有唯一性，常用来进行成员检测、从序列中去除重复项以及数学中的集合类计算等。在本代码片段中，用于对传入的`list`参数进行去重。

```python
>>> set([1, 2, 1, 2, 3, 2, 1, 4, 2])
{1, 2, 3, 4}
```

`max(set(list), key=list.count)`函数会根据关键词参数`key=list.count`所指定带有一个参数的函数，用于从每个列表元素中提取比较键。`list.count(x)`会返回`x`再`list`中出现的次数。`max`函数会返回比较键（出现次数）最大的元素。

```python
>>> [1, 2, 1, 2, 3, 2, 1, 4, 2].count(1)
3
>>> [1, 2, 1, 2, 3, 2, 1, 4, 2].count(2)
4
>>> [1, 2, 1, 2, 3, 2, 1, 4, 2].count(3)
1
>>> [1, 2, 1, 2, 3, 2, 1, 4, 2].count(4)
1
```

