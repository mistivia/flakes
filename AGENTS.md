# Flakes

这里是专门存放一些flakes的地方。这个仓库不准存放项目源代码，这里只会摆放其他github或者
别的什么git仓库里面的非nix项目的flake.nix

目前主要是C++项目。

每个目录是一个项目，里面会有一个flake.nix 和 flake.lock

TASK.md 文件在 .gitignore 里面，fd命令和rg命令可能找不到。直接cat就行。

## 网络环境

你在中国，访问github、pip可能会受到防火墙干扰。必要时请使用`proxychains -q <你要执行的命令>`
