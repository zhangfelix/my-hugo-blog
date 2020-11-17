---
title: Python代码阅读（第76篇）：摄氏温度与华氏温度互
date: 2020-11-18T12:32:11+08:00
lastmod: 2020-11-18T12:32:11+08:00
author: Felix
cover: /post/Python代码阅读（第76篇）_摄氏温度与华氏温度互-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了摄氏温度与华氏温度的相互转换。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `celsius_to_fahrenheit`

```python
def celsius_to_fahrenheit(celsius):
  return ((celsius * 1.8) + 32)

# EXAMPLES
celsius_to_fahrenheit(180) # 356.0
```

函数实现了将摄氏温度转换为华氏温度。

摄氏温度的规定是：在标准大气压，纯水的凝固点（即固液共存的温度）为`0°C`，水的沸点为`100°C`，中间划分为`100`等份，每等份为`1°C`。

华氏温度的定义是：在标准大气压下，冰的熔点为`32℉`，水的沸点为`212℉`，中间有`180`等分，每等分为`1℉`。

因此他们的换算规则为：

```mathematica
℉ = 1.8 * °C +32
°C = (℉ - 32) / 1.8
```

## `fahrenheit_to_celsius`

```python
def fahrenheit_to_celsius(fahrenheit):
  return ((fahrenheit - 32) / 1.8)

# EXAMPLES
fahrenheit_to_celsius(77) # 25.0
```

该函数与上面相反，实现了华氏温度转换为摄氏温度。