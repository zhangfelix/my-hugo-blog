---
title: Python在嵌套列表的子列表中append元素的问题
date: 2021-07-16T18:00:16+08:00
lastmod: 2021-07-16T18:00:16+08:00
author: Felix
cover: /post/Python在嵌套列表的子列表中append元素的问题-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

```python
a = [[]] * 3
a[1].append('x')
b = [[] for _ in range(3)]
b[1].append('x')
```
`a`和`b`有何不同？

<!--more-->

有的同学可能会觉得这两种方法的结果是一样的，都是：
```python
[[],['x'],[]]
```
然而真实的结果是：
```python
[['x'], ['x'], ['x']] # a
[[], ['x'], []] # b
```
为什么会产生这样的区别呢，这要从`python`的数据模型说起。
`python`中每个对象都有各自的编号、类型和值。一个对象被创建后，它的编号就绝不会改变；你可以将其理解为该对象在内存中的地址。`is`运算符可以比较两个对象的编号是否相同；`id()`函数能返回一个代表其编号的整型数。
有些对象的值可以改变。值可以改变的对象被称为可变的；值不可以改变的对象就被称为不可变的。(一个不可变容器对象如果包含对可变对象的引用，当后者的值改变时，前者的值也会改变；但是该容器仍属于不可变对象，因为它所包含的对象集是不会改变的。因此，不可变并不严格等同于值不能改变，实际含义要更微妙。) 一个对象的可变性是由其类型决定的；例如，数字、字符串和元组是不可变的，而字典和列表是可变的。[^1]
在一开始的问题中，列表`a`初始化的时候，内层的子列表`[]`实际上是引用了同一个可变对象。因此对内层的任意一个子列表的`append()`操作，最终会因为引用了同一个对象的原因，体现在每一个子列表上。
```python
>>> id(a[0])
4525967488
>>> id(a[1])
4525967488
>>> id(a[2])
4525967488
```
而`b`初始化的时候是创建了3个不同`[]`对象。每个子列表引用了不同的对象。
```python
>>> id(b[0])
4525966272
>>> id(b[1])
4525924864
>>> id(b[2])
4525906304
```
在`python`的官方文档中也说明了这种情况，`lst * n`这种形式相当于`lst`与自身进行`n`次拼接。`lst`中的项不会被拷贝，而是会进行多次引用。[^2]

[^1]:	[https://docs.python.org/zh-cn/3/reference/datamodel.html#data-model](https://docs.python.org/zh-cn/3/reference/datamodel.html#data-model)

[^2]:	[https://docs.python.org/zh-cn/3/library/stdtypes.html#common-sequence-operations](https://docs.python.org/zh-cn/3/library/stdtypes.html#common-sequence-operations)
