---
title: Python代码阅读（第83篇）：RGB与HEX相互转换
date: 2020-11-30T18:35:12+08:00
lastmod: 2020-11-30T18:35:12+08:00
author: Felix
cover: /post/Python代码阅读（第83篇）_RGB与HEX相互转换-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将`RGB`色彩格式与`HEX`色彩格式相互转换。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `rgb_to_hex`

```py
def rgb_to_hex(r, g, b):
  return ('{:02X}' * 3).format(r, g, b)

# EXAMPLES
rgb_to_hex(255, 165, 1) # 'FFA501'
```

`rgb_to_hex`函数接收一个`(r, g, b)`格式的色彩编码，返回其`HEX`表示。

将`RGB`的三个分量转化成十六进制，并按顺序拼接显示，就得到了`HEX`格式。函数使用`'{:02X}'`格式化`RGB`分量，将其转化为两位的十六进制。其中`X`表示十六进制。


## `hex_to_rgb`

```py
def hex_to_rgb(hex):
  return tuple(int(hex[i:i+2], 16) for i in (0, 2, 4))

# EXAMPLES
hex_to_rgb('FFA501') # (255, 165, 1)
```

`hex_to_rgb`函数接收一个`HEX`格式的色彩表示，返回一个`RGB`元组。

函数通过`hex[i:i+2]`截取`HEX`表示的对应字符串，并使用`class int(x, base=10)`，来构造`int`类型的数字，指定`base = 16`。