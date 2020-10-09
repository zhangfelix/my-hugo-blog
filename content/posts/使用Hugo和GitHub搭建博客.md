---
title: 使用Hugo和GitHub搭建博客
date: 2020-06-13T19:45:22+08:00
lastmod: 2020-06-14T15:58:22+08:00
author: Felix
cover: /post/使用Hugo和GitHub搭建博客-cover.jpg
categories: ["技术"]
tags: ["Hugo", "GitHub"]
# showcase: true
draft: false
---

折腾了几天博客的框架终于搭建起来了。研究了一番之后，最终还是选择使用Hugo和GitHub来搭建博客。本文介绍了如何使用Hugo来搭建静态博客网站，并将其部署在GitHub上。使用`https://<USERNAME>.github.io`或者自定义的域名访问博客。

<!--more-->
## Hugo的安装和使用[^1]
### Hugo的安装

初步使用Hugo的话，只需要跟随官网的文档过一遍[Quick Start][1]就可以了解基本的安装、使用方法了。这里根据我自己的经历也进行简单的说明。

在Mac系统，通过包管理工具[Homebrew][2]可以非常简单的安装Hugo。

	brew install hugo

等待安装完成之后，可以使用`hugo version`命令来验证。

### 建立新站点

接下来从终端进入到你想要放置博客站点内容的目录下面使用

	hugo new site myblog

来建立站点。该命令会在当前目录下新建一个名为`myblog`的文件夹。你所有的站点文件都会在这个文件夹下面存放。

### 添加主题

与其他的站点工具不同，Hugo没有默认的主题，需要先添加一个主题才能新建文章。Hugo的官网上有很多的[主题][3]可选。选定一个喜欢的主题之后，需要将其下载到`myblog`文件夹中。在主题说明的页面中点击"download"的按钮，会进入到对应的GitHub页面中。有很多种方式可以将主题文件下载，并放置到`myblog/themes/<YOURTHEME>`文件夹中（`<YOURTHEME>`是主题的名称，可以在该主题的GitHub仓库的页面看到）。在这里为了使用git对站点进行管理，实现在不同的设备上方便的对站点进行维护，我们使用git的submodule功能。

	cd myblog
	git init
	git submodule add https://github.com/budparr/gohugo-theme-<YOURTHEME>.git themes/<YOURTHEME>

接下来，我们需要在配置文件中指名站点所使用的主题。打开`config.toml`直接编辑或者使用`echo 'theme = "<YOURTHEME>"' >> config.toml`命令。配置文件中还有其他的可配置内容，这些我们暂时不去管他。

### 新建文章

新建文章可以使用如下的命令，或者直接在`content/<CATEGORY>/<FILE>.<FORMAT>`里面手动创建。

	hugo new posts/my-first-post.md

在这里建议使用Hugo的`new`命令创建，因为根据主题不同，使用`new`命令创建的文件会包含简单的模版框架。例如：

	---
	title: my-first-post
	date: 2020-06-13T19:45:22+08:00
	lastmod: 2020-06-13T19:45:22+08:00
	author: Felix
	cover: /post/xxx-cover.jpg
	categories: ["技术"]
	tags: ["Hugo", "GitHub"]
	draft: true
	---

具体的配置方式和参数的意义，还请查看对应的主题说明。

### 文章中添加图片

Hugo的配置文件和文章中引用图片都是从`static`作为根目录的。也就是说上面例子中的`/post/xxx-cover.jpg`实际是在`static`文件夹中。

	.
	└── static
		└── post
			└── xxx-cover.jpg

### 开启Hugo本地服务

我们需要将Hugo本地服务跑起来，才能看到上面操作的成果，看到新的站点的样子。

	hugo server -D
	
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

