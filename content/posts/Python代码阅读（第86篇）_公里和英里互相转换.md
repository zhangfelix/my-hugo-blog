---
title: Python代码阅读（第86篇）：公里和英里互相转换
date: 2020-12-03T12:30:59+08:00
lastmod: 2020-12-03T12:30:59+08:00
author: Felix
cover: /post/Python代码阅读（第86篇）_公里和英里互相转换-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了公里数值和英里数值的相互转换。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `km_to_miles`

```py
def km_to_miles(km):
  return km * 0.621371

# EXAMPLES
km_to_miles(8.1) # 5.0331051
```

`km_to_miles`函数接收一个以“公里”为单位的距离，返回该距离以“英里”为单位的表示。

```mathematica
1 公里 = 0.621371 英里
```

## `miles_to_km`

```py
def miles_to_km(miles):
  return miles * 1.609344

# EXAMPLES
miles_to_km(5.03) # 8.09500032
```

`miles_to_km`函数接收一个以“英里”为单位的距离，返回该距离以“公里”为单位的表示。

```mathematica
1 英里 = 1.609344 公里
```

