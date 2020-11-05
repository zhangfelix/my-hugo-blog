---
title: Python代码阅读（第67篇）：获取列表中的去重后的元素
date: 2020-11-05T12:30:57+08:00
lastmod: 2020-11-05T12:30:57+08:00
author: Felix
cover: /post/Python代码阅读（第67篇）_获取列表中的去重后的元素-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将列表中的元素去重后返回的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `unique_elements`

```python
def unique_elements(li):
  return list(set(li))

# EXAMPLES
unique_elements([1, 2, 2, 3, 4, 3]) # [1, 2, 3, 4]
```

`unique_elements`函数接收一个列表`li`，返回去重后的元素的列表。`Python`中实现列表去重比较简单，只需要使用`list`对象构造`set`对象就可以了。如果需要的话，还可以用去重后的`set` 对象，重新构造一个`list`对象。
