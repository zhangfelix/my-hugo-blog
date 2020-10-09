---
title: Python代码阅读（第33篇）：反转字典
date: 2020-09-02T17:39:44+08:00
lastmod: 2020-09-02T17:39:44+08:00
author: Felix
cover: /post/Python代码阅读（第33篇）_反转字典-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现了将一个字典进行反转，且原字典的值非唯一。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `collect_dictionary`

```python
def collect_dictionary(obj):
  inv_obj = {}
  for key, value in obj.items():
    inv_obj.setdefault(value, list()).append(key)
  return inv_obj

# EXAMPLES
ages = {
  "Peter": 10,
  "Isabel": 10,
  "Anna": 9,
}
collect_dictionary(ages) # { 10: ["Peter", "Isabel"], 9: ["Anna"] }
```

`collect_dictionary`函数接收一个字典，返回反转后的字典。函数使用`dictionary.items()`循环获取每一个原字典的键值对，使用`dictionary.setdefault()`和`append()`将原字典的值映射到键上。使用`list()`将新键的值定义为列表。

因为原字典的所有值不唯一，反转字典之后，新的键也可能对应多个值。因此反转后的字典的值是一个列表，每个列表中的元素是原字典的一个或多个键。

`dictionary. setdefault(key[, default])`如果字典存在键`key`，返回它的值。如果不存在，插入值为`default`的键`key`，并返回`default`。 

```python
for key, value in obj.items():
    inv_obj.setdefault(value, list()).append(key)
```

如果新的字典`inv_obj`已经有`key == value`，就会返回这个`key`对应的值（一个列表），然后使用`append`将原字典的键加入其中。如果新的字典`inv_obj`没有`key == value`，就会插入这个`key`，设置它的值为`list()`，并返回这个空列表。然后使用`append`将原字典的键加入其中。
