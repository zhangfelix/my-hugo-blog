---
title: Python代码阅读（第82篇）：datetime对象和ISO时间日期字符串相互转化
date: 2020-11-26T11:09:04+08:00
lastmod: 2020-11-26T11:09:04+08:00
author: Felix
cover: /post/Python代码阅读（第82篇）_datetime对象和ISO时间日期字符串相互转化-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将`datetime`对象转化为`ISO 8601`字符串，并将其还原回`datetime`对象的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `to_iso_date`

```py
from datetime import datetime

def to_iso_date(d):
  return d.isoformat()

# EXAMPLES
to_iso_date(datetime(2020, 10, 25)) # 2020-10-25T00:00:00
```

`to_iso_date`函数接收一个`datetime`对象，返回`ISO 8601`标准的日期和时间字符串。

函数直接使用`datetime.isoformat()`进行转化。

## `from_iso_date`

```python
from datetime import datetime

def from_iso_date(d):
  return datetime.fromisoformat(d)

# EXAMPLES
from_iso_date('2020-10-28T12:30:59.000000') # 2020-10-28 12:30:59
```

`from_iso_date`函数接收一个`ISO 8601`规范的日期和时间字符串，返回一个`datetime.datetime`对象。

函数直接使用`datetime`对象的`fromisoformat()`方法将日期字符串转化为`datetime`对象。

实际上该函数**并不支持**解析任意`ISO 8601`字符串。它是作为`datetime.isoformat()`的逆操作。 在第三方包`dateutil`中提供了一个更完善的`ISO 8601`解析器`dateutil.parser.isoparse`。
