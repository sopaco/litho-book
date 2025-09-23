# API 文档

## 搜索 API

### 全文搜索

**接口地址**：`GET /api/search`

**请求参数**：
- `q` (string): 搜索关键词

**响应格式**：
```json
{
  "results": [
    {
      "file_path": "README.md",
      "file_name": "README.md",
      "title": "项目概述",
      "matches": [
        {
          "line_number": 5,
          "content": "这是一个测试文档，用于演示全文搜索功能。",
          "highlighted_content": "这是一个测试文档，用于演示<mark>全文搜索</mark>功能。",
          "context_before": "# 项目概述",
          "context_after": ""
        }
      ],
      "relevance_score": 5.5
    }
  ],
  "total": 1,
  "query": "全文搜索"
}
```

### 文件内容 API

**接口地址**：`GET /api/file`

**请求参数**：
- `file` (string): 文件路径

**响应格式**：
```json
{
  "content": "原始 Markdown 内容",
  "html": "渲染后的 HTML",
  "path": "README.md",
  "size": 1024,
  "modified": "2024-01-01 12:00:00"
}
```

### 目录树 API

**接口地址**：`GET /api/tree`

**响应格式**：
```json
{
  "name": "root",
  "path": "",
  "is_file": false,
  "children": [
    {
      "name": "README.md",
      "path": "README.md",
      "is_file": true,
      "children": [],
      "size": 1024,
      "modified": "2024-01-01 12:00:00"
    }
  ]
}
```

### 统计信息 API

**接口地址**：`GET /api/stats`

**响应格式**：
```json
{
  "total_files": 10,
  "total_dirs": 3,
  "total_size": 51200,
  "formatted_size": "50.0 KB"
}
```

## 错误处理

所有 API 在出错时返回相应的 HTTP 状态码：

- `400 Bad Request`: 请求参数错误
- `404 Not Found`: 文件不存在
- `500 Internal Server Error`: 服务器内部错误

错误响应格式：
```json
{
  "error": "错误描述信息"
}