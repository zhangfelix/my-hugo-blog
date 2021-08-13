---
title: 在emacs上使用Python虚拟环境
date: 2021-08-13T18:20:05+08:00
lastmod: 2021-08-13T18:20:05+08:00
author: Felix
cover: /post/在emacs上使用Python虚拟环境.jpg
categories: ["技术"]
tags: ["Emacs", "Python"]
draft: false
---

使用的是purcell的[基础配置](https://github.com/purcell/emacs.d)。在不使用该配置的情况下也有可能出现类似的问题。

使用的Python环境管理是`conda`

<!--more-->

## anaconda-mode失败
详细情况记录在这个[issue](https://github.com/purcell/emacs.d/issues/774)上。
一开始使用anaconda-mode自带的切换方式，`M-x pythonic-activate RET /path/to/virtualenv RET`，发现在`Python Shell`、`pdb`和`flycheck`上分别使用了不同的虚拟环境。

后续分别尝试了`direnv.el`插件和`purcell`的`envrc.el`插件。这两个插件都是基于[direnv](https://github.com/direnv/direnv)工作的。

## direnv

[direnv](https://github.com/direnv/direnv)是一个`shell`扩展，可以根据`shell`进入的目录不同，加载和卸载环境变量。这个[主页](https://direnv.net/)可以看到`direnv`的安装方式。这个[wiki](https://github.com/direnv/direnv/wiki)包含的使用方法和与其他工具的集成，包括了如何切换Python的虚拟环境的[方法](https://github.com/direnv/direnv/wiki/Python)。

## direnv.el
使用这个插件，我发现需要在一个`.envrc`文件的目录下打开`emacs`才能正常使用。如果不是在该环境下，虚拟环境的自动切换并不起作用。一旦生效了，切换目录时，虚拟环境会自动切换，并且在上述的三个环境中都可以使用相同的环境。特别的，在`python shell`中，只需要`exit()`，重新再`C-c C-p`就可以在新环境中运行。

## envrc.el
会出现第一次打开一个存在.envrc文件目录的文件时，虚拟环境不起作用。此时手动`M-x envrc-allow RET`才能生效。此时切换工作目录可以自动切换虚拟环境。但是特别的，在`python shell`中，需要完全kill掉buffer，重新再`C-c C-p`才可以在新环境中运行。