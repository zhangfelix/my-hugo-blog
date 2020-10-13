---
title: Python代码阅读（第50篇）：对列表间隔取元素
date: 2020-10-13T12:30:32+08:00
lastmod: 2020-10-13T12:30:32+08:00
author: Felix
cover: /post/Python代码阅读（第50篇）_对列表间隔取元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了在一个列表中每间隔`n`个数取一个元素的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `every_nth`

```python
def every_nth(lst, nth):
  return lst[nth - 1::nth]

# EXAMPLES
every_nth([1, 2, 3, 4, 5, 6], 2) # [ 2, 4, 6 ]
```

`every_nth`函数接收一个列表和间隔数`nth`，返回列表的取值结果。

函数使用列表切片的方式，获取原列表每间隔`nth`个元素取值的结果。

`s[i:j:k]`的形式是`s`从`i`到`j`步长为`k`的切片。`s`从`i`到`j`步长为`k`的切片被定义为所有满足`0 <= n < (j-i)/k`的索引号`x = i + n*k`的项组成的序列。 换句话说，索引号为`i`,`i+k`,`i+2*k`,`i+3*k`，以此类推，当达到`j`时停止 (但一定不包括`j`)。 当`k`为正值时，`i`和`j`会被减至不大于`len(s)`。 当`k`为负值时，`i`和`j`会被减至不大于`len(s) - 1`。 如果`i`或`j`被省略或为`None`，它们会定义为列表一端可以达到的“终止”值 (是哪一端的终止值则取决于`k`的符号)。 请注意，`k`不可为零。 如果`k 为`None，则当作`1`处理。

因为列表的索引是从`0`开始的，所以第一个被取出的数的索引是`nth-1`。因为`j`被省略，所以会一直计算到列表的末端。我们使用一个不那么“恰好”的例子看一下：

```python
>>> every_nth([1, 2, 3, 4, 5, 6, 7], 2) # [ 2, 4, 6 ]
[2, 4, 6]
```
