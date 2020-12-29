---
title: Python代码阅读（第96篇）：字典按照键进行排序
date: 2020-12-29T12:33:04+08:00
lastmod: 2020-12-29T12:33:04+08:00
author: Felix
cover: /post/Python代码阅读（第96篇）_字典按照键进行排序-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将字典各项根据键按照字典顺序进行排序的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `sort_dict_by_key`

```py
def sort_dict_by_key(d, reverse = False):
  return dict(sorted(d.items(), reverse = reverse))

# EXAMPLES
d = {'one': 1, 'three': 3, 'five': 5, 'two': 2, 'four': 4}
sort_dict_by_key(d) # {'five': 5, 'four': 4, 'one': 1, 'three': 3, 'two': 2}
sort_dict_by_key(d, True)
# {'two': 2, 'three': 3, 'one': 1, 'four': 4, 'five': 5}
```

函数`sort_dict_by_key`接收一个字典`d`，和一个`reverse`标识，返回根据字典键排序后的新字典。

函数先使用`dict.item()`获取字典`(key, value)`的可迭代对象。然后使用`sorted()`函数进行排序，最后将排序结果重新转换成字典。

针对`(key, value)`排序的逻辑是先使用`key`按照字典顺序进行排序，然后使用`value`按照字典顺序进行排序。

`sorted`针对元组进行排序是先按照第一个元素排序，再按照第二个元素，一次类推。

```py
>>> a = [(1,'c','B'),(1,'c','A'),(1,'a','C'),(0,'a','a'),(2,'a','a')]
>>> sorted(a)
[(0, 'a', 'a'), (1, 'a', 'C'), (1, 'c', 'A'), (1, 'c', 'B'), (2, 'a', 'a')]
```

目前我只在官方文档的《排序指南》的“[使用装饰-排序-去装饰的旧方法](https://docs.python.org/zh-cn/3/howto/sorting.html#the-old-way-using-decorate-sort-undecorate)”看到一句话提到`sorted`函数的这种行为方式。

![](/post/Python代码阅读（第96篇）_字典按照键进行排序-1.jpg)

因此目前无法确认这种元组排序的行为方式是设计如此，还仅仅是`sorted`函数的实现产生的副作用，有可能会随时因为实现方式的改变而变化。如果有更确切的来源说明，还请在评论区留言指教。
