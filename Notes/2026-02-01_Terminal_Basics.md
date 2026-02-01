# 2026-02-01 终端与工作流学习笔记

## 1. 基础命令与符号
- **~ (Tilde)**: 家目录符号，代表 `/Users/tao`。
  - 打法：Mac德语键盘 `Option + N` / 美语键盘 `Shift + ` `。
- **pwd**: 显示当前路径 (Print Working Directory)。
- **ls -F**: 查看目录内容（@表示链接，/表示文件夹）。
- **cd**: 切换目录。`cd ..` 返回上一层。

## 2. 别名 (Alias) —— 你的快捷键
- **gotoit**: 进入本地 IT 基地。
- **gotoschool**: 一键进入 OneDrive 学校同步文件夹。
- **生效命令**: `source ~/.zshrc` (修改配置后必须运行)。

## 3. 符号链接 (Symbolic Link) —— “传送门”
- **命令**: `ln -s "源路径" ./目标名`。
- **场景**: 把 OneDrive 里的 "TT Lernen" 链接到本地 Workspace。
- **注意**: 路径中有空格必须加双引号 `""`。

## 4. 文件管理与 GitHub 迁移
- **mv**: 移动文件夹。
- **Git 安全性**: 只要 `.git` 隐藏文件夹跟着走，GitHub 的远程连接和历史记录就不会丢失。
- **操作**: 已将 `IT-Learning-Journey` 从桌面成功移至 `~/lilarosa_Workspace/02_Learning_IT/`。

## 5. macOS 系统排错
- Finder 侧边栏消失：通过 `open ~`, 手动将文件夹拽入“收藏”栏。
- 路径劫持：理解 iCloud/OneDrive 的备份逻辑，坚持使用本地路径管理核心项目。
