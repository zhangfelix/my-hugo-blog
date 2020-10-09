---
title: Python代码阅读（第22篇）：从源字典映射出新字典
date: 2020-08-10T18:30:37+08:00
lastmod: 2020-08-10T18:30:37+08:00
author: Felix
cover: /post/Python代码阅读（第22篇）_从源字典映射出新字典-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码基于输入的源字典创建一个新的字典，保持`key`值不变，`vaule`值是源字典对应`vaule`进行映射获得的。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `map_values`

```python
def map_values(obj, fn):
  ret = {}
  for key in obj.keys():
    ret[key] = fn(obj[key])
  return ret

# EXAMPLES
users = {
  'fred': { 'user': 'fred', 'age': 40 },
  'pebbles': { 'user': 'pebbles', 'age': 1 }
}

map_values(users, lambda u : u['age']) # {'fred': 40, 'pebbles': 1}
```

`map_values`函数输入一个字典`obj`和映射`fn`，初始化一个新的字典，并针对输入字典的每个`k-v`对，保持`key`值不变，使用映射`fn`计算新`value`值。

`dict.keys()`返回字典的`key` 组成的新视图。

`dict[key]`返回`key`所对应的`value`值。

`dict[key] = value`将`dict[key]`的值设置为`value`。

`map_values`函数首先新建了一个空字典`ret`，然后遍历输入字典的所有`key`，针对每个`value`使用映射`fn`获取新的`value`，并将新字典的`key`设置成新的`value`。
