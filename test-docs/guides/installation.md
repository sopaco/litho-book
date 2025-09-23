# 安装指南

## 系统要求

- Rust 1.70 或更高版本
- 操作系统：Windows、macOS、Linux

## 安装步骤

### 1. 克隆项目

```bash
git clone https://github.com/your-org/litho-book.git
cd litho-book
```

### 2. 编译项目

```bash
cargo build --release
```

### 3. 运行服务

```bash
cargo run -- --docs-dir /path/to/your/docs --port 8080
```

## 配置选项

### 命令行参数

- `--docs-dir`: 文档目录路径（必需）
- `--port`: 服务端口号（默认：3000）
- `--host`: 绑定地址（默认：127.0.0.1）

### 环境变量

- `LITHO_BOOK_PORT`: 设置端口号
- `LITHO_BOOK_HOST`: 设置绑定地址

## Docker 部署

```dockerfile
FROM rust:1.70 as builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates
COPY --from=builder /app/target/release/litho-book /usr/local/bin/
EXPOSE 8080
CMD ["litho-book", "--docs-dir", "/docs", "--port", "8080", "--host", "0.0.0.0"]
```

## 故障排除

### 常见问题

1. **端口被占用**
   - 解决方案：使用 `--port` 参数指定其他端口

2. **文档目录不存在**
   - 解决方案：确保指定的目录存在且包含 Markdown 文件

3. **权限问题**
   - 解决方案：确保程序有读取文档目录的权限

### 日志调试

启用详细日志：
```bash
RUST_LOG=debug cargo run -- --docs-dir ./docs