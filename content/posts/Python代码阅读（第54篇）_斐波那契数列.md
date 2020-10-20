---
title: Python代码阅读（第54篇）：斐波那契数列
date: 2020-10-19T14:29:25+08:00
lastmod: 2020-10-19T14:29:25+08:00
author: Felix
cover: /post/Python代码阅读（第54篇）_斐波那契数列-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码生成了一个包含斐波那契序列的列表。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `fibonacci`

```python
def fibonacci(n):
  if n <= 0:
    return [0]

  sequence = [0, 1]
  while len(sequence) <= n:
    next_value = sequence[len(sequence) - 1] + sequence[len(sequence) - 2]
    sequence.append(next_value)

  return sequence

# EXAMPLES
fibonacci(7) # [0, 1, 1, 2, 3, 5, 8, 13]
```

`fibonacci`函数接收指定的斐波那契数列的项数`n`，返回生成的斐波那契数列。

函数使用数列公式和`append()`来生成数列。

![](/post/Python代码阅读（第54篇）_斐波那契数列-1.jpg)

需要注意的是斐波那契数列开始项是第`0`项。斐波那契数列公式满足以下逻辑

1. 当`n`等于`0`时，函数返回斐波那契数列的第`0`项，`[0]`。
2. 当`n`等于`1`时，函数返回返回数列的第`0`项和第`1`项，`[0,1]`。
3. 当`n`大于等于`2`时，斐波那契数列的第`n`项是由`n-1`和`n-2`项相加计算得来的。

根据函数中`if` 和`while`中的判断逻辑，函数特别定义，`n`小于`0`的时候，函数返回`[0]`。 `n`大于等于`2`的时候，函数迭代的进行斐波那契数列的计算，每次将新计算得到的项添加到数列的末尾。直到数列的计算到第`n`项。

形式`s.append(x)`会将`x`添加到序列的末尾 ，等同于`s[len(s):len(s)] = [x])`。
