---
title: Python代码阅读（第21篇）：将变量名称转换为蛇式命名风格
date: 2020-08-06T19:25:19+08:00
lastmod: 2020-08-06T19:25:19+08:00
author: Felix
cover: /post/Python代码阅读（第21篇）_将变量名称转换为蛇式命名风格-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现将变量名称转换为蛇式命名风格（snake case）的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `snake`

```python
from re import sub

def snake(s):
  return '_'.join(
    sub('([A-Z][a-z]+)', r' \1',
    sub('([A-Z]+)', r' \1',
    s.replace('-', ' '))).split()).lower()

# EXAMPLES
snake('camelCase') # 'camel_case'
snake('some text') # 'some_text'
snake('some-mixed_string With spaces_underscores-and-hyphens') # 'some_mixed_string_with_spaces_underscores_and_hyphens'
snake('AllThe-small Things') # "all_the_small_things"
```

`snake`函数使用[正则表达式](https://docs.python.org/zh-cn/3.8/library/re.html#module-re)将字符串变形、分解成单词，并加上`_`作为分隔符组合起来。函数主要使用了`re`模块的`sub`、`str.replace`、`str.split`、`str.lower`和`str.join`。在正式分析`snake`函数的逻辑之前，先介绍下其中使用到的其他函数的作用。

### `str.replace(old, new[, count])`

返回字符串的副本，其中出现的所有子字符串`old`都将被替换为`new` 如果给出了可选参数`count`，则只替换前`count`次出现。

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

### `str.join(iterable)`

返回一个由`iterable`中的字符串拼接而成的字符串。

### `str.lower()`

返回原字符串的副本，其所有区分大小写的字符均转换为小写。

### `re.sub(pattern, repl, string, count=0, flags=0)`

返回通过使用`repl`替换在`string`最左边非重叠出现的`pattern`而获得的字符串。 如果样式没有找到，则不加改变地返回`string`。`repl`可以是字符串或函数。 向后引用像是`\6`会用样式中第`6`组所匹配到的子字符串来替换。 例如下面的例子中第一组匹配到的是`myfun`，所以在替换的时候，`\1`使用`myfun`替换，所以在结果中`\npy_`后面接着的是`myfun`。

带有`'r'`前缀的字符串是原始字符串，反斜杠不必做任何特殊处理。 因此`r”\n”`表示包含`'\'`和`'n'`两个字符的字符串，而`"\n"`则表示只包含一个换行符的字符串。 

```python
>>> re.sub(r'def\s+([a-zA-Z_][a-zA-Z_0-9]*)\s*\(\s*\):',
...        r'static PyObject*\npy_\1(void)\n{',
...        'def myfunc():')
'static PyObject*\npy_myfunc(void)\n{'
```

### `snake`执行逻辑

首先分析一下`snake`函数最里面的`sub`函数。先看下输入参数。

`string`是`s.replace('-', ' ')`将待转换的字符串中的`'-'`使用`' '`替换。

`pattern`是`'([A-Z]+)'`，其中`(...)`表示他是一个组合，匹配括号内的正则表达式，并在匹配完成之后，组合的内容可以被获取，并可以在之后用`\number`转义序列进行再次匹配或使用，例如上个例子中的`\1`。`'([A-Z]+)'`的组合表示要匹配一个或多个大写字母，并尽可能匹配出最长的子字符串。

`repl`是`r' \1'`，代表使用组合匹配出来的字符串前增加一个空格，替换匹配出来的字符串。例如`'abcDEF'`经过匹配和替换将变成`'abc DEF'`。`sub('([A-Z]+)', r' \1', 'abcDEF') # 'abc DEF'`

因此，`snake`函数最里面的`sub`函数的输出是将原始字符串中的`'-'`使用`' '`替换，再匹配字符串中的一个或多个连续的大些字母，在前面增加一个空格。例如原始字符串是`'abc-abcDEF-ABc'`经过第一个`sub`函数转换后变成`'abc abc DEF  ABc'`（注意`'ABc'`前面有两个空格）。

接下来再分析一下第二层的`sub`函数。还是先看一下输入参数。

`string`是上个`sub`的输出，在前面的例子中，是`'abc abc DEF  ABc'`（注意`'ABc'`前面有两个空格）。

`pattern`是`'([A-Z][a-z]+)'`。它也是一个组合，表示要匹配一个大写字母后面跟着一个或多个小写字母的形式，并尽可能匹配出最长的子字符串。

`repl`还是`r' \1'`，代表使用组合匹配出来的字符串前增加一个空格，替换匹配出来的字符串。

因此，第二层`sub`的输出是简单的匹配一个大写字母后面跟着一个或多个小写字母的形式，在前面加一个空格。继续使用前面的例子，这层的输入字符串是`'abc abc DEF  ABc'`（注意`'ABc'`前面有两个空格），输出是`'abc abc DEF  A Bc'`（注意`'A'`前面有两个空格）。

然后`snake`函数将第二层`sub`输出的字符串使用`str.split`函数分成字符串列表。再将得到的字符串列表使用`'-'`作为分隔符组合起来。最后使用`str.lower`将组合后的字符串转换成小写。延续上面的例子，最终输出的字符串为：`'abc_abc_def_a_bc'`