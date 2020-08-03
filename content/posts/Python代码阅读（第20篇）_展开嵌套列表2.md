---
title: Python代码阅读（第20篇）：展开嵌套列表2
date: 2020-08-03T12:24:50+08:00
lastmod: 2020-08-03T12:24:50+08:00
author: Zhang nan
cover: /post/Python代码阅读（第20篇）_展开嵌套列表2-cover.jpg
categories: ["技术"]
tags: ["Python"]
draft: false
---

本篇阅读的代码实现将一个包含基础元素和列表元素的列表展开成一个新列表的功能。

本篇阅读的代码片段来自于[30-seconds-of-python](https://github.com/30-seconds/30-seconds-of-python)。

<!--more-->

## `spread`

```python
def spread(arg):
  ret = []
  for i in arg:
    ret.extend(i) if isinstance(i, list) else ret.append(i)
  return ret

# EXAMPLES
spread([1, 2, 3, [4, 5, 6], [7], 8, 9]) # [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

`spread`函数将一个列表的元素平铺到一个新的列表中。`spread`遍历原列表所有元素，如果元素是一个 list，则使用`list.extend()`，否则使用`list.append()`。

`isinstance(object, classinfo)`用于判断输入`object`是否属于`classinfo`类型的实例或是其子类。在这里用于判断原始列表中的元素是否是一个`list`。

`ret.extend(i)`和`ret += i`一样，使用`i`的内容扩展`ret`，将列表`i`中的元素逐个加入到列表`ret`中。类似于`ret[len(ret):len(ret)] = i`操作。

`ret.append(i)`将`i`作为一个元素添加到列表`ret`的末尾，和`ret[len(ret):len(ret)] = [i]`一样。
