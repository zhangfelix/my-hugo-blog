---
title: 使用Hugo和GitHub搭建博客
date: 2020-06-13T19:45:22+08:00
lastmod: 2020-06-14T15:58:22+08:00
author: Zhang nan
cover: /post/使用Hugo和GitHub搭建博客-cover.jpg
categories: ["技术"]
tags: ["Hugo", "GitHub"]
# showcase: true
draft: false
---

（施工中……）折腾了几天博客的框架终于搭建起来了。研究了一番之后，最终还是选择使用Hugo和GitHub来搭建博客。本文介绍了如何使用Hugo来搭建静态博客网站，并将其部署在GitHub上。（可选）并使用自己的域名访问博客。

<!--more-->
## Hugo的安装和使用[^1]
[^1]:本文是根据Mac系统的使用进行撰写的，使用其他系统的如果有不同之处还请参考官方文档。
### Hugo的安装

初步使用Hugo的话，只需要跟随官网的文档过一遍[Quick Start](https://gohugo.io/getting-started/quick-start/)就可以了解基本的安装、使用方法了。这里根据我自己的经历也进行简单的说明。

在Mac系统，通过包管理工具[Homebrew](https://brew.sh/)可以非常简单的安装Hugo。
```
brew install hugo
```
等待安装完成之后，可以使用`hugo version`命令来验证。

### 建立新站点

接下来从终端进入到你想要放置博客站点内容的目录下面使用
```
hugo new site myblog
```
来建立站点。该命令会在当前目录下新建一个名为"myblog"的文件夹。你所有的站点文件都会在这个文件夹下面存放。

### 添加主题

与其他的站点工具不同，Hugo没有默认的主题，需要先添加一个主题才能新建文章。Hugo的官网上有很多的[主题](https://themes.gohugo.io/)可选。选定一个喜欢的主题之后，需要将其下载到myblog文件夹中。在主题说明的页面中点击"download"的按钮，会进入到对应的GitHub页面中。有很多种方式可以将主题文件下载，并放置到"myblog/themes/theme_name"文件夹中（theme_name是主题的名称，可以在该主题的GitHub仓库的页面看到）。在这里为了使用git对站点进行管理，实现在不同的设备上方便的对站点进行维护，我们使用git的submodule功能。
```
cd myblog
git init
git submodule add https://github.com/budparr/gohugo-theme-theme_name.git themes/theme_name
```
接下来，我们需要在配置文件中指名站点所使用的主题。打开config.toml直接编辑或者使用`echo 'theme = "theme_name"' >> config.toml`命令。配置文件中还有其他的可配置内容，这些我们暂时不去管他。

### 新建文章

新建文章可以使用如下的命令，或者直接在`content/<CATEGORY>/<FILE>.<FORMAT>`里面手动创建。
```
hugo new posts/my-first-post.md
```
在这里建议使用Hugo的`new`命令创建，因为根据主题不同，使用`new`命令创建的文件会包含简单的模版框架。例如：
```
---
title: 使用Hugo和GitHub搭建博客
date: 2020-06-13T19:45:22+08:00
lastmod: 2020-06-13T19:45:22+08:00
author: Zhang nan
categories: ["技术"]
tags: ["Hugo", "GitHub"]
draft: true
---
```
具体的配置方式和参数的意义，还请查看对应的主题说明。

### 开启Hugo本地服务

我们需要将Hugo本地服务跑起来，才能看到上面操作的成果，看到新的站点的样子。
```
▶ hugo server -D

                   | EN
+------------------+----+
  Pages            | 10
  Paginator pages  |  0
  Non-page files   |  0
  Static files     |  3
  Processed images |  0
  Aliases          |  1
  Sitemaps         |  1
  Cleaned          |  0

Total in 11 ms
Watching for changes in /Users/workspace/myblog/{content,data,layouts,static,themes}
Watching for config changes in /Users/workspace/myblog/config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```
打开[http://localhost:1313/](http://localhost:1313/)，我们就可以看到刚才新建的站点了。此时标记为草稿的文章也会展示，但是在实际部署站点的时候需要将文章中的`draft: true`配置改为`false`。在本地服务开启的时候，对站点的改变（修改配置，修改、新增文章等）会直接展示出来。

### 配置文件的修改

打开配置`config.toml`可以看到很多的参数可以配置，这里只描述最基本的内容，不同的主题可能会支持不同的参数配置，具体请看对应主题的说明文档。

`baseURL`是站点的域名。`title`是站点的名称。`theme`是站点的主题。

### 谷歌分析的配置

很多主题都支持谷歌分析，启用谷歌分许需要配置追踪ID。追踪ID在谷歌分析的[官网](https://analytics.google.com/analytics/web/)注册即可获得。

### Disqus评论系统的配置

很多主题都支持评论系统，针对不同的评论系统/主题有不同的配置方式。这里简单说明下Disqus的配置。一般而言你只需要在支持Disqus的主题中配置Disqus的shortname即可。

shortname在[Disqus](https://disqus.com/profile/login/)的官网进行注册便可以获得。在注册过程就可以看到你的站点的shortname，如果遗忘的话，[admin-setting](https://disqus.com/admin/settings/general/)页面也可以找到。

## 在GitHub部署个人博客

因为是个人博客，所以我们使用GitHub Pages的User Pages功能，具体的功能描述，可以查看[官方文档](https://help.github.com/en/github/working-with-github-pages)。

### 创建GitHub项目

首先我们需要在GitHub上新建两个仓库分别用来保存站点源文件和发布站点。其中用来存放站点源文件的仓库可以根据自己喜好命名，而用来发布站点的仓库的名称需要使用`username.github.io`

### 本地项目与GitHub仓库同步

在`myblog`文件夹中新建`.gitignore`文件，并在其中添加下面的内容：
```
### Hugo ###
# Generated files by hugo
# /public/
/resources/_gen/
# /themes/

# Executable may be added to repository
hugo.exe
hugo.darwin
hugo.linux

# OSX
.DS_Store
```
其中`public`文件夹里面的内容是Hugo生成的静态网页文件，需要上传至`username.github.io`，因为下面会使用`git submodule`所以这里不需要忽略。`themes`文件夹也是一样。


(施工中……)