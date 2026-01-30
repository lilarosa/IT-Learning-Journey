# 🚀 2026-01-30：Mac mini M4 配置与 Git 环境实战全记录

## 1. 🖥️ 终端与基础环境 (iTerm2 & Homebrew)
- **iTerm2**: 安装并配置了更强大的终端工具，取代系统自带 Terminal。
- **Homebrew (Mac 必备包管理器)**:
  - 安装命令: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
  - 作用: 以后安装任何软件（如 git, python, nvm）只需 `brew install 软件名`。
- **Zsh 配置**: 确认了 Mac 默认使用 Zsh，并学会了处理 `.zshrc` 环境。

## 2. 📂 项目结构搭建
- **路径**: `~/Desktop/IT-Learning-Journey`
- **操作**:
  - `mkdir -p Notes Scripts`: 创建笔记与脚本双目录。
  - `ls -R`: 递归检查文件结构。

## 3. 🔐 Git 与 GitHub 深度配置
- **身份识别**:
  - `git config --global user.name "lilarosa"`
  - `git config --global user.email "你的邮箱"`
- **解决 403 权限问题**:
  - 使用 **Personal Access Token (PAT)** 进行身份验证。
  - **关联命令**: `git remote add origin https://lilarosa:[TOKEN]@github.com/lilarosa/IT-Learning-Journey.git`
- **保存凭据**:
  - `git config --global credential.helper applekeychain`: 让 Mac 钥匙串记住 Token。

## 4. 🔄 仓库管理与“三连招”
- **日常同步**:
  - `git add .` (追踪改动)
  - `git commit -m "描述"` (记录改动)
  - `git push` (同步到云端)

## 5. 🆘 紧急避坑与报错排查 (Secret Scanning)
- **现象**: `Push rejected due to repository rule violations`。
- **原因**: 历史记录中包含了 `ghp_` 开头的 Token 敏感信息。
- **核心修复命令**:
  - `git reset --soft HEAD~1`: 撤销 commit 但保留代码。
  - `git reset --hard origin/main`: **重置**本地，彻底对齐云端（会丢弃未提交改动）。
  - `rm 文件名`: 物理删除本地违规文件。

## 6. ✍️ 命令行编辑技巧
- **nano**: `nano 文件名` 进入编辑。
  - `Ctrl + O` -> `Enter`: 保存。
  - `Ctrl + X`: 退出。
- **cat**: 使用 `cat <<EOF > 文件名` 快速写入多行文本。
- **date**: `$(date +%Y-%m-%d)` 自动获取当前日期。

---
*记录人: lilarosa | 坐标: 德国*
