---
title: Python代码阅读（第38篇）：根据谓词函数和属性字符串构造判断函数
date: 2020-09-11T18:33:46+08:00
lastmod: 2020-09-11T18:33:46+08:00
author: Zhang nan
cover: /post/Python代码阅读（第38篇）_根据谓词函数和属性字符串构造判断函数-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了根据给定的谓词函数和属性字符串，来构造一个判别函数，用来判断字典对象中相应的属性是否满足谓词函数中的条件。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `check_prop`

```python
def check_prop(fn, prop):
  return lambda obj: fn(obj[prop])

# EXAMPLES
check_age = check_prop(lambda x: x >= 18, 'age')
user = {'name': 'Mark', 'age': 18}

check_age(user) # True
```

`check_prop`函数接收一个谓词函数`fn`和属性字符串`prop`，返回一个判别函数。使用该判别函数，可以对字典对象的属性进行判断。

`check_prop`接收一个谓词函数`fn`，在`check_prop`内部构造了一个匿名函数。该匿名函数的入参是`obj`（待判别的字典对象）。该匿名函数使用`obj[prop]`调用谓词函数`fn`，判断`obj`对象的属性`prop`是否满足特定的条件。最后`check_prop`函数返回这个匿名函数。

## `lambda`表达式

形如`lambda parameters: expression`这样的`lambda`表达式，会产生一个函数对象 。 该未命名对象的行为类似于用以下方式定义的函数：

```python
def <lambda>(parameters):
  return expression
```

因此`check_prop`函数可以改写成如下的形式：

```python
def check_prop(fn, prop):
  def anonymous1(obj):
    return fn(obj[prop])
  return anonymous1
```

`lambda x: x >= 18, 'age'`可以写成如下的匿名函数：

```python
def anonymous2(x):
  return x >= 18
```

因此从`check_prop(lambda x: x >= 18, 'age')`返回的匿名函数如下：

```python
def anonymous3(obj):
  return obj['age'] >= 18
```

`check_age`指向该匿名函数。`check_age(user)`将判断`user`对象中的`age`属性是否大于等于`18`。