打开[http://localhost:1313/][4]，我们就可以看到刚才新建的站点了。此时标记为草稿的文章也会展示，但是在实际部署站点的时候需要将文章中的`draft: true`配置改为`false`。在本地服务开启的时候，对站点的改变（修改配置，修改、新增文章等）会直接展示出来。

### 配置文件的修改

打开配置`config.toml`可以看到很多的参数可以配置，这里只描述最基本的内容，不同的主题可能会支持不同的参数配置，具体请看对应主题的说明文档。

`baseURL`是站点的域名。`title`是站点的名称。`theme`是站点的主题。

### 谷歌分析的配置

很多主题都支持谷歌分析，启用谷歌分许需要配置追踪ID。追踪ID在谷歌分析的[官网][5]注册即可获得。

### Disqus评论系统的配置

很多主题都支持评论系统，针对不同的评论系统/主题有不同的配置方式。这里简单说明下Disqus的配置。一般而言你只需要在支持Disqus的主题中配置Disqus的shortname即可。

shortname在[Disqus][6]的官网进行注册便可以获得。在注册过程就可以看到你的站点的shortname，如果遗忘的话，[admin-setting][7]页面也可以找到。

## 在GitHub部署个人博客

因为是个人博客，所以我们使用GitHub Pages的User Pages功能，具体的功能描述，可以查看[官方文档][8]。

### 创建GitHub项目

首先我们需要在GitHub上新建两个仓库分别用来保存站点源文件和发布站点。其中用来存放站点源文件的仓库可以根据自己喜好命名（例如`<YOUR-PROJECT>`），而用来发布站点的仓库的名称需要使用`<USERNAME>.github.io`。

### 本地项目与GitHub仓库同步

在`myblog`文件夹中新建`.gitignore`文件，并在其中添加下面的内容：

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

其中`public`文件夹里面的内容是Hugo生成的静态网页文件，需要上传至`<USERNAME>.github.io`，因为下面会使用`git submodule`所以这里不需要忽略。`themes`文件夹也是一样。

由于在上面“添加主题”一节已经在`myblog`文件夹下初始化过git，同时将themes使用`git submodule`的方式进行了添加。所以现在只需要用一样的方法处理`public`文件夹。不过首先我们需要删除一下现有的`public`文件夹。

	rm -rf public
	git submodule add -b master https://github.com/<USERNAME>/<USERNAME>.github.io.git public

接下来要做的事情是使用`hugo -t <YOURTHEME>`来重建静态站点，然后进入到`public`文件夹内`commit`所有的修改并上传。在这里我们同样使用官网上介绍的部署脚本的方式。首先新建`deploy.sh`脚本。

	#!/bin/sh
	
	# If a command fails then the deploy stops
	set -e
	
	# Print out commands before executing them
	set -x
	
	printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
	
	# Build the project.
	hugo -t <YOURTHEME>
	
	# Go To Public folder
	cd public
	
	# Add changes to git.
	git add .
	
	# Commit changes.
	msg="rebuilding site $(date)"
	if [ -n "$*" ]; then
		msg="$*"
	fi
	git commit -m "$msg"
	
	# Push source and build repos.
	git push origin master
	
	# Back to the origin folder
	# cd ..
	
	# rm -rf public

接下来就可以使用`./deploy.sh "Your optional commit message"`提交静态页面到`<USERNAME>.github.io`上。成功之后，就可以从浏览器访问`https://<USERNAME>.github.io`来查看你的博客内容了。然后我们将博客的源文件也提交至`<YOUR-PROJECT>`。

	
	git submodule init
	git add .
	git commit -m "注释"
	git remote add origin <YOUR-PROJECT-URL>
	git push -u origin master


后续不需要删除`public`文件，每次修改了站点内容之后，直接再次使用脚本进行部署。然后使用常规的方式将资源文件提交并更新至`GitHub`。

	./deploy.sh "Your optional commit message"
	git add .
	git commit -m "注释"
	git push

### 在新的环境继续工作

一旦转移到新的环境，在新的电脑上工作就可以把之前同步到`GitHub`上的博客源文件同步下来继续工作。当然在此之前需要在新的环境下安装Hugo。

	brew install hugo

同之前新建站点一样，首先在终端中进入想要放置博客站点内容的目录下，使用`git clone`命令拉取`GitHub`上的仓库。然后将`submodule`初始化，并更新。

	git clone <YOUR-PROJECT-URL> myblog && cd <YOUR-PROJECT>
	git submodule init
	git submodule update

 这个时候在新的环境中，两个子模块的仓库不在任何分支上，需要进入到对应的目录，然后使用`git checkout master`将分支切换到`master`上面。

	cd public
	git checkout master
	cd ../themes/<YOURTHEME>
	git checkout master

接下来就可以在新的环境继续工作了。部署站点或者提交更新的资源文件和之前都一样。需要注意的是，新的环境因为是从`GitHub`上直接同步下来的，在原来的环境中使用`hugo new`命令创建的空文件夹不会同步。当需要的时候需要自行新建。Hugo新建站点的时候目录结构如下：

	.
	├── archetypes
	├── config.toml
	├── content
	├── data
	├── layouts
	├── static
	└── themes

这些目录结构的具体用途可以查看[官方文档][9]。

不论是在哪个环境对站点进行了更新，包括不限于修改配置文件、新建文章、删除文章等，都需要及时的将站点源文件提交和同步至`GitHub`。这样在其他环境才可以拉取最新的源文件，并继续工作。在使用了`git pull`拉取了站点源文件后，不要忘记使用`git submodule update`更新子模块。

### `git submodule`的简单说明

本文采用的方法使用了`git submodule`，在这里对使用到的几个命令进行简单的说明，需要更多信息的可以查看[官方文档][10]，或者网上搜索其他教程。子模块可以让用户在一个仓库中使用其他仓库的内容，并保持独立的提交。

	git submodule add -b master https://github.com/<OTHERPROJECT>/<OTHERPROJECT>.github.io.git <OTHERPROJECT>

在现有的仓库中添加一个子模块。

	git submodule init
	git submodule update

在当前仓库里面初始化和更新子模块。也可以使用`git submodule update --init`。或者使用`git clone <YOUR-PROJECT-URL> myblog --recursive`在新的环境克隆仓库及所有子模块。

	cd public
	git checkout master
	cd ../themes/<YOURTHEME>
	git checkout master

将子模块中的分支切换到`master`。

## 给博客配置自己的域名

首先你需要有个域名，域名可以在腾讯云、阿里云、name等域名提供商购买。然后在域名的管理页面配置一个`www`子域名指向`<USERNAME>.github.io`的`CNAME`记录。接下来需要前往`GitHub`的`<USERNAME>.github.io`仓库的管理页面配置自定义域名。在仓库页面点击settings菜单，然后在Custom domain处填入你的域名，并勾选下面的Enforce HTTPS选框。

![][11]
![][12]

[^1]:	本文是根据Mac系统的使用进行撰写的，使用其他系统的如果有不同之处还请参考官方文档。

[1]:	https://gohugo.io/getting-started/quick-start/
[2]:	https://brew.sh/
[3]:	https://themes.gohugo.io/
[4]:	http://localhost:1313/
[5]:	https://analytics.google.com/analytics/web/
[6]:	https://disqus.com/profile/login/
[7]:	https://disqus.com/admin/settings/general/
[8]:	https://help.github.com/en/github/working-with-github-pages
[9]:	https://gohugo.io/getting-started/directory-structure/
[10]:	https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%AD%90%E6%A8%A1%E5%9D%97
[11]:	/post/%E4%BD%BF%E7%94%A8Hugo%E5%92%8CGitHub%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2-1.jpg
[12]:	/post/%E4%BD%BF%E7%94%A8Hugo%E5%92%8CGitHub%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2-2.jpg