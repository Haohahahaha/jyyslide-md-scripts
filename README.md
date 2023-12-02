# HaohahaPPT

本项目基于 [jyyslide-md](https://github.com/zweix123/jyyslide-md#install) 构建自动化脚本，实现一键安装，直接上手使用。

## Pre-install

- 首先在 Github 上建立一个存放PPT的 名为 `A` 的仓库

- 之后在本地建立一个仓库同名文件夹 `A`

- 克隆本仓库，将本仓库的内容全部复制到 `A` 中即可

## Install

敬请期待

## 使用教程

- `pptnew [DOC_NAME]` 新建一个名为 `DOC_NAME` 的 markdown 文档，并直接用 `vim` 打开进行编辑

- `pptgen [DOC_NAME]` 基于名为 `DOC_NAME` 的 markdown 文档生成名为 `DOC_NAME` 的网页PPT

- `pptdel [DOC_NAME]` 删除名为 `DOC_NAME` 的 markdown 系列文件

- `pptopen [DOC_NAME]` 打开已建立过 名为 `DOC_NAME` 的文档，进行编辑内容

- `pptshow [DOC_NAME]` firefox打开生成的本地ppt页面

- `pptupd` 上传更新的内容

## Bugs

- 目前多次执行 `pptgen` 会重复添加文档链接到 `README.md`，后续打补丁时将采用替换方案。

- 目前不支持删除项目，未来将添加 `pptdel` 命令
