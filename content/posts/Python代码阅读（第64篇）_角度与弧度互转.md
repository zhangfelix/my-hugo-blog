---
title: Python代码阅读（第64篇）：角度与弧度互转
date: 2020-11-02T18:35:42+08:00
lastmod: 2020-11-02T18:35:42+08:00
author: Felix
cover: /post/Python代码阅读（第64篇）_角度与弧度互转-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将弧度转为角度，以及将角度转为弧度的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `rads_to_degrees`

```python
from math import pi

def rads_to_degrees(rad):
  return (rad * 180.0) / pi

# EXAMPLES
rads_to_degrees(pi / 2) # 90.0
```

`rads_to_degrees`函数接收一个弧度，返回该弧度的角度形式。

弧度是平面角的单位。单位弧度定义为圆弧长度等于半径时的圆心角。所以弧度和角度的关系满足如下公式。其中`deg`是角度，`rad`是弧度。

![](/post/Python代码阅读（第64篇）_角度与弧度互转-1.png)

`math`模块提供了对C标准定义的数学函数的访问。该模块不适用于复数，如果想要使用复数计算，可以使用`cmath`模块中的同名函数。`math.pi`是数学常数`π = 3.141592...`，精确到可用精度。

## `degrees_to_rads`

```python
from math import pi

def degrees_to_rads(deg):
  return (deg * pi) / 180.0

# EXAMPLES
degrees_to_rads(180) # 3.141592653589793
```

`degrees_to_rads`函数和上面的相反，接收一个角度，返回其对应的弧度。
