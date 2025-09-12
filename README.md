# 📚 Litho Book - Documentation Reader

一个为 deepwiki-rs (litho) 文档生成引擎所生成的文档提供的现代化Web阅读器。

## ✨ 功能特性

- 🌲 **智能目录树** - 左侧显示文档目录结构，文件夹默认折叠，支持展开/收起
- 📖 **实时渲染** - 右侧实时渲染markdown文档内容
- 📊 **Mermaid图表支持** - 完美支持各种Mermaid图表渲染
- 🔍 **智能搜索** - 快速搜索文档文件，支持文件名和路径匹配
- 📱 **响应式设计** - 支持桌面和移动设备，自适应布局
- ⚡ **高性能** - 基于Rust和Axum构建，性能卓越
- 🎨 **现代UI** - 简洁美观的用户界面，清晰的信息展示
- 📁 **路径显示** - 标题栏显示当前文档目录路径
- 🔤 **智能排序** - 目录和文件按名称自动排序

## 🚀 快速开始

### 安装

```bash
# 克隆项目
git clone <repository-url>
cd litho-book

# 编译项目
cargo build --release
```

### 使用方法

```bash
# 基本用法 - 指定文档目录
cargo run -- --docs-dir ./sample-markdowns-docdir

# 指定端口和自动打开浏览器
cargo run -- --docs-dir ./docs --port 8080 --open

# 启用详细日志
cargo run -- --docs-dir ./docs --verbose

# 查看帮助
cargo run -- --help
```

### 命令行参数

- `-d, --docs-dir <DIR>` - 指定markdown文档目录路径 (必需)
- `-p, --port <PORT>` - 指定服务器端口 (默认: 3000)
- `--host <HOST>` - 指定绑定的主机地址 (默认: 127.0.0.1)
- `-o, --open` - 启动后自动打开浏览器
- `-v, --verbose` - 启用详细日志输出
- `-h, --help` - 显示帮助信息

## 🏗️ 技术架构

### 技术选型

- **CLI框架**: `clap` - 强大的命令行参数解析
- **Web框架**: `axum` - 高性能异步web框架  
- **模板引擎**: `askama` - 编译时模板引擎
- **Markdown渲染**: `pulldown-cmark` - 高性能Markdown解析器
- **异步运行时**: `tokio` - Rust生态最成熟的异步运行时

### 系统架构

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   CLI Layer     │    │  Web Server     │    │   Frontend      │
│                 │    │                 │    │                 │
│ • 参数解析      │───▶│ • Axum路由      │───▶│ • 目录树组件    │
│ • 配置验证      │    │ • 静态文件服务  │    │ • Markdown渲染  │
│ • 服务启动      │    │ • API接口       │    │ • Mermaid图表   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │ Filesystem      │
                       │                 │
                       │ • 目录扫描      │
                       │ • 文件读取      │
                       │ • 树结构构建    │
                       └─────────────────┘
```

## 📁 项目结构

```
litho-book/
├── src/
│   ├── main.rs          # 主程序入口
│   ├── cli.rs           # CLI参数处理
│   ├── filesystem.rs    # 文件系统操作
│   ├── server.rs        # Web服务器
│   └── error.rs         # 错误处理
├── templates/
│   └── index.html       # 主页面模板
├── sample-markdowns-docdir/  # 示例文档
├── Cargo.toml           # 项目配置
└── README.md            # 项目文档
```

## 🌟 界面预览

### 桌面端
- 左侧：可折叠的文档目录树，支持搜索
- 右侧：渲染后的markdown内容，支持Mermaid图表
- 顶部：应用标题和导航

### 移动端
- 响应式布局，自动适配小屏幕
- 侧边栏可收起，节省屏幕空间
- 触摸友好的交互设计

## 🔧 开发

### 开发环境要求

- Rust 1.70+
- Cargo

### 本地开发

```bash
# 运行开发版本
cargo run -- --docs-dir ./sample-markdowns-docdir --verbose

# 运行测试
cargo test

# 检查代码
cargo clippy

# 格式化代码
cargo fmt
```

### API接口

- `GET /` - 主页面
- `GET /api/file?file=<path>` - 获取文件内容
- `GET /api/tree` - 获取目录树结构
- `GET /api/search?q=<query>` - 搜索文件
- `GET /api/stats` - 获取统计信息
- `GET /health` - 健康检查

## 📝 使用示例

### 启动服务器

```bash
# 使用默认设置
cargo run -- -d ./docs

# 自定义端口并自动打开浏览器
cargo run -- -d ./docs -p 8080 -o

# 绑定到所有网络接口
cargo run -- -d ./docs --host 0.0.0.0 -p 3000
```

### 访问界面

1. 启动服务器后，访问显示的URL (默认: http://127.0.0.1:3000)
2. 左侧目录树显示所有markdown文件
3. 点击文件名查看内容
4. 使用搜索框快速查找文件
5. Mermaid图表会自动渲染

## 🤝 贡献

欢迎提交Issue和Pull Request！

## 📄 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 🙏 致谢

- [deepwiki-rs](https://github.com/your-org/deepwiki-rs) - 文档生成引擎
- [Axum](https://github.com/tokio-rs/axum) - Web框架
- [Mermaid](https://mermaid.js.org/) - 图表渲染
- [pulldown-cmark](https://github.com/raphlinus/pulldown-cmark) - Markdown解析器