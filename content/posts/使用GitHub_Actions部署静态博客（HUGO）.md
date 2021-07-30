---
title: 使用GitHub_Actions部署静态博客（HUGO）
date: 2021-07-30T16:30:12+08:00
lastmod: 2021-07-30T16:30:12+08:00
author: Felix
cover: /post/使用GitHub_Actions部署静态博客（HUGO）_cover.jpg
categories: ["技术"]
tags: ["Hugo", "GitHub"]
draft: false
---

## 前言
之前讲解过如何[使用Hugo和GitHub搭建博客](https://www.zhangfelix.com/posts/%E4%BD%BF%E7%94%A8hugo%E5%92%8Cgithub%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/)，采用的是直接使用部署脚本打包上传博客源文件和部署静态博客。最近一段时间，我升级采用`gitHub Action`来进行博客的部署发布，在这里给大家分享一下。

<!--more-->

## 什么是`GitHub Actions`
`GitHub Actions`是`GitHub`推出的持续集成服务。在博客部署的场景下，它可以在源文件上传的时刻被触发，然后自动运行一个虚拟机，使用`Hugo`生成静态博客文件，并自动上传部署。
在`GitHub Actions`的体系中，允许开发者开发独立的`action`以供复用或者其他开发者使用。这些`action`定义了很多常用的操作，例如抓取代码、配置环境、部署等。所以在自己编写持续集成的脚本的时候，可以直接引用这些定义好的`action`。而`GitHub`做了一个`action`市场，进一步的简化了`action`的集成。
## 编写`GitHub Actions`脚本
首先在博客源文件目录下新建`.github/workflows`文件夹，然后再新建`GitHub Actions`脚本。脚本采用`YAML`格式，后缀为`.yml`。脚本内容如下：
```yaml
# ci.yml

name: CI

# Controls when the workflow will run
on:
  # Triggers the workflow on push or pull request events but only for the master branch
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2
        with:
          submodules: recursive

      # setup hugo
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          deploy_key: ${{ secrets.ACTIONS_DEPLOY_KEY }}
          external_repository: <USERNAME>/<USERNAME>.github.io
          publish_branch: master
          publish_dir: ./public
          cname: <custom domain>
          user_name: '<user_name>'
          user_email: '<user_email>'

```
结构上比较清晰简单。首先是脚本名称。
```yaml
name: CI
```
然后是脚本的触发时机。
```yaml
# Controls when the workflow will run
on:
  # Triggers the workflow on push or pull request events but only for the master branch
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
```
最后是脚本的工作流，这个脚本只有一个流程`build`。在`build`这个流程里面首先说明了运行环境`runs-on: ubuntu-latest`，然后就是4个步骤或者任务。
```yaml
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest
```
第一个是将现在的仓库检出。其中`uses: actions/checkout@v2`说明了使用哪个`action`。`submodules`参数取值`recursive`说明需要递归的检出子模块。这样设置是为了能够将`themes`一并检出。
```yaml
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2
        with:
          submodules: recursive
```
第二个是设置`Hugo`环境，直接使用了官方的`action`并使用最新的版本。
```yaml
      # setup hugo
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
```
第三个是生成静态博客文件，直接使用`run`执行一行`shell`命令。
```yaml
      - name: Build
        run: hugo --minify
```
最后就是将生成的静态博客文件上传至`<USERNAME>/<USERNAME>.github.io`仓库，完成博客部署。其中使用了`deploy key`进行权限控制。`${{ secrets.ACTIONS_DEPLOY_KEY }}`引用了`Repository secrets`中设置的`deploy key`的私钥。`ACTIONS_DEPLOY_KEY`则是对应的`secrets`的参数名称。
```yaml
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          deploy_key: ${{ secrets.ACTIONS_DEPLOY_KEY }}
          external_repository: <USERNAME>/<USERNAME>.github.io
          publish_branch: master
          publish_dir: ./public
          cname: <custom domain>
          user_name: '<user_name>'
          user_email: '<user_email>'
```
## `deploy key`配置
为了能够将静态博客文件上传至`<USERNAME>/<USERNAME>.github.io`仓库，需要进行`deploy key`的配置。首先在本地[生成一对`SSH`密钥](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)，然后将公钥配置到目标仓库，即在目标仓库的`settings`中添加`deploy key`的公钥。
![](/post/使用GitHub_Actions部署静态博客（HUGO）_1.png)
![](/post/使用GitHub_Actions部署静态博客（HUGO）_2.png)
然后在博客源文件的仓库中配置`deploy key`的私钥。从而让`action`脚本可以调用。在仓库的`settings`中新增`repository secret`，将`deploy key`的私钥添加进去。
![](/post/使用GitHub_Actions部署静态博客（HUGO）_3.jpg)
## 其他操作
使用`GitHub Actions`脚本自动部署静态博客的话，就不需要在本地保留`public`文件删除，也不需要将其上传至博客源文件仓库。因此需要使用下列命令将 `public`文件夹从`git`仓库中删除。
```bash
git rm -r public
```
然后因为本地测试的时候，经常会再次生成`public`文件夹，因此，我们需要将其写入`.gitignore`，在其中添加一行
```gitignore
/public/
```
## 测试
最后就可以提交所有代码，并测试脚本的运行情况了。像通常一样进行`commit`和`push`之后，我们就可以在博客源文件所属的仓库中看到自动部署的日志了。
![](/post/使用GitHub_Actions部署静态博客（HUGO）_4.jpg)
