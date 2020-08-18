---
title: Python代码阅读（第25篇）：将多行字符串拆分成列表
date: 2020-08-18T18:53:31+08:00
lastmod: 2020-08-18T18:53:31+08:00
author: Zhang nan
cover: /post/Python代码阅读（第25篇）_将多行字符串拆分成列表-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码将多行字符串拆分成列表，各行字符串为列表元素。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `split_lines`

```python
def split_lines(s):
  return s.split('\n')

# EXAMPLES
split_lines('This\nis a\nmultiline\nstring.\n') # ['This', 'is a', 'multiline', 'string.' , '']
```

`split_lines`函数接收一个字符串，并将该字符串以换行符号（`\n`）作为分隔符，分割成一个列表。函数直接使用了`str.split`函数进行字符串处理。之前的几篇文章里面的代码使用了不传入参数的，按空白字符串分割的特殊用法，这次代码中指定了按照换行符进行分割。

### `str.split(sep=None, maxsplit=-1)`

返回一个由字符串内单词组成的列表，使用`sep`作为分隔字符串。 如果给出了`maxsplit`，则最多进行`maxsplit`次拆分（因此，列表最多会有`maxsplit+1`个元素）。 如果`maxsplit`未指定或为`-1`，则不限制拆分次数（进行所有可能的拆分）。

如果`sep`未指定或为`None`，则会应用另一种拆分算法：连续的空格会被视为单个分隔符，开头和结尾如果包含空格的话，将不会拆分出空字符串。 因此，使用`None`拆分空字符串或仅包含空格的字符串将返回 `[]`。

```python
>>> '1 2 3'.split()
['1', '2', '3']
>>> '1 2 3'.split(maxsplit=1)
['1', '2 3']
>>> '   1   2   3   '.split()
['1', '2', '3']
```

