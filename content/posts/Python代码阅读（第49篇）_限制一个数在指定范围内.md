---
title: Python代码阅读（第49篇）：限制一个数在指定范围内
date: 2020-10-12T12:30:51+08:00
lastmod: 2020-10-12T12:30:51+08:00
author: Felix
cover: /post/Python代码阅读（第49篇）_限制一个数在指定范围内-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将一个数限制在指定范围内的功能，如果这个数在另外两个数所指定的范围内，将保持自己的值，否则返回离这个数最近的值。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `clamp_number`

```python
def clamp_number(num,a,b):
  return max(min(num, max(a, b)), min(a, b))

# EXAMPLES
clamp_number(2, 3, 5) # 3
clamp_number(1, -1, -5) # -1
```

`clamp_number`函数接收一个需要被限制的数`num`，以及表示返回的两个数`a`和`b`，返回限制的结果。

区别于多次使用`if`条件语句，该函数组合使用`max`和`min`函数求取限制的结果。

代码的逻辑是先求取`a`和`b`的最大值，再和`num`求取最小值。这个最小值再和`a`、`b`之间的最小值比较取最大值。

1. `max(a, b)`这一步计算求出指定范围的上限`α`。
2. `min(num, α)`这一步在指定数值和范围的上限中求最小值。只有指定的数值超过范围上限的时候，返回值为`α`，其他情况返回`num`。
3. `min(a, b)`这一步计算出指定返回的下限`β`。
4. 最后一步有两种情况，分别是`max(α, β)`和`max(num, β)`。
	- 当`num`超过范围上限时，最后一步为`max(α, β)`。此时返回范围上限`α`，是整个取值范围内最接近`num`的值。
	- 当`num`没有超过范围上限时，最后一步为`max(num, β)`。此时如果`num`在取值范围内，就会大于范围下限`β`，返回`num`。如果`num`小于范围下限`β`，则返回`β`，是整个取值范围内最接近`num`的值。
