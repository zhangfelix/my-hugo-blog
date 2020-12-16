---
title: Python代码阅读（第93篇）：整数转换成罗马数字表示
date: 2020-12-16T18:20:49+08:00
lastmod: 2020-12-16T18:20:49+08:00
author: Felix
cover: /post/Python代码阅读（第93篇）_整数转换成罗马数字表示-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将`1-3999`之间的整数转化成罗马数字表示。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `to_roman_numeral`

```py
def to_roman_numeral(num):
  lookup = [
    (1000, 'M'),
    (900, 'CM'),
    (500, 'D'),
    (400, 'CD'),
    (100, 'C'),
    (90, 'XC'),
    (50, 'L'),
    (40, 'XL'),
    (10, 'X'),
    (9, 'IX'),
    (5, 'V'),
    (4, 'IV'),
    (1, 'I'),
  ]
  res = ''
  for (n, roman) in lookup:
    (d, num) = divmod(num, n)
    res += roman * d
  return res

# EXAMPLES
to_roman_numeral(3) # 'III'
to_roman_numeral(11) # 'XI'
to_roman_numeral(1998) # 'MCMXCVIII'
```

`to_roman_numeral`函数接受一个`1-3999`之间的整数，返回其罗马数字表示形式。

函数从大到小遍历罗马数字符号，并使用`divmod()`函数，计算输入的整数包含几个该符号。然后在结果字符串中依序加入对应个数的罗马数字符号。同时`divmod()`函数计算得到的余数，将参与下一个罗马符号的计算。

整个过程的思想是最大的罗马数字符号代表的十进制数字开始，逐个计算函数输入的整数包含几个符号。然后用减去这几个符号所代表的数值之后，再进行下一轮迭代。继续计算剩余的数值包含多少次一级大小的罗马数字。

`divmod(a, b)`将两个（非复数）数字作为实参，并在执行整数除法时返回一对商和余数。对于混合操作数类型，适用双目算术运算符的规则。对于整数，结果和`(a // b, a % b)`一致。也就是说`(商, 余数) = (d, num) = divmod(num, n)`。函数中的`d`代表了包含几个本次迭代中的罗马符号，`num`为下次迭代中需要使用的剩余数值。

使用标准的规则能够表示的最大数字是3999（MMMCMXCIX），由于今天可能需要的最大罗马数字是MMXX（2020），所以对于更大的罗马数字并没有实际需求。