<!doctype html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Litho Book</title>
        <!-- 引入字体 -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Geist:wght@300;400;500;600;700&family=Noto+Sans+SC:wght@300;400;500;600;700&family=Noto+Serif+SC:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@300;400;500;600;700&display=swap"
            rel="stylesheet"
        />
        <!-- 字体显示优化 -->
        <style>
            @font-face {
                font-family: 'Noto Sans SC';
                font-display: swap;
            }
            @font-face {
                font-family: 'Noto Serif SC';
                font-display: swap;
            }
            @font-face {
                font-family: 'Geist';
                font-display: swap;
            }
            @font-face {
                font-family: 'Inter';
                font-display: swap;
            }
        </style>

        <style>
            :root {
                /* 白月光主题 */
                --bg-primary: #ffffff;
                --bg-secondary: #f8f9fa;
                --bg-tertiary: #e9ecef;
                --text-primary: #333333;
                --text-secondary: #6c757d;
                --text-tertiary: #495057;
                --border-color: #e9ecef;
                --accent-color: #007bff;
                --accent-hover: #0056b3;
                --header-bg: #2c3e50;
                --header-text: #ffffff;
                --sidebar-bg: #f8f9fa;
                --code-bg: #f1f3f4;
                --code-text: #e83e8c;
                --pre-bg: #f8f9fa;
                --table-stripe: #f8f9fa;
                --blockquote-bg: #f8f9fa;
                --shadow: rgba(0, 0, 0, 0.1);

                /* 字体设置 */
                --font-family:
                    "Geist", -apple-system, BlinkMacSystemFont, "Segoe UI",
                    "Helvetica Neue", Arial, sans-serif;
                --font-size-base: 16px;
                --font-size-scale: 1;
            }

            /* 暮光影主题 */
            [data-theme="dark"] {
                --bg-primary: #1a1a1a;
                --bg-secondary: #2d2d2d;
                --bg-tertiary: #404040;
                --text-primary: #e0e0e0;
                --text-secondary: #b0b0b0;
                --text-tertiary: #d0d0d0;
                --border-color: #404040;
                --accent-color: #4a9eff;
                --accent-hover: #357abd;
                --header-bg: #1e1e1e;
                --header-text: #ffffff;
                --sidebar-bg: #2d2d2d;
                --code-bg: #3a3a3a;
                --code-text: #ff6b9d;
                --pre-bg: #2d2d2d;
                --table-stripe: #2d2d2d;
                --blockquote-bg: #2d2d2d;
                --shadow: rgba(0, 0, 0, 0.3);
            }

            /* 莫兰迪色主题 */
            [data-theme="morandi"] {
                --bg-primary: oklch(0.99 0.0057 84.57);
                --bg-secondary: oklch(0.95 0.008 84.57);
                --bg-tertiary: oklch(0.9 0.012 84.57);
                --text-primary: oklch(0.25 0.02 84.57);
                --text-secondary: oklch(0.45 0.015 84.57);
                --text-tertiary: oklch(0.35 0.018 84.57);
                --border-color: oklch(0.85 0.01 84.57);
                --accent-color: oklch(0.55 0.08 84.57);
                --accent-hover: oklch(0.45 0.1 84.57);
                --header-bg: oklch(0.3 0.025 84.57);
                --header-text: oklch(0.95 0.005 84.57);
                --sidebar-bg: oklch(0.95 0.008 84.57);
                --code-bg: oklch(0.92 0.01 84.57);
                --code-text: oklch(0.45 0.06 320);
                --pre-bg: oklch(0.95 0.008 84.57);
                --table-stripe: oklch(0.95 0.008 84.57);
                --blockquote-bg: oklch(0.95 0.008 84.57);
                --shadow: oklch(0.2 0.01 84.57 / 0.1);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: var(--font-family);
                font-size: calc(var(--font-size-base) * var(--font-size-scale));
                height: 100vh;
                overflow: hidden;
                background-color: var(--bg-primary);
                color: var(--text-primary);
                transition: all 0.3s ease;
                /* 字体渲染优化 */
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
                text-rendering: optimizeLegibility;
                font-feature-settings: "kern" 1;
                font-variant-ligatures: common-ligatures;
            }

            .header {
                height: 60px;
                background: var(--header-bg);
                color: var(--header-text);
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 2rem;
                box-shadow: 0 2px 4px var(--shadow);
                z-index: 1000;
            }

            .header-left {
                display: flex;
                align-items: center;
            }

            .header-right {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .header h1 {
                font-size: calc(1.1rem * var(--font-size-scale));
                font-weight: 300;
                display: flex;
                align-items: center;
                margin: 0;
            }

            .header-subtitle {
                font-size: calc(0.9rem * var(--font-size-scale));
                color: var(--text-secondary);
                font-weight: 400;
            }

            .settings-btn {
                background: none;
                border: none;
                color: var(--header-text);
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .settings-btn:hover {
                background-color: rgba(255, 255, 255, 0.1);
                transform: rotate(90deg);
            }

            .settings-btn svg {
                width: 20px;
                height: 20px;
                stroke: currentColor;
            }

            /* 设置面板样式 */
            .settings-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 2000;
                display: none;
                align-items: center;
                justify-content: center;
            }

            .settings-panel {
                background: var(--bg-primary);
                border-radius: 12px;
                width: 90%;
                max-width: 500px;
                max-height: 80vh;
                box-shadow: 0 10px 30px var(--shadow);
                border: 1px solid var(--border-color);
                display: flex;
                flex-direction: column;
            }

            .settings-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 2rem 2rem 1rem 2rem;
                border-bottom: 1px solid var(--border-color);
                background: var(--bg-primary);
                border-radius: 12px 12px 0 0;
                position: sticky;
                top: 0;
                z-index: 10;
                flex-shrink: 0;
            }

            .settings-content {
                padding: 0 2rem 2rem 2rem;
                overflow-y: auto;
                flex: 1;
            }

            .settings-title {
                font-size: calc(1.5rem * var(--font-size-scale));
                font-weight: 600;
                color: var(--text-primary);
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .settings-title svg {
                width: 20px;
                height: 20px;
                stroke: var(--text-primary);
            }

            .settings-close {
                background: none;
                border: none;
                cursor: pointer;
                color: var(--text-secondary);
                padding: 0.5rem;
                border-radius: 6px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .settings-close:hover {
                background-color: var(--bg-tertiary);
                color: var(--text-primary);
                transform: scale(1.1);
            }

            .settings-close svg {
                width: 20px;
                height: 20px;
                stroke: currentColor;
            }

            .settings-section {
                margin-bottom: 2rem;
            }

            .settings-section-title {
                font-size: calc(1.1rem * var(--font-size-scale));
                font-weight: 600;
                color: var(--text-primary);
                margin-bottom: 1rem;
            }

            .settings-group {
                margin-bottom: 1.5rem;
            }

            .settings-label {
                display: block;
                font-size: calc(0.9rem * var(--font-size-scale));
                font-weight: 500;
                color: var(--text-tertiary);
                margin-bottom: 0.5rem;
            }

            .theme-options {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
                gap: 0.75rem;
            }

            .theme-option {
                padding: 0.75rem;
                border: 2px solid var(--border-color);
                border-radius: 8px;
                cursor: pointer;
                text-align: center;
                transition: all 0.2s ease;
                background: var(--bg-secondary);
                font-size: calc(0.85rem * var(--font-size-scale));
                color: var(--text-primary);
                position: relative;
                overflow: hidden;
            }

            .theme-option:hover {
                border-color: var(--accent-color);
                transform: translateY(-1px);
                box-shadow: 0 4px 8px var(--shadow);
            }

            .theme-option.active {
                border-color: var(--accent-color);
                background: var(--accent-color);
                color: white;
            }

            /* 主题预览样式 */
            .theme-preview {
                width: 100%;
                height: 60px;
                border-radius: 6px;
                margin-bottom: 0.5rem;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                border: 1px solid rgba(0, 0, 0, 0.1);
            }

            .theme-option[data-theme="light"] .theme-preview {
                background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
                color: #333333;
                border-color: #e9ecef;
            }

            .theme-option[data-theme="dark"] .theme-preview {
                background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
                color: #e0e0e0;
                border-color: #404040;
            }

            .theme-option[data-theme="morandi"] .theme-preview {
                background: linear-gradient(
                    135deg,
                    oklch(0.99 0.0057 84.57) 0%,
                    oklch(0.95 0.008 84.57) 100%
                );
                color: oklch(0.25 0.02 84.57);
                border-color: oklch(0.85 0.01 84.57);
            }

            .theme-name {
                font-weight: 500;
                color: var(--text-primary);
                transition: color 0.2s ease;
            }

            .theme-option.active .theme-name {
                color: white;
            }

            .font-select,
            .font-size-select {
                width: 100%;
                padding: 0.75rem;
                border: 1px solid var(--border-color);
                border-radius: 6px;
                background: var(--bg-secondary);
                color: var(--text-primary);
                font-size: calc(0.9rem * var(--font-size-scale));
                font-family: var(--font-family);
            }

            .font-size-controls {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .font-size-btn {
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                color: var(--text-primary);
                width: 36px;
                height: 36px;
                border-radius: 6px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: calc(1.1rem * var(--font-size-scale));
                transition: all 0.2s ease;
            }

            .font-size-btn:hover {
                background: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
            }

            .font-size-display {
                font-size: calc(0.9rem * var(--font-size-scale));
                color: var(--text-secondary);
                min-width: 60px;
                text-align: center;
            }

            .reset-btn {
                background: var(--bg-tertiary);
                border: 1px solid var(--border-color);
                color: var(--text-primary);
                padding: 0.75rem 1.5rem;
                border-radius: 6px;
                cursor: pointer;
                font-size: calc(0.9rem * var(--font-size-scale));
                transition: all 0.2s ease;
                width: 100%;
                margin-top: 1rem;
            }

            .reset-btn:hover {
                background: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
            }

            /* 字体预览样式 */
            .font-preview {
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                border-radius: 8px;
                margin-top: 0.5rem;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .font-preview-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0.75rem 1rem;
                background: var(--bg-tertiary);
                border-bottom: 1px solid var(--border-color);
                cursor: pointer;
                transition: all 0.2s ease;
            }

            .font-preview-header:hover {
                background: var(--accent-color);
                color: white;
            }

            .font-preview-title {
                font-size: calc(0.9rem * var(--font-size-scale));
                font-weight: 500;
                color: var(--text-primary);
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .font-preview-header:hover .font-preview-title {
                color: white;
            }

            .font-preview-toggle {
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.25rem;
                border-radius: 4px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .font-preview-header:hover .font-preview-toggle {
                color: white;
            }

            .font-preview-toggle svg {
                width: 16px;
                height: 16px;
                stroke: currentColor;
                transition: transform 0.3s ease;
            }

            .font-preview-toggle.collapsed svg {
                transform: rotate(-90deg);
            }

            .font-preview-content {
                padding: 1rem;
                transition: all 0.3s ease;
                max-height: 500px;
                overflow: hidden;
            }

            .font-preview-content.collapsed {
                max-height: 0;
                padding: 0 1rem;
            }

            .font-preview-text {
                font-family: var(--font-family);
                line-height: 1.6;
            }

            .font-preview-text p {
                margin: 0.5rem 0;
                font-size: calc(0.9rem * var(--font-size-scale));
                color: var(--text-primary);
            }

            .font-preview-text p:first-child {
                font-weight: 400;
            }

            .font-preview-text p:nth-child(2) {
                font-weight: 500;
                color: var(--accent-color);
            }

            .font-preview-text p:nth-child(3) {
                font-family: 'JetBrains Mono', 'SF Mono', 'Monaco', monospace;
                background: var(--code-bg);
                padding: 0.25rem 0.5rem;
                border-radius: 4px;
                font-size: calc(0.85rem * var(--font-size-scale));
            }

            .font-preview-text p:last-child {
                font-size: calc(0.8rem * var(--font-size-scale));
                color: var(--text-secondary);
            }

            .font-info {
                margin-top: 0.75rem;
                padding-top: 0.75rem;
                border-top: 1px solid var(--border-color);
            }

            .font-info small {
                color: var(--text-secondary);
                font-size: calc(0.75rem * var(--font-size-scale));
                font-family: 'JetBrains Mono', 'SF Mono', 'Monaco', monospace;
                word-break: break-all;
                line-height: 1.4;
            }

            .container {
                display: flex;
                height: calc(100vh - 60px);
            }

            .sidebar {
                width: 320px;
                height: 100vh;
                background: var(--sidebar-bg);
                border-right: 1px solid var(--border-color);
                display: flex;
                flex-direction: column;
                transition: width 0.3s ease;
                overflow: hidden;
            }

            .sidebar.collapsed {
                width: 0;
                padding: 0;
                overflow: hidden;
            }

            .sidebar-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
                padding: 1rem 1rem 0.5rem 1rem;
                border-bottom: 1px solid var(--border-color);
                flex-shrink: 0;
                height: 60px;
            }

            .sidebar-title {
                font-size: calc(1.1rem * var(--font-size-scale));
                font-weight: 600;
                color: var(--text-tertiary);
            }

            .toggle-btn {
                background: none;
                border: none;
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                color: var(--text-secondary);
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .toggle-btn:hover {
                background-color: var(--bg-tertiary);
                color: var(--text-primary);
                transform: scale(1.1);
            }

            .toggle-btn svg {
                width: 16px;
                height: 16px;
                stroke: currentColor;
            }

            .content {
                flex: 1;
                overflow-y: auto;
                padding: 0;
                background: var(--bg-primary);
                position: relative;
            }

            .content-header {
                display: flex;
                align-items: center;
                padding: 1rem 2rem;
                background: var(--bg-primary);
                border-bottom: 1px solid var(--border-color);
                position: sticky;
                top: 0;
                z-index: 100;
                backdrop-filter: blur(10px);
                box-shadow: 0 2px 4px var(--shadow);
            }

            #content-container {
                padding: 2rem;
            }

            .sidebar-toggle {
                background: none;
                border: none;
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                margin-right: 1rem;
                color: var(--text-secondary);
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .sidebar-toggle:hover {
                background-color: var(--bg-secondary);
                color: var(--text-primary);
                transform: scale(1.05);
            }

            .sidebar-toggle svg {
                width: 20px;
                height: 20px;
                stroke: currentColor;
            }

            .tree-node {
                margin: 0.25rem 0;
            }

            .tree-item {
                display: flex;
                align-items: center;
                padding: 0.5rem 0rem;
                cursor: pointer;
                border-radius: 6px;
                transition: all 0.2s ease;
                font-size: calc(0.9rem * var(--font-size-scale));
                color: var(--text-primary);
            }

            .tree-item:hover {
                background-color: var(--bg-tertiary);
            }

            .tree-item.active {
                background-color: var(--accent-color);
                color: white;
            }

            .tree-item.file {
                padding-left: 0rem;
            }

            .tree-icon {
                margin-right: 0.5rem;
                width: 16px;
                text-align: center;
                font-size: calc(0.9rem * var(--font-size-scale));
            }

            .tree-children {
                margin-left: 1rem;
                border-left: 2px solid var(--border-color);
                padding-left: 0.5rem;
            }

            .tree-children.collapsed {
                display: none;
            }

            .folder-icon::before {
                content: "📁";
            }

            .folder-icon.open::before {
                content: "📂";
            }

            .file-icon::before {
                content: "📄";
            }

            .loading {
                text-align: center;
                padding: 4rem 2rem;
                color: var(--text-secondary);
            }

            .loading-spinner {
                display: inline-block;
                width: 2rem;
                height: 2rem;
                border: 3px solid var(--bg-tertiary);
                border-top: 3px solid var(--accent-color);
                border-radius: 50%;
                animation: spin 1s linear infinite;
                margin-bottom: 1rem;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .error {
                color: #dc3545;
                padding: 1.5rem;
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                border-radius: 8px;
                margin: 1rem 0;
            }

            .error h3 {
                margin-bottom: 0.5rem;
            }

            /* Markdown样式 */
            .markdown-content {
                max-width: none;
                line-height: 1.7;
                color: var(--text-primary);
            }

            .markdown-content h1,
            .markdown-content h2,
            .markdown-content h3,
            .markdown-content h4,
            .markdown-content h5,
            .markdown-content h6 {
                margin: 2rem 0 1rem 0;
                color: var(--text-primary);
                font-weight: 600;
            }

            .markdown-content h1 {
                font-size: calc(2.25rem * var(--font-size-scale));
                border-bottom: 3px solid var(--accent-color);
                padding-bottom: 0.5rem;
            }

            .markdown-content h2 {
                font-size: calc(1.75rem * var(--font-size-scale));
                border-bottom: 2px solid var(--border-color);
                padding-bottom: 0.3rem;
            }

            .markdown-content h3 {
                font-size: calc(1.5rem * var(--font-size-scale));
            }

            .markdown-content h4 {
                font-size: calc(1.25rem * var(--font-size-scale));
            }

            .markdown-content p {
                margin: 1rem 0;
                text-align: justify;
                /* 中文排版优化 */
                line-height: 1.8;
                word-break: break-word;
                overflow-wrap: break-word;
                hyphens: auto;
            }

            .markdown-content ul,
            .markdown-content ol {
                margin: 1rem 0;
                padding-left: 2rem;
            }

            .markdown-content li {
                margin: 0.5rem 0;
            }

            .markdown-content code {
                background: var(--code-bg);
                padding: 0.2rem 0.4rem;
                border-radius: 4px;
                font-family:
                    "JetBrains Mono", "SF Mono", "Monaco", "Inconsolata", 
                    "Source Code Pro", "Menlo", "Consolas", "DejaVu Sans Mono", 
                    "Liberation Mono", "Courier New", monospace;
                font-size: calc(0.9em * var(--font-size-scale));
                color: var(--code-text);
                /* 代码字体优化 */
                font-variant-ligatures: common-ligatures;
                font-feature-settings: "calt" 1, "liga" 1;
            }

            .markdown-content pre {
                background: var(--pre-bg);
                padding: 1.5rem;
                border-radius: 8px;
                overflow-x: auto;
                margin: 1.5rem 0;
                border: 1px solid var(--border-color);
            }

            .markdown-content pre code {
                background: none;
                padding: 0;
                color: var(--text-primary);
            }

            .markdown-content table {
                border-collapse: collapse;
                width: 100%;
                margin: 1.5rem 0;
                box-shadow: 0 1px 3px var(--shadow);
                border-radius: 8px;
                overflow: hidden;
            }

            .markdown-content th,
            .markdown-content td {
                border: 1px solid var(--border-color);
                padding: 0.75rem 1rem;
                text-align: left;
            }

            .markdown-content th {
                background-color: var(--bg-secondary);
                font-weight: 600;
                color: var(--text-tertiary);
            }

            .markdown-content tr:nth-child(even) {
                background-color: var(--table-stripe);
            }

            .markdown-content blockquote {
                border-left: 4px solid var(--accent-color);
                padding: 1rem 1.5rem;
                color: var(--text-secondary);
                margin: 1.5rem 0;
                background: var(--blockquote-bg);
                border-radius: 0 8px 8px 0;
            }

            .markdown-content blockquote p {
                margin: 0.5rem 0;
            }

            /* Mermaid图表样式 */
            .mermaid {
                text-align: center;
                margin: 2rem 0;
                background: var(--bg-primary);
                border-radius: 8px;
                padding: 1rem;
                box-shadow: 0 2px 8px var(--shadow);
            }

            /* 搜索框样式 */
            .search-input-container {
                position: relative;
                padding: 0 1rem;
                flex-shrink: 0;
            }

            .search-input {
                width: 100%;
                padding: 0.5rem 2.5rem 0.5rem 0.75rem;
                border: 1px solid var(--border-color);
                border-radius: 6px;
                font-size: calc(0.9rem * var(--font-size-scale));
                background: var(--bg-secondary);
                color: var(--text-primary);
                transition: all 0.2s ease;
            }

            .search-input:focus {
                outline: none;
                border-color: var(--accent-color);
                box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
            }

            .search-clear-btn {
                position: absolute;
                right: 1.5rem;
                top: 50%;
                transform: translateY(-50%);
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.25rem;
                border-radius: 3px;
                display: none;
                transition: all 0.2s ease;
            }

            .search-clear-btn:hover {
                color: var(--text-primary);
                background: var(--bg-tertiary);
            }

            .search-clear-btn.show {
                display: block;
            }

            /* 搜索模式切换 */
            .search-mode-toggle {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                border-bottom: 1px solid var(--border-color);
                background: var(--bg-secondary);
            }

            .search-mode-btn {
                padding: 0.25rem 0.5rem;
                border: 1px solid var(--border-color);
                background: var(--bg-primary);
                color: var(--text-secondary);
                border-radius: 4px;
                font-size: calc(0.8rem * var(--font-size-scale));
                cursor: pointer;
                transition: all 0.2s ease;
            }

            .search-mode-btn.active {
                background: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
            }

            .search-mode-btn:hover:not(.active) {
                background: var(--bg-tertiary);
                color: var(--text-primary);
            }

            /* 搜索结果样式 */
            .search-results {
                padding: 0;
            }

            .search-result-item {
                margin-bottom: 1rem;
                border: 1px solid var(--border-color);
                border-radius: 8px;
                background: var(--bg-secondary);
                transition: all 0.2s ease;
                cursor: pointer;
            }

            .search-result-item:hover {
                border-color: var(--accent-color);
                box-shadow: 0 2px 8px var(--shadow);
                transform: translateY(-1px);
            }

            .search-result-header {
                padding: 0.75rem 1rem;
                border-bottom: 1px solid var(--border-color);
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .search-result-title {
                font-weight: 600;
                color: var(--text-primary);
                font-size: calc(0.9rem * var(--font-size-scale));
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .search-result-title .file-icon::before {
                content: "📄";
                font-size: calc(0.8rem * var(--font-size-scale));
            }

            .search-result-score {
                background: var(--accent-color);
                color: white;
                padding: 0.2rem 0.5rem;
                border-radius: 12px;
                font-size: calc(0.75rem * var(--font-size-scale));
                font-weight: 500;
            }

            .search-result-matches {
                padding: 0;
            }

            .search-match {
                padding: 0.75rem 1rem;
                border-bottom: 1px solid var(--border-color);
                position: relative;
            }

            .search-match:last-child {
                border-bottom: none;
            }

            .search-match-line {
                font-size: calc(0.85rem * var(--font-size-scale));
                color: var(--text-secondary);
                margin-bottom: 0.25rem;
            }

            .search-match-content {
                font-family: 'SF Mono', 'Monaco', 'Inconsolata', monospace;
                font-size: calc(0.85rem * var(--font-size-scale));
                line-height: 1.5;
                color: var(--text-primary);
                background: var(--bg-primary);
                padding: 0.5rem;
                border-radius: 4px;
                border: 1px solid var(--border-color);
                margin-bottom: 0.5rem;
                word-wrap: break-word;
                overflow-wrap: break-word;
            }

            .search-match-content mark {
                background: var(--accent-color);
                color: white;
                padding: 0.1rem 0.2rem;
                border-radius: 2px;
                font-weight: 600;
            }

            .search-match-context {
                font-size: calc(0.8rem * var(--font-size-scale));
                color: var(--text-secondary);
                font-style: italic;
                margin-top: 0.25rem;
                padding-left: 1rem;
                border-left: 2px solid var(--border-color);
            }

            .search-stats {
                padding: 0.75rem 1rem;
                margin: 0 0 1rem 0;
                background: var(--bg-secondary);
                border-bottom: 1px solid var(--border-color);
                border-radius: 6px;
                font-size: calc(0.85rem * var(--font-size-scale));
                color: var(--text-secondary);
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .search-loading {
                text-align: center;
                padding: 2rem 1rem;
                color: var(--text-secondary);
            }

            .search-loading-spinner {
                display: inline-block;
                width: 1.5rem;
                height: 1.5rem;
                border: 2px solid var(--bg-tertiary);
                border-top: 2px solid var(--accent-color);
                border-radius: 50%;
                animation: spin 1s linear infinite;
                margin-bottom: 0.5rem;
            }

            .search-empty {
                text-align: center;
                padding: 3rem 1rem;
                color: var(--text-secondary);
            }

            .search-empty-icon {
                font-size: 2rem;
                margin-bottom: 1rem;
                opacity: 0.5;
            }

            /* 目录容器样式 */
            .tree-container {
                height: calc(100vh - 120px);
                overflow-y: auto;
                overflow-x: hidden;
                padding: 0 1rem 1rem 1rem;
            }

            /* 响应式设计 */
            @media (max-width: 768px) {
                .sidebar {
                    position: fixed;
                    left: 0;
                    top: 60px;
                    height: calc(100vh - 60px);
                    z-index: 999;
                    transform: translateX(-100%);
                    transition: transform 0.3s ease;
                }

                .sidebar.show {
                    transform: translateX(0);
                }

                .sidebar-header {
                    padding: 1rem;
                }

                .search-box {
                    padding: 0 1rem;
                }

                .tree-container {
                    padding: 0 1rem 1rem 1rem;
                }

                .content-header {
                    padding: 1rem;
                }

                #content-container {
                    padding: 1rem;
                }

                .markdown-content h1 {
                    font-size: calc(1.75rem * var(--font-size-scale));
                }

                .markdown-content h2 {
                    font-size: calc(1.5rem * var(--font-size-scale));
                }

                .settings-panel {
                    width: 95%;
                    margin: 1rem;
                    padding: 1.5rem;
                }

                .theme-options {
                    grid-template-columns: 1fr;
                }
            }

            /* 文档目录样式 */
            .doc-toc {
                position: fixed;
                right: 2rem;
                top: 50%;
                transform: translateY(-50%);
                background: var(--bg-primary);
                border: 1px solid var(--border-color);
                border-radius: 12px;
                box-shadow: 0 8px 24px var(--shadow);
                max-width: 280px;
                max-height: 70vh;
                overflow: hidden;
                z-index: 1500;
                transition: all 0.3s ease;
                backdrop-filter: blur(10px);
            }

            .doc-toc.collapsed {
                transform: translateY(-50%) translateX(calc(100% - 40px));
            }

            .doc-toc-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0.2rem;
                border-bottom: 1px solid var(--border-color);
                background: var(--bg-secondary);
                border-radius: 12px 12px 0 0;
            }

            .doc-toc-title {
                font-size: calc(0.9rem * var(--font-size-scale));
                font-weight: 600;
                color: var(--text-primary);
                margin-left: 0.5em;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .doc-toc-title svg {
                width: 16px;
                height: 16px;
                stroke: var(--text-primary);
            }

            .doc-toc-toggle {
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                transition: all 0.2s ease;
                min-width: 32px;
                min-height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .doc-toc-toggle:hover {
                background: var(--bg-tertiary);
                color: var(--text-primary);
                transform: scale(1.05);
            }

            .doc-toc-toggle svg {
                width: 18px;
                height: 18px;
                stroke: currentColor;
                transition: all 0.2s ease;
            }

            .doc-toc-content {
                padding: 0.5rem 0;
                max-height: calc(70vh - 60px);
                overflow-y: auto;
                overflow-x: hidden;
            }

            .doc-toc.collapsed .doc-toc-content {
                display: none;
            }

            .toc-item {
                display: block;
                padding: 0.4rem 1rem;
                color: var(--text-secondary);
                text-decoration: none;
                font-size: calc(0.85rem * var(--font-size-scale));
                line-height: 1.4;
                border-left: 3px solid transparent;
                transition: all 0.2s ease;
                cursor: pointer;
                word-wrap: break-word;
                overflow-wrap: break-word;
            }

            .toc-item:hover {
                background: var(--bg-secondary);
                color: var(--text-primary);
                border-left-color: var(--accent-color);
            }

            .toc-item.active {
                background: var(--bg-secondary);
                color: var(--accent-color);
                border-left-color: var(--accent-color);
                font-weight: 500;
            }

            .toc-item.level-1 {
                padding-left: 1rem;
                font-weight: 600;
                font-size: calc(0.9rem * var(--font-size-scale));
            }

            .toc-item.level-2 {
                padding-left: 1.5rem;
            }

            .toc-item.level-3 {
                padding-left: 2rem;
                font-size: calc(0.8rem * var(--font-size-scale));
            }

            .toc-item.level-4 {
                padding-left: 2.5rem;
                font-size: calc(0.8rem * var(--font-size-scale));
            }

            .toc-item.level-5 {
                padding-left: 3rem;
                font-size: calc(0.75rem * var(--font-size-scale));
            }

            .toc-item.level-6 {
                padding-left: 3.5rem;
                font-size: calc(0.75rem * var(--font-size-scale));
            }

            /* 当目录折叠时的样式 */
            .doc-toc.collapsed .doc-toc-header {
                border-radius: 12px;
                border-bottom: none;
            }

            .doc-toc.collapsed .doc-toc-title {
                display: none;
            }

            /* 响应式设计 - 移动端隐藏目录 */
            @media (max-width: 1024px) {
                .doc-toc {
                    display: none;
                }
            }

            /* AI助手样式 */
            .ai-assistant-trigger {
                position: fixed;
                bottom: 2rem;
                right: 2rem;
                width: 60px;
                height: 60px;
                background: var(--accent-color);
                color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                box-shadow: 0 4px 16px rgba(0, 123, 255, 0.3);
                transition: all 0.3s ease;
                z-index: 1000;
            }

            .ai-assistant-trigger:hover {
                background: var(--accent-hover);
                transform: scale(1.1);
                box-shadow: 0 6px 20px rgba(0, 123, 255, 0.4);
            }

            .ai-assistant-trigger.hidden {
                display: none;
            }

            .ai-assistant-panel {
                position: fixed;
                bottom: 2rem;
                right: 2rem;
                width: 700px;
                height: 90%;
                background: var(--bg-primary);
                border: 1px solid var(--border-color);
                border-radius: 16px;
                box-shadow: 0 8px 32px var(--shadow);
                display: none;
                flex-direction: column;
                z-index: 1001;
                overflow: hidden;
                backdrop-filter: blur(10px);
            }

            .ai-assistant-panel.show {
                display: flex;
                animation: slideInUp 0.3s ease-out;
            }

            @keyframes slideInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .ai-assistant-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 1rem 1.5rem;
                background: var(--bg-secondary);
                border-bottom: 1px solid var(--border-color);
                border-radius: 16px 16px 0 0;
            }

            .ai-assistant-title {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                font-weight: 600;
                color: var(--text-primary);
                font-size: 1.1rem;
            }

            .ai-assistant-title svg {
                stroke: var(--accent-color);
            }

            .ai-assistant-controls {
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .ai-assistant-clear,
            .ai-assistant-close {
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.5rem;
                border-radius: 6px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .ai-assistant-clear:hover,
            .ai-assistant-close:hover {
                background: var(--bg-tertiary);
                color: var(--text-primary);
            }

            .ai-assistant-clear:hover {
                color: #dc3545; /* 红色，表示删除操作 */
            }

            .ai-assistant-content {
                flex: 1;
                display: flex;
                flex-direction: column;
                overflow: hidden;
            }

            .ai-chat-messages {
                flex: 1;
                padding: 1rem;
                overflow-y: auto;
                display: flex;
                flex-direction: column;
                gap: 1rem;
            }

            .ai-message {
                display: flex;
                flex-direction: column;
                max-width: 85%;
            }

            .ai-message-user {
                align-self: flex-end;
            }

            .ai-message-assistant {
                align-self: flex-start;
            }

            .ai-message-content {
                padding: 0.75rem 1rem;
                border-radius: 12px;
                font-size: 0.9rem;
                line-height: 1.5;
                word-wrap: break-word;
            }

            .ai-message-user .ai-message-content {
                background: var(--accent-color);
                color: white;
                border-bottom-right-radius: 4px;
            }

            .ai-message-assistant .ai-message-content {
                background: var(--bg-secondary);
                color: var(--text-primary);
                border: 1px solid var(--border-color);
                border-bottom-left-radius: 4px;
            }

            .ai-message-loading {
                align-self: flex-start;
            }

            .ai-message-loading .ai-message-content {
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: var(--text-secondary);
            }

            .ai-typing-indicator {
                display: flex;
                gap: 0.25rem;
            }

            .ai-typing-dot {
                width: 6px;
                height: 6px;
                background: var(--text-secondary);
                border-radius: 50%;
                animation: typingDot 1.4s infinite ease-in-out;
            }

            .ai-typing-dot:nth-child(1) { animation-delay: -0.32s; }
            .ai-typing-dot:nth-child(2) { animation-delay: -0.16s; }

            @keyframes typingDot {
                0%, 80%, 100% {
                    transform: scale(0.8);
                    opacity: 0.5;
                }
                40% {
                    transform: scale(1);
                    opacity: 1;
                }
            }

            .ai-suggestions {
                border-top: 1px solid var(--border-color);
                background: var(--bg-secondary);
                transition: all 0.3s ease;
            }

            .ai-suggestions.collapsed {
                border-top: none;
            }

            .ai-suggestions-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 1rem;
                cursor: pointer;
                transition: all 0.2s ease;
                border-top: 1px solid var(--border-color);
            }

            .ai-suggestions.collapsed .ai-suggestions-header {
                padding: 0.5rem 1rem;
                border-top: none;
                background: var(--bg-primary);
            }

            .ai-suggestions-header:hover {
                background: var(--bg-tertiary);
            }

            .ai-suggestions.collapsed .ai-suggestions-header:hover {
                background: var(--bg-secondary);
            }

            .ai-suggestions-title {
                font-size: 0.85rem;
                font-weight: 600;
                color: var(--text-secondary);
                margin: 0;
            }

            .ai-suggestions-toggle {
                background: none;
                border: none;
                color: var(--text-secondary);
                cursor: pointer;
                padding: 0.25rem;
                border-radius: 4px;
                transition: all 0.2s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                transform: rotate(0deg);
            }

            .ai-suggestions.collapsed .ai-suggestions-toggle {
                transform: rotate(-90deg);
            }

            .ai-suggestions-toggle:hover {
                background: var(--bg-tertiary);
                color: var(--text-primary);
            }

            .ai-suggestions-list {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
                padding: 0 1rem 1rem 1rem;
                max-height: 300px;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .ai-suggestions.collapsed .ai-suggestions-list {
                max-height: 0;
                padding: 0 1rem;
                opacity: 0;
            }

            .ai-suggestion-item {
                background: var(--bg-primary);
                border: 1px solid var(--border-color);
                border-radius: 8px;
                padding: 0.5rem 0.75rem;
                font-size: 0.85rem;
                color: var(--text-primary);
                cursor: pointer;
                transition: all 0.2s ease;
                text-align: left;
                line-height: 1.4;
            }

            .ai-suggestion-item:hover {
                background: var(--accent-color);
                color: white;
                border-color: var(--accent-color);
                transform: translateY(-1px);
            }

            .ai-assistant-input {
                padding: 1rem;
                border-top: 1px solid var(--border-color);
                background: var(--bg-primary);
                border-radius: 0 0 16px 16px;
            }

            .ai-input-container {
                display: flex;
                flex-direction: column;
                gap: 0.75rem;
                background: var(--bg-secondary);
                border: 1px solid var(--border-color);
                border-radius: 12px;
                padding: 0.75rem;
                transition: border-color 0.2s ease;
            }

            .ai-input-container:focus-within {
                border-color: var(--accent-color);
                box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.1);
            }

            #contextTagsContainer {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
                width: 100%;
            }

            .ai-input {
                flex: 1;
                background: none;
                border: none;
                outline: none;
                color: var(--text-primary);
                font-size: 0.9rem;
                line-height: 1.4;
                resize: none;
                min-height: 20px;
                max-height: 100px;
                font-family: var(--font-family);
                width: 100%;
            }

            .ai-input::placeholder {
                color: var(--text-secondary);
            }

            .ai-send-btn {
                background: var(--accent-color);
                border: none;
                border-radius: 8px;
                width: 36px;
                height: 36px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.2s ease;
                flex-shrink: 0;
                align-self: flex-end;
                margin-top: 0.5rem;
            }

            .ai-send-btn:hover:not(:disabled) {
                background: var(--accent-hover);
                transform: scale(1.05);
            }

            .ai-send-btn:disabled {
                background: var(--bg-tertiary);
                cursor: not-allowed;
                opacity: 0.5;
            }

            .ai-send-btn svg {
                stroke: white;
            }

            .ai-send-btn:disabled svg {
                stroke: var(--text-secondary);
            }

            /* 流式输出光标动画 */
            .ai-cursor {
                display: inline-block;
                background: var(--accent-color);
                width: 2px;
                height: 1.2em;
                margin-left: 2px;
                animation: blink 1s infinite;
            }

            @keyframes blink {
                0%, 50% { opacity: 1; }
                51%, 100% { opacity: 0; }
            }

            /* 响应式设计 */
            @media (max-width: 768px) {
                .ai-assistant-trigger {
                    bottom: 1rem;
                    right: 1rem;
                    width: 50px;
                    height: 50px;
                }

                .ai-assistant-panel {
                    bottom: 0;
                    right: 0;
                    left: 0;
                    width: 100%;
                    height: 70vh;
                    border-radius: 16px 16px 0 0;
                    max-height: 600px;
                }

                .ai-assistant-panel.show {
                    animation: slideInUpMobile 0.3s ease-out;
                }

                @keyframes slideInUpMobile {
                    from {
                        transform: translateY(100%);
                    }
                    to {
                        transform: translateY(0);
                    }
                }
            }

            /* 滚动条样式 */
            ::-webkit-scrollbar {
                width: 8px;
            }

            ::-webkit-scrollbar-track {
                background: var(--bg-secondary);
            }

            ::-webkit-scrollbar-thumb {
                background: var(--text-secondary);
                border-radius: 4px;
            }

            ::-webkit-scrollbar-thumb:hover {
                background: var(--text-tertiary);
            }

            /* 目录滚动条样式 */
            .doc-toc-content::-webkit-scrollbar {
                width: 4px;
            }

            .doc-toc-content::-webkit-scrollbar-track {
                background: transparent;
            }

            .doc-toc-content::-webkit-scrollbar-thumb {
                background: var(--border-color);
                border-radius: 2px;
            }

            /* AI聊天消息滚动条样式 */
            .ai-chat-messages::-webkit-scrollbar {
                width: 4px;
            }

            .ai-chat-messages::-webkit-scrollbar-track {
                background: transparent;
            }

            .ai-chat-messages::-webkit-scrollbar-thumb {
                background: var(--border-color);
                border-radius: 2px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="header-left">
                <h1><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAAEDCAMAAADtOCr6AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAKpUExURSdedzpqgTiFkUCLmUFzi3Szy4DL3Zrs/Yb5/oTt+pHe8VaRnpv3/3L4+mP5+F7x717p8Vnj7Fzb6GjQ31r5+FL080ny8lPu807t7Enr9Efm81Hi8m7m66n9/071+lXo+Evs9mTp9arv+3jr+2Pu/Fbz+U3w9kzr/kro+Unk+Uzl90rg9YPL6Ej09kvv8kfg+lzj9WPg8MT9/1Tf+Eno9kbj9oK52U3c90zb7UPf80Xf92OnvErY91nV74Db+W7e7GTQ9miYsEbd+krZ+zY5kUVGpE1PuldZ0IJRzpQyorAprXIjbTanqVBa6V9f36tCyso30uAx3/8x//Iv7lHV+l9i7llj+WNm/GVm/yklzScr9Cgno1okjSkq5DEz/gYhykjU+iQiuSMjjCkxaQIIsouLt66wrWNiiVLP/enp6dna2aWrpOXl5QUG5ePj49TU1H5+gYyOjMfIyN7f3kjS/sLCws7Ozpyenrm4ub69vrWys29raREnUQALN6OjvHNzw5QfIbImJ6AvLw2LicssLt4tK+0yMv80M8pVVp8MDPUgHAa2svsCA9cFBI0ND+QCA5lwcATCwEnN/sYFBAHOzV4hJLIFCHoUFNc8Pu8BAoY5Po9aW1XI9jyY3VS2+HS89AmloTKq6126+0qy+EZTYU3F/ku+/12t/D8ySLC6tESs/0Oo/kjJ/ESw/0Cz/zWn9nlZFnpUU0txS6i2HOrqGs7RHhZAWczMc/7+BHOvHwmzDA2iEDyt/wLCBALPAjZwtMhwcUSrLg+VEA5eDweICUOk/EKj/jiB0QSSBSqzIj+U8cCTlAt/DI6qjXKqcyJNZBwbFw1qDz2n/kCf/khcEggxDxdOHAl1Cz+Y/QKbAkGb/5WbGmmNaVSuVUid+mKm+GCHyGmb1gAAAM2EBTcAAADjdFJOU/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AzF4BsAAAAAlwSFlzAAAOwwAADsMBx2+oZAAAABh0RVh0U29mdHdhcmUAUGFpbnQuTkVUIDUuMS45bG7aPgAAALZlWElmSUkqAAgAAAAFABoBBQABAAAASgAAABsBBQABAAAAUgAAACgBAwABAAAAAgAAADEBAgAQAAAAWgAAAGmHBAABAAAAagAAAAAAAABgAAAAAQAAAGAAAAABAAAAUGFpbnQuTkVUIDUuMS45AAMAAJAHAAQAAAAwMjMwAaADAAEAAAABAAAABaAEAAEAAACUAAAAAAAAAAIAAQACAAQAAABSOTgAAgAHAAQAAAAwMTAwAAAAAEzPwEglj9egAAAsdElEQVR4Xu2di19U17n3MVUBRQUVuYwyg1yEGREIEC4BIYCS0zY0bUEiFARPJM5mO6N7Zw+zsW+CxhsEmAQUHWPT9Fg8jRBzP6c1QmxAQiNJi6RBTZNz3vlL3s/zrLUvs5lBBsa8GHhmuLjDAL/v+q1nPeuySYBrkUeA9sJiiyUA2guLLZYAaC8stlgCoL2w2GIJgPbCYoslANoLiy2WAGgvLLZYAqC9sNhiCYD2wmKLJQDaC4stlgBoLyy2WAKgvbDYYgmA9sJiiyUA2guLLZYAaC8stlgCoL2w2GIJgPbCYoslANoLiy2WAGgvLLZYAqC9sNjCzwAClj322GM/mR6P+RzLli0LgND+BH+H/37A8hUrA4P8FcFyrFq5TPuT/Bp+ArB6ZUhQ0Jo1a9eukyNU+fQBof3KUBJhYevXr1+/YcMqP/2OnsMf33z5ypCQoDVr167duHHjxvBNm8Ix1oWvi1gXGb4uMjwyPHLmCFP/IyoqKlqn0+nofwpbs3ml9gf6M+YP4LFVW1D9OlAdE0PUR2Csi1gH78MjycXw8PDICLXWSPgiXYQ+Qq+LiIyKjIo0GPQGg0Gv1+sBgU6nC9NFhsYGa3+kP2O+AJZvDQmKi1+7MTwhITwhBiIxISYhIYEQgAAY4fAkj4iIiEh4UPkRESBXryfKDXr9Nv22bUnJeqPRZDQigwUNIGD7lqDY0LUbw1NiYlJQfkxMzLaYxJjExMRE2ug7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" alt="Litho Book" style="width: 32px; height: 32px; margin-right: 8px;"> Litho Book</h1>
            </div>
            <div class="header-right">
                <div class="header-subtitle" id="docs-path"></div>
                <button
                    class="settings-btn"
                    onclick="openSettings()"
                    title="{{ i18n.settings_title }}"
                >
                    <svg
                        width="20"
                        height="20"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                    >
                        <circle cx="12" cy="12" r="3"></circle>
                        <path
                            d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1 1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"
                        ></path>
                    </svg>
                </button>
            </div>
        </div>

        <!-- 设置面板 -->
        <div class="settings-overlay" id="settingsOverlay">
            <div class="settings-panel">
                <div class="settings-header">
                    <div class="settings-title">
                        <svg
                            width="20"
                            height="20"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        >
                            <circle cx="12" cy="12" r="3"></circle>
                            <path
                                d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1 1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"
                            ></path>
                        </svg>
                        {{ i18n.settings_title }}
                    </div>
                    <button class="settings-close" onclick="closeSettings()">
                        <svg
                            width="20"
                            height="20"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        >
                            <path d="M18 6L6 18M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>

                <div class="settings-content">
                    <div class="settings-section">
                    <div class="settings-section-title">🎨 主题</div>
                    <div class="settings-group">
                        <div class="theme-options">
                            <div class="theme-option active" data-theme="light">
                                <div class="theme-preview">🌕</div>
                                <div class="theme-name">白月光</div>
                            </div>
                            <div class="theme-option" data-theme="dark">
                                <div class="theme-preview">🌑</div>
                                <div class="theme-name">暮光影</div>
                            </div>
                            <div class="theme-option" data-theme="morandi">
                                <div class="theme-preview">🎨</div>
                                <div class="theme-name">莫兰迪</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="settings-section">
                    <div class="settings-section-title">🔤 字体</div>
                    <div class="settings-group">
                        <label class="settings-label">字体族</label>
                        <select class="font-select" id="fontSelect">
                            <option value="geist">
                                Geist（现代无衬线字体，简洁清晰）
                            </option>
                            <option value="inter">
                                Inter（紧凑型无衬线字体，轻盈前卫）
                            </option>
                            <option value="noto-sans-sc">
                                思源现代（现代中文黑体，清晰易读）
                            </option>
                            <option value="noto-serif-sc">
                                思源传统（传统中文宋体，传承经典）
                            </option>
                            <option value="pingfang">
                                苹方（macOS 现代字体）
                            </option>
                        </select>
                    </div>
                    <div class="settings-group">
                        <div class="font-preview" id="fontPreview">
                            <div class="font-preview-header" onclick="toggleFontPreview()">
                                <div class="font-preview-title">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M4 7h16M10 11h4M8 15h8M4 3h16a1 1 0 0 1 1 1v16a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z"></path>
                                    </svg>
                                    字体预览
                                </div>
                                <button class="font-preview-toggle collapsed" id="fontPreviewToggle">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M6 9l6 6 6-6"></path>
                                    </svg>
                                </button>
                            </div>
                            <div class="font-preview-content collapsed" id="fontPreviewContent">
                                <div class="font-preview-text">
                                    <p>The quick brown fox jumps over the lazy dog.</p>
                                    <p>中文字体预览：这是一段中文文本，用于测试字体显示效果。</p>
                                    <p>数字测试：0123456789</p>
                                    <p>标点符号：，。！？；：""''（）【】</p>
                                </div>
                                <div class="font-info" id="fontInfo">
                                    <small>当前字体栈：Geist, Noto Sans SC, PingFang SC...</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="settings-section">
                    <div class="settings-section-title">📏 字号</div>
                    <div class="settings-group">
                        <label class="settings-label">字体大小</label>
                        <div class="font-size-controls">
                            <button
                                class="font-size-btn"
                                onclick="adjustFontSize(-0.05)"
                            >
                                −
                            </button>
                            <div class="font-size-display" id="fontSizeDisplay">
                                100%
                            </div>
                            <button
                                class="font-size-btn"
                                onclick="adjustFontSize(0.05)"
                            >
                                +
                            </button>
                        </div>
                    </div>
                </div>

                <button class="reset-btn" onclick="resetSettings()">
                    🔄 恢复默认设置
                </button>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <div class="sidebar-title">{{ i18n.sidebar_title }}</div>
                    <button class="toggle-btn" onclick="toggleSidebar()">
                        <svg
                            width="16"
                            height="16"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        >
                            <path d="M18 6L6 18M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>
                <div class="search-input-container">
                    <input
                        type="text"
                        class="search-input"
                        placeholder="搜索文档内容..."
                        id="searchInput"
                        onkeyup="handleSearchInput()"
                    />
                    <button class="search-clear-btn" id="searchClearBtn" onclick="clearSearch()">
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M18 6L6 18M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>

                <div class="search-mode-toggle" id="searchModeToggle" style="display: none;">
                    <button class="search-mode-btn active" data-mode="content" onclick="setSearchMode('content')">
                        内容搜索
                    </button>
                    <button class="search-mode-btn" data-mode="filename" onclick="setSearchMode('filename')">
                        文件名
                    </button>
                </div>
                <div id="tree-container" class="tree-container"></div>
            </div>

            <div class="content">
                <div class="content-header">
                    <button class="sidebar-toggle" onclick="toggleSidebar()">
                        <svg
                            width="20"
                            height="20"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        >
                            <path d="M3 6h18M3 12h18M3 18h18"></path>
                        </svg>
                    </button>
                    <div id="breadcrumb"></div>
                </div>
                <div id="content-container">
                    <div class="loading">
                        <p>📖 选择左侧文档开始阅读</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 文档目录 -->
        <div class="doc-toc collapsed" id="docToc">
            <div class="doc-toc-header">
                <h3 class="doc-toc-title">
                    <svg
                        width="16"
                        height="16"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                    >
                        <line x1="8" y1="6" x2="21" y2="6"></line>
                        <line x1="8" y1="12" x2="21" y2="12"></line>
                        <line x1="8" y1="18" x2="21" y2="18"></line>
                        <line x1="3" y1="6" x2="3.01" y2="6"></line>
                        <line x1="3" y1="12" x2="3.01" y2="12"></line>
                        <line x1="3" y1="18" x2="3.01" y2="18"></line>
                    </svg>
                    目录
                </h3>
                <button
                    class="doc-toc-toggle"
                    onclick="toggleToc()"
                    id="tocToggleBtn"
                >
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="8" y1="6" x2="21" y2="6"></line>
                        <line x1="8" y1="12" x2="21" y2="12"></line>
                        <line x1="8" y1="18" x2="21" y2="18"></line>
                        <line x1="3" y1="6" x2="3.01" y2="6"></line>
                        <line x1="3" y1="12" x2="3.01" y2="12"></line>
                        <line x1="3" y1="18" x2="3.01" y2="18"></line>
                    </svg>
                </button>
            </div>
            <div class="doc-toc-content" id="tocContent">
                <!-- 目录项将通过JavaScript动态生成 -->
            </div>
        </div>

        <!-- AI助手按钮 -->
        <div class="ai-assistant-trigger" id="aiAssistantTrigger" onclick="toggleAiAssistant()">
            <svg fill="#ffffff" viewBox="-6 -6 36 36" role="img" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><title>OpenAI icon</title><path d="M22.2819 9.8211a5.9847 5.9847 0 0 0-.5157-4.9108 6.0462 6.0462 0 0 0-6.5098-2.9A6.0651 6.0651 0 0 0 4.9807 4.1818a5.9847 5.9847 0 0 0-3.9977 2.9 6.0462 6.0462 0 0 0 .7427 7.0966 5.98 5.98 0 0 0 .511 4.9107 6.051 6.051 0 0 0 6.5146 2.9001A5.9847 5.9847 0 0 0 13.2599 24a6.0557 6.0557 0 0 0 5.7718-4.2058 5.9894 5.9894 0 0 0 3.9977-2.9001 6.0557 6.0557 0 0 0-.7475-7.0729zm-9.022 12.6081a4.4755 4.4755 0 0 1-2.8764-1.0408l.1419-.0804 4.7783-2.7582a.7948.7948 0 0 0 .3927-.6813v-6.7369l2.02 1.1686a.071.071 0 0 1 .038.052v5.5826a4.504 4.504 0 0 1-4.4945 4.4944zm-9.6607-4.1254a4.4708 4.4708 0 0 1-.5346-3.0137l.142.0852 4.783 2.7582a.7712.7712 0 0 0 .7806 0l5.8428-3.3685v2.3324a.0804.0804 0 0 1-.0332.0615L9.74 19.9502a4.4992 4.4992 0 0 1-6.1408-1.6464zM2.3408 7.8956a4.485 4.485 0 0 1 2.3655-1.9728V11.6a.7664.7664 0 0 0 .3879.6765l5.8144 3.3543-2.0201 1.1685a.0757.0757 0 0 1-.071 0l-4.8303-2.7865A4.504 4.504 0 0 1 2.3408 7.872zm16.5963 3.8558L13.1038 8.364 15.1192 7.2a.0757.0757 0 0 1 .071 0l4.8303 2.7913a4.4944 4.4944 0 0 1-.6765 8.1042v-5.6772a.79.79 0 0 0-.407-.667zm2.0107-3.0231l-.142-.0852-4.7735-2.7818a.7759.7759 0 0 0-.7854 0L9.409 9.2297V6.8974a.0662.0662 0 0 1 .0284-.0615l4.8303-2.7866a4.4992 4.4992 0 0 1 6.6802 4.66zM8.3065 12.863l-2.02-1.1638a.0804.0804 0 0 1-.038-.0567V6.0742a4.4992 4.4992 0 0 1 7.3757-3.4537l-.142.0805L8.704 5.459a.7948.7948 0 0 0-.3927.6813zm1.0976-2.3654l2.602-1.4998 2.6069 1.4998v2.9994l-2.5974 1.4997-2.6067-1.4997Z"></path></g></svg>
        </div>

        <!-- AI助手面板 -->
        <div class="ai-assistant-panel" id="aiAssistantPanel">
            <div class="ai-assistant-header">
                <div class="ai-assistant-title">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 2a3 3 0 0 0-3 3v7a3 3 0 0 0 6 0V5a3 3 0 0 0-3-3Z"></path>
                        <path d="M19 10v2a7 7 0 0 1-14 0v-2"></path>
                        <line x1="12" y1="19" x2="12" y2="22"></line>
                        <line x1="8" y1="22" x2="16" y2="22"></line>
                    </svg>
                    Litho Advisor
                </div>
                <div class="ai-assistant-controls">
                    <button class="ai-assistant-clear" onclick="clearChatHistory()" title="清空聊天记录">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 6h18"></path>
                            <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
                            <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
                        </svg>
                    </button>
                    <button class="ai-assistant-close" onclick="toggleAiAssistant()">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6L6 18M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>
            </div>
            
            <div class="ai-assistant-content">
                <div class="ai-chat-messages" id="aiChatMessages">
                    <div class="ai-message ai-message-assistant">
                        <div class="ai-message-content">
                            <p>👋 你好！我是<strong>Litho Advisor</strong>，你的文档助手，可以帮你理解和分析文档内容。有什么问题尽管问我！</p>
                        </div>
                    </div>
                </div>
                
                <div class="ai-suggestions" id="aiSuggestions">
                    <div class="ai-suggestions-header" onclick="toggleSuggestions()">
                        <div class="ai-suggestions-title">💡 推荐问题</div>
                        <button class="ai-suggestions-toggle" id="aiSuggestionsToggle">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M6 9l6 6 6-6"></path>
                            </svg>
                        </button>
                    </div>
                    <div class="ai-suggestions-list" id="aiSuggestionsList">
                        <button class="ai-suggestion-item" onclick="sendSuggestion('这个项目的主要功能是什么？')">
                            这个项目的主要功能是什么？
                        </button>
                        <button class="ai-suggestion-item" onclick="sendSuggestion('如何快速上手这个项目？')">
                            如何快速上手这个项目？
                        </button>
                        <button class="ai-suggestion-item" onclick="sendSuggestion('项目的技术架构是怎样的？')">
                            项目的技术架构是怎样的？
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="ai-assistant-input">
                <div class="ai-input-container">
                    <!-- 添加上下文标签容器 -->
                    <div id="contextTagsContainer" style="margin-bottom: 0.5rem; display: flex; flex-wrap: wrap;"></div>
                    <textarea 
                        class="ai-input" 
                        id="aiInput" 
                        placeholder="输入你的问题... (输入@选择文档)" 
                        rows="1"
                        onkeydown="handleAiInputKeydown(event)"
                        oninput="adjustTextareaHeight(this)"
                    ></textarea>
                    <button class="ai-send-btn" id="aiSendBtn" onclick="sendMessage()" disabled>
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 2L11 13"></path>
                            <path d="M22 2L15 22L11 13L2 9L22 2Z"></path>
                        </svg>
                    </button>
                </div>
            </div>

                </div>
            </div>
        </div>

        <!-- 引入Mermaid.js -->
        <script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>

        <script>
            // 设置管理
            const Settings = {
                theme: 'light',
                fontFamily: 'geist',
                fontSizeScale: 1,

                // 字体映射 - 优化中文字体支持
                fontFamilies: {
                    // 现代无衬线字体 - 以 Geist 为主
                    'geist': "'Geist', 'Noto Sans SC', 'PingFang SC', 'Hiragino Sans GB', sans-serif",
                    
                    // 思源黑体/Noto Sans SC - 现代中文黑体，清晰易读
                    'noto-sans-sc': "'Noto Sans SC', 'PingFang SC', 'Hiragino Sans GB', sans-serif",
                    
                    // 思源宋体 - 传统中文宋体，适合长文阅读
                    'noto-serif-sc': "'Noto Serif SC',  'Songti SC', 'STSong', serif",
                    
                    // Inter - 现代界面字体，中文使用思源黑体
                    'inter': "'Inter', 'Noto Sans SC', 'PingFang SC', 'Hiragino Sans GB', sans-serif",
                    
                    // 苹方 - macOS 现代中文字体
                    'pingfang': "'PingFang SC', 'Noto Sans SC', 'Hiragino Sans GB', sans-serif",
                },

                // 加载设置
                load() {
                    const saved = localStorage.getItem('litho-book-settings');
                    if (saved) {
                        const settings = JSON.parse(saved);
                        this.theme = settings.theme || 'light';
                        this.fontFamily = settings.fontFamily || 'geist';
                        this.fontSizeScale = settings.fontSizeScale || 1;
                    }
                    this.apply();
                },

                // 保存设置
                save() {
                    localStorage.setItem('litho-book-settings', JSON.stringify({
                        theme: this.theme,
                        fontFamily: this.fontFamily,
                        fontSizeScale: this.fontSizeScale
                    }));
                },

                // 应用设置
                apply() {
                    // 应用主题
                    if (this.theme === 'light') {
                        document.documentElement.removeAttribute('data-theme');
                    } else {
                        document.documentElement.setAttribute('data-theme', this.theme);
                    }

                    // 应用字体
                    document.documentElement.style.setProperty('--font-family', this.fontFamilies[this.fontFamily]);

                    // 应用字号
                    document.documentElement.style.setProperty('--font-size-scale', this.fontSizeScale);

                    // 重新初始化并渲染Mermaid图表以适应新主题
                    if (typeof mermaid !== 'undefined' && typeof initializeMermaid === 'function') {
                        try {
                            initializeMermaid();
                            // 使用防抖的重新渲染函数
                            if (typeof debouncedRerenderMermaid === 'function') {
                                debouncedRerenderMermaid();
                            }
                        } catch (error) {
                            console.warn('主题切换时初始化Mermaid失败:', error);
                        }
                    }

                    // 更新UI
                    this.updateUI();
                },

                // 更新UI显示
                updateUI() {
                    // 更新主题选择
                    document.querySelectorAll('.theme-option').forEach(option => {
                        option.classList.remove('active');
                        if (option.dataset.theme === this.theme) {
                            option.classList.add('active');
                        }
                    });

                    // 更新字体选择
                    const fontSelect = document.getElementById('fontSelect');
                    if (fontSelect) {
                        fontSelect.value = this.fontFamily;
                    }

                    // 更新字号显示
                    const fontSizeDisplay = document.getElementById('fontSizeDisplay');
                    if (fontSizeDisplay) {
                        fontSizeDisplay.textContent = Math.round(this.fontSizeScale * 100) + '%';
                    }

                    // 更新字体预览
                    const fontPreview = document.getElementById('fontPreview');
                    if (fontPreview) {
                        const previewText = fontPreview.querySelector('.font-preview-text');
                        if (previewText) {
                            previewText.style.fontFamily = this.fontFamilies[this.fontFamily];
                            previewText.style.fontSize = `calc(0.9rem * ${this.fontSizeScale})`;
                        }
                        
                        // 更新字体信息
                        const fontInfo = fontPreview.querySelector('.font-info small');
                        if (fontInfo) {
                            // 延迟检测字体，确保字体已加载
                            setTimeout(() => {
                                const actualFontInfo = this.getActualFontInfo();
                                fontInfo.innerHTML = `字体可用性：${actualFontInfo}<br>完整字体栈：${this.fontFamilies[this.fontFamily]}`;
                            }, 100);
                        }
                    }
                },

                // 设置主题
                setTheme(theme) {
                    this.theme = theme;
                    this.apply();
                    this.save();
                },

                // 设置字体
                setFont(fontFamily) {
                    this.fontFamily = fontFamily;
                    this.apply();
                    this.save();
                },

                // 调整字号
                adjustFontSize(delta) {
                    this.fontSizeScale = Math.max(0.5, Math.min(2, this.fontSizeScale + delta));
                    this.apply();
                    this.save();
                },

                // 重置设置
                reset() {
                    this.theme = 'light';
                    this.fontFamily = 'geist';
                    this.fontSizeScale = 1;
                    this.apply();
                    this.save();
                },

                // 检测字体是否可用
                checkFontAvailability(fontName) {
                    const canvas = document.createElement('canvas');
                    const context = canvas.getContext('2d');
                    
                    // 使用默认字体绘制文本
                    context.font = '12px monospace';
                    const defaultWidth = context.measureText('测试字体Test Font').width;
                    
                    // 使用指定字体绘制文本
                    context.font = `12px "${fontName}", monospace`;
                    const testWidth = context.measureText('测试字体Test Font').width;
                    
                    // 如果宽度不同，说明字体可用
                    return defaultWidth !== testWidth;
                },

                // 获取实际使用的字体信息
                getActualFontInfo() {
                    const fontStack = this.fontFamilies[this.fontFamily].split(',').map(f => f.trim().replace(/['"]/g, ''));
                    const availableFonts = [];
                    
                    for (const font of fontStack) {
                        if (font.startsWith('-') || font === 'sans-serif' || font === 'serif' || font === 'monospace') {
                            availableFonts.push(font);
                            continue;
                        }
                        
                        if (this.checkFontAvailability(font)) {
                            availableFonts.push(`✓ ${font}`);
                        } else {
                            availableFonts.push(`✗ ${font}`);
                        }
                    }
                    
                    return availableFonts.slice(0, 5).join(', ') + (fontStack.length > 5 ? '...' : '');
                }
            };

            // 设置面板控制
            function openSettings() {
                document.getElementById('settingsOverlay').style.display = 'flex';
                Settings.updateUI();
            }

            function closeSettings() {
                document.getElementById('settingsOverlay').style.display = 'none';
            }

            function adjustFontSize(delta) {
                Settings.adjustFontSize(delta);
            }

            function resetSettings() {
                Settings.reset();
            }

            // 字体预览折叠功能
            function toggleFontPreview() {
                const content = document.getElementById('fontPreviewContent');
                const toggle = document.getElementById('fontPreviewToggle');
                
                if (content && toggle) {
                    const isCollapsed = content.classList.contains('collapsed');
                    
                    if (isCollapsed) {
                        content.classList.remove('collapsed');
                        toggle.classList.remove('collapsed');
                    } else {
                        content.classList.add('collapsed');
                        toggle.classList.add('collapsed');
                    }
                }
            }

            // 目录功能
            const TableOfContents = {
                isCollapsed: true,
                headings: [],
                activeHeading: null,

                // 切换目录显示/隐藏
                toggle() {
                    const toc = document.getElementById('docToc');
                    const toggleBtn = document.getElementById('tocToggleBtn');

                    this.isCollapsed = !this.isCollapsed;

                    if (this.isCollapsed) {
                        toc.classList.add('collapsed');
                        toggleBtn.innerHTML = `
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="8" y1="6" x2="21" y2="6"></line>
                                <line x1="8" y1="12" x2="21" y2="12"></line>
                                <line x1="8" y1="18" x2="21" y2="18"></line>
                                <line x1="3" y1="6" x2="3.01" y2="6"></line>
                                <line x1="3" y1="12" x2="3.01" y2="12"></line>
                                <line x1="3" y1="18" x2="3.01" y2="18"></line>
                            </svg>
                        `;
                        toggleBtn.title = '展开目录';
                    } else {
                        toc.classList.remove('collapsed');
                        toggleBtn.innerHTML = `
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M18 6L6 18M6 6l12 12"></path>
                            </svg>
                        `;
                        toggleBtn.title = '收起目录';
                    }
                },

                // 生成目录
                generate() {
                    const content = document.querySelector('.markdown-content');
                    if (!content) {
                        this.hide();
                        return;
                    }

                    const headings = content.querySelectorAll('h1, h2, h3, h4, h5, h6');
                    if (headings.length === 0) {
                        this.hide();
                        return;
                    }

                    this.headings = Array.from(headings);
                    this.show();
                    this.render();
                    this.setupScrollSpy();
                },

                // 渲染目录
                render() {
                    const tocContent = document.getElementById('tocContent');
                    tocContent.innerHTML = '';

                    this.headings.forEach((heading, index) => {
                        const level = parseInt(heading.tagName.charAt(1));
                        const text = heading.textContent.trim();
                        const id = `heading-${index}`;

                        // 为标题添加ID，用于锚点跳转
                        heading.id = id;

                        // 创建目录项
                        const tocItem = document.createElement('a');
                        tocItem.className = `toc-item level-${level}`;
                        tocItem.textContent = text;
                        tocItem.href = `#${id}`;
                        tocItem.dataset.target = id;

                        // 点击事件
                        tocItem.addEventListener('click', (e) => {
                            e.preventDefault();
                            this.scrollToHeading(heading);
                            this.setActiveHeading(tocItem);
                        });

                        tocContent.appendChild(tocItem);
                    });
                },

                // 滚动到指定标题
                scrollToHeading(heading) {
                    const contentContainer = document.querySelector('.content');
                    const headerHeight = 60; // 头部高度
                    const offset = 20; // 额外偏移

                    const targetPosition = heading.offsetTop - headerHeight - offset;

                    contentContainer.scrollTo({
                        top: targetPosition,
                        behavior: 'smooth'
                    });
                },

                // 设置活跃标题
                setActiveHeading(tocItem) {
                    // 移除所有活跃状态
                    document.querySelectorAll('.toc-item').forEach(item => {
                        item.classList.remove('active');
                    });

                    // 设置当前活跃状态
                    if (tocItem) {
                        tocItem.classList.add('active');
                        this.activeHeading = tocItem;
                    }
                },

                // 设置滚动监听
                setupScrollSpy() {
                    const contentContainer = document.querySelector('.content');
                    if (!contentContainer) return;

                    let ticking = false;

                    const updateActiveHeading = () => {
                        const scrollTop = contentContainer.scrollTop;
                        const headerHeight = 60;
                        const threshold = 100;

                        let activeHeading = null;
                        let minDistance = Infinity;

                        this.headings.forEach((heading, index) => {
                            const rect = heading.getBoundingClientRect();
                            const containerRect = contentContainer.getBoundingClientRect();
                            const headingTop = rect.top - containerRect.top + scrollTop;
                            const distance = Math.abs(headingTop - scrollTop - headerHeight);

                            if (headingTop <= scrollTop + headerHeight + threshold && distance < minDistance) {
                                minDistance = distance;
                                activeHeading = document.querySelector(`[data-target="heading-${index}"]`);
                            }
                        });

                        if (activeHeading !== this.activeHeading) {
                            this.setActiveHeading(activeHeading);
                        }

                        ticking = false;
                    };

                    contentContainer.addEventListener('scroll', () => {
                        if (!ticking) {
                            requestAnimationFrame(updateActiveHeading);
                            ticking = true;
                        }
                    });
                },

                // 显示目录
                show() {
                    const toc = document.getElementById('docToc');
                    toc.style.display = 'block';
                },

                // 隐藏目录
                hide() {
                    const toc = document.getElementById('docToc');
                    toc.style.display = 'none';
                },

                // 清空目录
                clear() {
                    const tocContent = document.getElementById('tocContent');
                    tocContent.innerHTML = '';
                    this.headings = [];
                    this.activeHeading = null;
                }
            };

            // 目录切换函数
            function toggleToc() {
                TableOfContents.toggle();
            }

            // Mermaid主题配置
            function getMermaidTheme() {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                return currentTheme === 'dark' ? 'dark' : 'default';
            }
            
            // 获取当前主题的实际颜色值
            function getMermaidThemeVariables() {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                const computedStyle = getComputedStyle(document.documentElement);
                
                // 获取CSS变量的实际值
                function getCSSVar(varName) {
                    const value = computedStyle.getPropertyValue(varName).trim();
                    return value || (currentTheme === 'dark' ? '#ffffff' : '#000000');
                }
                
                if (currentTheme === 'dark') {
                    return {
                        primaryColor: '#3b82f6',
                        primaryTextColor: '#f8fafc',
                        primaryBorderColor: '#374151',
                        lineColor: '#6b7280',
                        secondaryColor: '#1f2937',
                        tertiaryColor: '#111827',
                        background: '#0f172a',
                        mainBkg: '#0f172a',
                        secondBkg: '#1e293b',
                        tertiaryBkg: '#334155',
                        edgeLabelBackground: '#0f172a',
                        clusterBkg: '#1e293b',
                        altBackground: '#1e293b',
                        nodeTextColor: '#f8fafc'
                    };
                } else {
                    return {
                        primaryColor: '#3b82f6',
                        primaryTextColor: '#1e293b',
                        primaryBorderColor: '#e5e7eb',
                        lineColor: '#6b7280',
                        secondaryColor: '#f8fafc',
                        tertiaryColor: '#ffffff',
                        background: '#ffffff',
                        mainBkg: '#ffffff',
                        secondBkg: '#f8fafc',
                        tertiaryBkg: '#f1f5f9',
                        edgeLabelBackground: '#ffffff',
                        clusterBkg: '#f8fafc',
                        altBackground: '#f8fafc',
                        nodeTextColor: '#1e293b'
                    };
                }
            }
            
            // 初始化Mermaid
            function initializeMermaid() {
                try {
                    const theme = getMermaidTheme();
                    const themeVariables = getMermaidThemeVariables();
                    
                    console.log('正在初始化Mermaid，主题:', theme);
                    
                    mermaid.initialize({
                        startOnLoad: false,
                        theme: theme,
                        securityLevel: 'loose',
                        fontFamily: 'inherit',
                        themeVariables: themeVariables,
                        // 添加错误处理配置
                        errorLevel: 'warn',
                        logLevel: 'warn'
                    });
                    
                    console.log('Mermaid初始化成功，主题:', theme);
                } catch (error) {
                    console.error('Mermaid初始化失败:', error);
                }
            }
            
            // 重新渲染所有Mermaid图表
            async function rerenderMermaidDiagrams() {
                try {
                    const mermaidElements = document.querySelectorAll('.mermaid');
                    
                    // 如果没有Mermaid元素，直接返回
                    if (mermaidElements.length === 0) {
                        return;
                    }
                    
                    console.log('开始重新渲染Mermaid图表，数量:', mermaidElements.length);
                    
                    // 清理所有现有的Mermaid渲染
                    mermaidElements.forEach(element => {
                        // 保存原始内容（如果还没有保存的话）
                        let originalContent = element.getAttribute('data-original-content');
                        if (!originalContent) {
                            // 尝试从当前文本内容获取原始内容
                            const currentText = element.textContent.trim();
                            if (currentText && !currentText.includes('<svg')) {
                                originalContent = currentText;
                                element.setAttribute('data-original-content', originalContent);
                            }
                        }
                        
                        // 清除现有内容和标记
                        if (originalContent) {
                            element.innerHTML = '';
                            element.textContent = originalContent;
                        }
                        element.removeAttribute('data-processed');
                        element.removeAttribute('data-enhanced');
                        element.dataset.needsReenhancement = 'true';
                        
                        // 移除现有的控制按钮
                        const existingControls = element.querySelector('.mermaid-controls');
                        if (existingControls) {
                            existingControls.remove();
                        }
                    });
                    
                    // 等待DOM更新完成
                    await new Promise(resolve => setTimeout(resolve, 100));
                    
                    // 使用mermaid.run()重新渲染所有图表
                    try {
                        await mermaid.run({
                            nodes: Array.from(mermaidElements)
                        });
                        console.log('Mermaid图表重新渲染成功');
                    } catch (error) {
                        console.warn('mermaid.run()失败，尝试逐个渲染:', error);
                        
                        // 如果mermaid.run()失败，回退到逐个渲染
                        for (let i = 0; i < mermaidElements.length; i++) {
                            const element = mermaidElements[i];
                            try {
                                const originalContent = element.getAttribute('data-original-content');
                                if (originalContent) {
                                    element.textContent = originalContent;
                                    element.removeAttribute('data-processed');
                                    
                                    // 使用mermaid.run()渲染单个图表
                                    await mermaid.run(undefined, element);
                                }
                            } catch (singleError) {
                                console.warn(`图表 ${i} 渲染失败:`, singleError);
                                // 保持原始文本内容
                                const originalContent = element.getAttribute('data-original-content');
                                if (originalContent) {
                                    element.innerHTML = '';
                                    element.textContent = originalContent;
                                }
                            }
                        }
                    }
                    
                    // 重新增强Mermaid图表
                    setTimeout(() => {
                        enhanceMermaidDiagrams();
                    }, 200);
                    
                } catch (error) {
                    console.error('重新渲染Mermaid图表时发生错误:', error);
                }
            }
            
            // 防抖变量
            let mermaidRerenderTimeout = null;
            let isRerenderingMermaid = false;
            
            // 简单的重新渲染函数
            function simpleRerenderMermaid() {
                // 清除之前的定时器
                if (mermaidRerenderTimeout) {
                    clearTimeout(mermaidRerenderTimeout);
                }
                
                // 如果正在重新渲染，跳过
                if (isRerenderingMermaid) {
                    return;
                }
                
                mermaidRerenderTimeout = setTimeout(() => {
                    if (isRerenderingMermaid) return;
                    
                    isRerenderingMermaid = true;
                    try {
                        console.log('开始简单重新渲染');
                        
                        // 重新初始化Mermaid
                        initializeMermaid();
                        
                        // 找到所有Mermaid元素并重新渲染
                        const mermaidElements = document.querySelectorAll('.mermaid');
                        mermaidElements.forEach((element, index) => {
                            try {
                                // 获取原始内容
                                let originalContent = element.getAttribute('data-original-content');
                                if (!originalContent) {
                                    // 如果没有保存的原始内容，尝试从当前内容提取
                                    const currentText = element.textContent.trim();
                                    if (currentText && !currentText.includes('<svg') && !currentText.includes('#mermaid-')) {
                                        originalContent = currentText;
                                        element.setAttribute('data-original-content', originalContent);
                                    }
                                }
                                
                                if (originalContent) {
                                    // 清理元素
                                    element.innerHTML = '';
                                    element.textContent = originalContent;
                                    element.removeAttribute('data-processed');
                                    element.removeAttribute('data-enhanced');
                                    
                                    // 移除控制按钮
                                    const controls = element.querySelector('.mermaid-controls');
                                    if (controls) {
                                        controls.remove();
                                    }
                                    
                                    console.log(`准备重新渲染图表 ${index}:`, originalContent.substring(0, 50));
                                }
                            } catch (error) {
                                console.warn(`清理图表 ${index} 失败:`, error);
                            }
                        });
                        
                        // 等待一下然后重新渲染
                        setTimeout(() => {
                            try {
                                mermaid.run(undefined, '.mermaid');
                                console.log('Mermaid重新渲染完成');
                                
                                // 重新增强
                                setTimeout(() => {
                                    enhanceMermaidDiagrams();
                                }, 300);
                            } catch (error) {
                                console.error('Mermaid重新渲染失败:', error);
                            } finally {
                                isRerenderingMermaid = false;
                            }
                        }, 200);
                        
                    } catch (error) {
                        console.error('简单重新渲染失败:', error);
                        isRerenderingMermaid = false;
                    }
                }, 150);
            }
            
            // 防抖的重新渲染函数（保持向后兼容）
            const debouncedRerenderMermaid = simpleRerenderMermaid;
            
            // 全局错误处理
            window.addEventListener('unhandledrejection', function(event) {
                if (event.reason && event.reason.toString().includes('mermaid')) {
                    console.warn('捕获到Mermaid相关的未处理Promise错误:', event.reason);
                    event.preventDefault(); // 阻止错误显示在控制台
                }
            });
            
            // 初始化Mermaid
            initializeMermaid();

            // 文档树数据
            const treeData = {{ tree_json|safe }};
            let currentFile = null;
            let allFiles = [];
            let originalTreeData = null;

            // 搜索相关变量
            let searchMode = 'content'; // 'content' or 'filename'
            let searchTimeout = null;
            let isSearching = false;

            // 收集所有文件用于搜索
            function collectFiles(node, path = '') {
                const currentPath = path ? `${path}/${node.name}` : node.name;

                if (node.is_file) {
                    allFiles.push({
                        name: node.name,
                        path: node.path,
                        fullPath: currentPath
                    });
                }

                if (node.children) {
                    node.children.forEach(child => collectFiles(child, currentPath));
                }
            }

            // 处理搜索输入
            function handleSearchInput() {
                const query = document.getElementById('searchInput').value.trim();
                const clearBtn = document.getElementById('searchClearBtn');
                const modeToggle = document.getElementById('searchModeToggle');
                
                // 显示/隐藏清除按钮
                if (query) {
                    clearBtn.classList.add('show');
                    modeToggle.style.display = 'flex';
                } else {
                    clearBtn.classList.remove('show');
                    modeToggle.style.display = 'none';
                }

                // 防抖搜索
                if (searchTimeout) {
                    clearTimeout(searchTimeout);
                }

                searchTimeout = setTimeout(() => {
                    if (query) {
                        performSearch(query);
                    } else {
                        clearSearch();
                    }
                }, 300);
            }

            // 执行搜索
            async function performSearch(query) {
                if (isSearching) return;
                
                isSearching = true;
                const treeContainer = document.getElementById('tree-container');

                if (searchMode === 'filename') {
                    // 文件名搜索（原有逻辑）
                    searchFiles();
                    isSearching = false;
                    return;
                }

                // 显示加载状态
                treeContainer.innerHTML = `
                    <div class="search-loading">
                        <div class="search-loading-spinner"></div>
                        <p>正在搜索...</p>
                    </div>
                `;

                try {
                    const response = await fetch(`/api/search?q=${encodeURIComponent(query)}`);
                    if (!response.ok) {
                        throw new Error(`搜索失败: ${response.status}`);
                    }

                    const data = await response.json();
                    displaySearchResults(data);
                } catch (error) {
                    console.error('搜索错误:', error);
                    treeContainer.innerHTML = `
                        <div class="search-empty">
                            <div class="search-empty-icon">⚠️</div>
                            <p>搜索失败</p>
                            <p style="font-size: 0.8rem; margin-top: 0.5rem;">${error.message}</p>
                        </div>
                    `;
                } finally {
                    isSearching = false;
                }
            }

            // 显示搜索结果
            function displaySearchResults(data) {
                const treeContainer = document.getElementById('tree-container');
                
                if (data.total === 0) {
                    treeContainer.innerHTML = `
                        <div class="search-empty">
                            <div class="search-empty-icon">🔍</div>
                            <p>未找到匹配内容</p>
                            <p style="font-size: 0.8rem; margin-top: 0.5rem;">尝试使用不同的关键词</p>
                        </div>
                    `;
                    return;
                }

                let html = `
                    <div class="search-stats">
                        <span>找到 ${data.total} 个结果</span>
                        <span>查询: "${data.query}"</span>
                    </div>
                    <div class="search-results">
                `;

                data.results.forEach(result => {
                    const title = result.title || result.file_name;
                    const score = Math.round(result.relevance_score * 10) / 10;
                    
                    html += `
                        <div class="search-result-item" onclick="loadFile('${result.file_path}')">
                            <div class="search-result-header">
                                <div class="search-result-title">
                                    <span class="file-icon"></span>
                                    <span>${title}</span>
                                </div>
                                <div class="search-result-score">${score}</div>
                            </div>
                            <div class="search-result-matches">
                    `;

                    // 限制显示的匹配数量
                    const maxMatches = 3;
                    const matches = result.matches.slice(0, maxMatches);
                    
                    matches.forEach(match => {
                        html += `
                            <div class="search-match">
                                <div class="search-match-line">第 ${match.line_number} 行</div>
                                <div class="search-match-content">${match.highlighted_content}</div>
                        `;
                        
                        if (match.context_before || match.context_after) {
                            html += '<div class="search-match-context">';
                            if (match.context_before) {
                                html += `<div>... ${match.context_before}</div>`;
                            }
                            if (match.context_after) {
                                html += `<div>${match.context_after} ...</div>`;
                            }
                            html += '</div>';
                        }
                        
                        html += '</div>';
                    });

                    if (result.matches.length > maxMatches) {
                        html += `
                            <div class="search-match" style="text-align: center; color: var(--text-secondary); font-style: italic;">
                                还有 ${result.matches.length - maxMatches} 个匹配项...
                            </div>
                        `;
                    }

                    html += `
                            </div>
                        </div>
                    `;
                });

                html += '</div>';
                treeContainer.innerHTML = html;
            }

            // 设置搜索模式
            function setSearchMode(mode) {
                searchMode = mode;
                
                // 更新按钮状态
                document.querySelectorAll('.search-mode-btn').forEach(btn => {
                    btn.classList.remove('active');
                    if (btn.dataset.mode === mode) {
                        btn.classList.add('active');
                    }
                });

                // 更新搜索框占位符
                const searchInput = document.getElementById('searchInput');
                if (mode === 'content') {
                    searchInput.placeholder = '搜索文档内容...';
                } else {
                    searchInput.placeholder = '搜索文件名...';
                }

                // 如果有查询，重新搜索
                const query = searchInput.value.trim();
                if (query) {
                    performSearch(query);
                }
            }

            // 清除搜索
            function clearSearch() {
                const searchInput = document.getElementById('searchInput');
                const clearBtn = document.getElementById('searchClearBtn');
                const modeToggle = document.getElementById('searchModeToggle');
                const treeContainer = document.getElementById('tree-container');
                
                searchInput.value = '';
                clearBtn.classList.remove('show');
                modeToggle.style.display = 'none';
                
                // 恢复原始目录树
                treeContainer.innerHTML = '';
                if (originalTreeData) {
                    renderTreeChildren(originalTreeData, treeContainer);
                }
            }

            // 原有的文件名搜索函数（保持向后兼容）
            function searchFiles() {
                const query = document.getElementById('searchInput').value.toLowerCase().trim();
                const treeContainer = document.getElementById('tree-container');

                if (!query) {
                    // 清空搜索时，重新渲染原始树结构
                    treeContainer.innerHTML = '';
                    if (originalTreeData) {
                        renderTreeChildren(originalTreeData, treeContainer);
                    }
                    return;
                }

                const filteredFiles = allFiles.filter(file =>
                    file.name.toLowerCase().includes(query) ||
                    file.fullPath.toLowerCase().includes(query)
                ).sort((a, b) => {
                    // 对搜索结果也使用智能排序
                    const getNumberPrefix = (name) => {
                        const match = name.match(/^(\d+)[^\d]/);
                        return match ? parseInt(match[1], 10) : null;
                    };
                    
                    const aNumber = getNumberPrefix(a.name);
                    const bNumber = getNumberPrefix(b.name);
                    
                    if (aNumber !== null && bNumber !== null) {
                        if (aNumber !== bNumber) {
                            return aNumber - bNumber;
                        }
                        return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
                    }
                    
                    if (aNumber !== null && bNumber === null) return -1;
                    if (aNumber === null && bNumber !== null) return 1;
                    
                    return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
                });

                treeContainer.innerHTML = '';

                if (filteredFiles.length === 0) {
                    treeContainer.innerHTML = `
                        <div class="search-empty">
                            <div class="search-empty-icon">📁</div>
                            <p>未找到匹配的文件</p>
                        </div>
                    `;
                    return;
                }

                filteredFiles.forEach(file => {
                    const nodeDiv = document.createElement('div');
                    nodeDiv.className = 'tree-node';

                    const itemDiv = document.createElement('div');
                    itemDiv.className = 'tree-item file';

                    const iconSpan = document.createElement('span');
                    iconSpan.className = 'tree-icon file-icon';

                    const nameSpan = document.createElement('span');
                    nameSpan.textContent = file.name;
                    nameSpan.title = file.fullPath;

                    itemDiv.addEventListener('click', () => loadFile(file.path));

                    itemDiv.appendChild(iconSpan);
                    itemDiv.appendChild(nameSpan);
                    nodeDiv.appendChild(itemDiv);
                    treeContainer.appendChild(nodeDiv);
                });
            }

            // 文件名智能排序函数（完全按名称排序，不区分文件夹和文件）
            function smartSort(a, b) {
                // 提取数字前缀的正则表达式
                const getNumberPrefix = (name) => {
                    const match = name.match(/^(\d+)[^\d]/);
                    return match ? parseInt(match[1], 10) : null;
                };
                
                const aNumber = getNumberPrefix(a.name);
                const bNumber = getNumberPrefix(b.name);
                
                // 如果两个都有数字前缀，按数字大小排序
                if (aNumber !== null && bNumber !== null) {
                    if (aNumber !== bNumber) {
                        return aNumber - bNumber;
                    }
                    // 数字相同时，按字符串排序
                    return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
                }
                
                // 如果只有一个有数字前缀，有数字的在前
                if (aNumber !== null && bNumber === null) return -1;
                if (aNumber === null && bNumber !== null) return 1;
                
                // 都没有数字前缀，按字母顺序排序
                return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
            }

            // 渲染文档树的子节点（不包含根节点）
            function renderTreeChildren(node, container) {
                if (node.children && node.children.length > 0) {
                    // 使用智能排序函数对子节点进行排序
                    const sortedChildren = [...node.children].sort(smartSort);
                    
                    sortedChildren.forEach(child => {
                        renderTree(child, container, 0);
                    });
                }
            }

            // 渲染文档树
            function renderTree(node, container, level = 0) {
                const nodeDiv = document.createElement('div');
                nodeDiv.className = 'tree-node';

                const itemDiv = document.createElement('div');
                itemDiv.className = 'tree-item';

                const iconSpan = document.createElement('span');
                iconSpan.className = 'tree-icon';

                const nameSpan = document.createElement('span');
                nameSpan.textContent = node.name;

                if (node.is_file) {
                    iconSpan.className += ' file-icon';
                    itemDiv.className += ' file';
                    itemDiv.addEventListener('click', () => loadFile(node.path));
                } else {
                    iconSpan.className += ' folder-icon';
                    itemDiv.addEventListener('click', () => toggleFolder(nodeDiv, iconSpan));
                }

                itemDiv.appendChild(iconSpan);
                itemDiv.appendChild(nameSpan);
                nodeDiv.appendChild(itemDiv);

                if (!node.is_file && node.children && node.children.length > 0) {
                    const childrenDiv = document.createElement('div');
                    // 默认折叠所有文件夹
                    childrenDiv.className = 'tree-children collapsed';

                    // 使用智能排序函数对子节点进行排序
                    const sortedChildren = [...node.children].sort(smartSort);

                    sortedChildren.forEach(child => {
                        renderTree(child, childrenDiv, level + 1);
                    });

                    nodeDiv.appendChild(childrenDiv);
                }

                container.appendChild(nodeDiv);
            }

            // 切换文件夹展开/收起
            function toggleFolder(nodeDiv, iconSpan) {
                const childrenDiv = nodeDiv.querySelector('.tree-children');
                if (childrenDiv) {
                    childrenDiv.classList.toggle('collapsed');
                    iconSpan.classList.toggle('open');
                }
            }

            // 切换侧边栏
            function toggleSidebar() {
                const sidebar = document.getElementById('sidebar');
                if (window.innerWidth <= 768) {
                    sidebar.classList.toggle('show');
                } else {
                    sidebar.classList.toggle('collapsed');
                }
            }

            // 更新面包屑导航
            function updateBreadcrumb(filePath) {
                const breadcrumb = document.getElementById('breadcrumb');
                if (!filePath) {
                    breadcrumb.innerHTML = '';
                    return;
                }

                const parts = filePath.split('/');
                const breadcrumbHtml = parts.map((part, index) => {
                    if (index === parts.length - 1) {
                        return `<span style="color: var(--accent-color); font-weight: 600;">${part}</span>`;
                    }
                    return `<span style="color: var(--text-secondary);">${part}</span>`;
                }).join(' <span style="color: var(--text-secondary);">></span> ');

                breadcrumb.innerHTML = breadcrumbHtml;
            }

            // 加载文件内容
            async function loadFile(filePath) {
                if (currentFile === filePath) return;

                const contentContainer = document.getElementById('content-container');
                contentContainer.innerHTML = `
                    <div class="loading">
                        <div class="loading-spinner"></div>
                        <p>正在加载文档...</p>
                    </div>
                `;

                try {
                    const response = await fetch(`/api/file?file=${encodeURIComponent(filePath)}`);
                    if (!response.ok) {
                        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
                    }

                    const data = await response.json();

                    // 更新当前选中状态
                    document.querySelectorAll('.tree-item').forEach(item => {
                        item.classList.remove('active');
                    });

                    const activeItem = Array.from(document.querySelectorAll('.tree-item'))
                        .find(item => {
                            const span = item.querySelector('span:last-child');
                            return span && span.textContent.trim() === filePath.split('/').pop();
                        });
                    if (activeItem) {
                        activeItem.classList.add('active');
                    }

                    currentFile = filePath;
                    updateBreadcrumb(filePath);

                    // 渲染Markdown内容
                    contentContainer.innerHTML = `<div class="markdown-content">${data.html}</div>`;

                    // 渲染Mermaid图表
                    const mermaidElements = contentContainer.querySelectorAll('code.language-mermaid, pre code.language-mermaid');
                    
                    // 为每个 Mermaid 元素单独处理，避免一个错误影响所有渲染
                    for (let i = 0; i < mermaidElements.length; i++) {
                        const element = mermaidElements[i];
                        const mermaidCode = element.textContent;
                        const mermaidId = `mermaid-${Date.now()}-${i}`;

                        const mermaidDiv = document.createElement('div');
                        mermaidDiv.className = 'mermaid';
                        mermaidDiv.id = mermaidId;
                        mermaidDiv.textContent = mermaidCode;

                        // 替换原始元素
                        const parentElement = element.closest('pre') || element;
                        parentElement.replaceWith(mermaidDiv);

                        // 尝试渲染单个 Mermaid 图表
                        try {
                            await mermaid.run(undefined, `#${mermaidId}`);
                        } catch (error) {
                            console.warn(`Mermaid 图表渲染失败 (${mermaidId}):`, error);
                            
                            // 创建错误显示容器
                            const errorContainer = document.createElement('div');
                            errorContainer.style.cssText = `
                                border: 2px dashed var(--border-color);
                                border-radius: 8px;
                                padding: 1rem;
                                margin: 1rem 0;
                                background: var(--bg-secondary);
                                position: relative;
                            `;

                            // 添加错误提示标题
                            const errorTitle = document.createElement('div');
                            errorTitle.style.cssText = `
                                color: #dc3545;
                                font-weight: 600;
                                font-size: 0.9rem;
                                margin-bottom: 0.5rem;
                                display: flex;
                                align-items: center;
                                gap: 0.5rem;
                            `;
                            errorTitle.innerHTML = `
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                    <line x1="12" y1="9" x2="12" y2="13"></line>
                                    <line x1="12" y1="17" x2="12.01" y2="17"></line>
                                </svg>
                                Mermaid 图表渲染失败
                            `;

                            // 添加原始代码显示
                            const codeBlock = document.createElement('pre');
                            codeBlock.style.cssText = `
                                background: var(--pre-bg);
                                padding: 1rem;
                                border-radius: 6px;
                                margin: 0;
                                border: 1px solid var(--border-color);
                                font-family: 'SF Mono', 'Monaco', 'Inconsolata', monospace;
                                font-size: 0.9em;
                                color: var(--text-primary);
                                overflow-x: auto;
                                white-space: pre-wrap;
                                word-wrap: break-word;
                            `;

                            const code = document.createElement('code');
                            code.textContent = mermaidCode;
                            codeBlock.appendChild(code);

                            // 添加错误详情（可选显示）
                            const errorDetails = document.createElement('details');
                            errorDetails.style.cssText = `
                                margin-top: 0.5rem;
                                color: var(--text-secondary);
                                font-size: 0.85rem;
                            `;
                            
                            const errorSummary = document.createElement('summary');
                            errorSummary.style.cssText = `
                                cursor: pointer;
                                color: #dc3545;
                                font-weight: 500;
                            `;
                            errorSummary.textContent = '查看错误详情';
                            
                            const errorMessage = document.createElement('pre');
                            errorMessage.style.cssText = `
                                margin-top: 0.5rem;
                                padding: 0.5rem;
                                background: var(--bg-tertiary);
                                border-radius: 4px;
                                font-size: 0.8rem;
                                white-space: pre-wrap;
                                word-wrap: break-word;
                            `;
                            errorMessage.textContent = error.message || error.toString();
                            
                            errorDetails.appendChild(errorSummary);
                            errorDetails.appendChild(errorMessage);

                            // 组装错误容器
                            errorContainer.appendChild(errorTitle);
                            errorContainer.appendChild(codeBlock);
                            errorContainer.appendChild(errorDetails);

                            // 替换失败的 Mermaid 元素
                            mermaidDiv.replaceWith(errorContainer);
                        }
                    }

                    // 生成文档目录
                    setTimeout(() => {
                        TableOfContents.generate();
                    }, 100);

                    // 滚动到顶部
                    contentContainer.scrollTop = 0;

                    // 在移动端自动隐藏侧边栏
                    if (window.innerWidth <= 768) {
                        document.getElementById('sidebar').classList.remove('show');
                    }

                    // 更新AI助手中的上下文标签
                    updateContextOnFileChange(filePath);

                } catch (error) {
                    contentContainer.innerHTML = `
                        <div class="error">
                            <h3>📋 加载失败</h3>
                            <p><strong>文件:</strong> ${filePath}</p>
                            <p><strong>错误:</strong> ${error.message}</p>
                        </div>
                    `;
                }
            }

            // 当文件切换时更新AI助手上下文
            function updateContextOnFileChange(filePath) {
                // 获取当前文件名
                const currentFileName = filePath ? filePath.split('/').pop() : null;
                
                if (!currentFileName) return;
                
                // 检查当前文件是否已经在选中列表中
                const isAlreadySelected = selectedContextFiles.some(file => file.path === filePath);
                
                // 如果当前文件不在选中列表中，添加它
                if (!isAlreadySelected) {
                    selectedContextFiles.push({
                        name: currentFileName,
                        path: filePath
                    });
                }
                
                // 更新上下文标签显示
                updateContextTags();
            }

            // 更新上下文标签显示
            function updateContextTags() {
                const tagsContainer = document.getElementById('contextTagsContainer');
                if (!tagsContainer) return;
                
                // 清空现有标签
                tagsContainer.innerHTML = '';
                
                // 获取当前文件名
                const currentFileName = currentFile ? currentFile.split('/').pop() : null;
                
                // 为每个选中的文件创建标签
                selectedContextFiles.forEach((file, index) => {
                    const tag = document.createElement('div');
                    tag.style.cssText = `
                        display: inline-flex;
                        align-items: center;
                        background: var(--accent-color);
                        color: white;
                        border-radius: 12px;
                        padding: 0.25rem 0.75rem;
                        margin-right: 0.5rem;
                        margin-bottom: 0.5rem;
                        font-size: 0.85rem;
                    `;
                    
                    const nameSpan = document.createElement('span');
                    nameSpan.textContent = file.name;
                    nameSpan.style.cssText = `
                        margin-right: 0.5rem;
                        max-width: 150px;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                    `;
                    
                    // 如果是当前文件，不显示删除按钮
                    if (currentFileName && file.name === currentFileName) {
                        tag.style.background = 'var(--text-secondary)'; // 不同的颜色表示不可删除
                        tag.appendChild(nameSpan);
                    } else {
                        // 其他文件显示删除按钮
                        const removeBtn = document.createElement('button');
                        removeBtn.innerHTML = '&times;';
                        removeBtn.style.cssText = `
                            background: none;
                            border: none;
                            color: white;
                            cursor: pointer;
                            font-size: 1.2rem;
                            line-height: 1;
                            padding: 0;
                            width: 16px;
                            height: 16px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                        `;
                        
                        removeBtn.onclick = () => {
                            // 从选中列表中移除
                            selectedContextFiles = selectedContextFiles.filter(f => f.path !== file.path);
                            // 更新标签显示
                            updateContextTags();
                            // 更新文档选择器中的复选框状态（如果打开的话）
                            const checkbox = document.querySelector(`input[type="checkbox"][data-path="${file.path}"]`);
                            if (checkbox) {
                                checkbox.checked = false;
                            }
                        };
                        
                        tag.appendChild(nameSpan);
                        tag.appendChild(removeBtn);
                    }
                    
                    tagsContainer.appendChild(tag);
                });
            }

            // 初始化默认上下文
            function initializeDefaultContext() {
                // 默认添加架构概览文档
                selectedContextFiles = [{
                    name: '2、架构概览.md',
                    path: '2、架构概览.md'
                }];
                
                // 如果有当前文件，也添加到上下文
                if (currentFile) {
                    const currentFileName = currentFile.split('/').pop();
                    // 检查是否已经添加过
                    const isAlreadyAdded = selectedContextFiles.some(file => file.name === currentFileName);
                    if (!isAlreadyAdded) {
                        selectedContextFiles.push({
                            name: currentFileName,
                            path: currentFile
                        });
                    }
                }
                
                // 更新上下文标签显示
                updateContextTags();
            }

            // 响应式处理
            window.addEventListener('resize', () => {
                const sidebar = document.getElementById('sidebar');
                if (window.innerWidth > 768) {
                    sidebar.classList.remove('show');
                }
            });

            // 初始化页面
            document.addEventListener('DOMContentLoaded', () => {
                // 加载设置
                Settings.load();

                // 主题选择事件
                document.querySelectorAll('.theme-option').forEach(option => {
                    option.addEventListener('click', () => {
                        Settings.setTheme(option.dataset.theme);
                    });
                });

                // 字体选择事件
                const fontSelect = document.getElementById('fontSelect');
                if (fontSelect) {
                    fontSelect.addEventListener('change', (e) => {
                        Settings.setFont(e.target.value);
                    });
                }

                // 点击遮罩关闭设置面板
                document.getElementById('settingsOverlay').addEventListener('click', (e) => {
                    if (e.target === e.currentTarget) {
                        closeSettings();
                    }
                });

                // ESC键关闭设置面板
                document.addEventListener('keydown', (e) => {
                    if (e.key === 'Escape') {
                        closeSettings();
                    }
                });

                // 设置文档路径
                const docsPath = '{{ docs_path }}';
                document.getElementById('docs-path').textContent = docsPath;

                // 保存原始树数据
                originalTreeData = treeData;

                // 收集所有文件用于搜索
                collectFiles(treeData);

                // 渲染目录树（不包含根节点）
                const treeContainer = document.getElementById('tree-container');
                renderTreeChildren(treeData, treeContainer);
                
                // 初始化默认文档加载（带降级策略）
                initializeDefaultDocument();
            });

            // 初始化默认文档加载（带降级策略）
            async function initializeDefaultDocument() {
                const defaultFiles = ['1、项目概述.md', '1.Overview.md', 'README.md', 'Overview.md', '项目概述.md'];
                
                for (const fileName of defaultFiles) {
                    try {
                        const response = await fetch(`/api/file?file=${encodeURIComponent(fileName)}`);
                        if (response.ok) {
                            // 找到可用文件，加载它
                            await loadFile(fileName);
                            console.info(`成功加载默认文档: ${fileName}`);
                            return;
                        }
                    } catch (error) {
                        console.warn(`尝试加载 ${fileName} 失败:`, error);
                    }
                }
                
                // 如果所有默认文件都失败，显示欢迎信息
                console.info('未找到默认文档文件，显示欢迎界面');
                const contentContainer = document.getElementById('content-container');
                contentContainer.innerHTML = `
                    <div class="loading">
                        <div style="text-align: center; padding: 4rem 2rem; color: var(--text-secondary);">
                            <div style="font-size: 3rem; margin-bottom: 1rem;">📚</div>
                            <h2 style="color: var(--text-primary); margin-bottom: 1rem;">欢迎使用 Litho Book</h2>
                            <p style="margin-bottom: 1.5rem;">选择左侧文档开始阅读</p>
                            <div style="background: var(--bg-secondary); padding: 1.5rem; border-radius: 8px; border: 1px solid var(--border-color); text-align: left; max-width: 500px; margin: 0 auto;">
                                <h4 style="color: var(--text-primary); margin-bottom: 1rem;">💡 提示</h4>
                                <ul style="color: var(--text-secondary); line-height: 1.6; margin: 0; padding-left: 1.5rem;">
                                    <li>支持完整的 Markdown 语法渲染</li>
                                    <li>自动渲染 Mermaid 图表和流程图</li>
                                    <li>提供实时搜索和智能导航</li>
                                    <li>响应式设计，支持多设备访问</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                `;
                
                // 初始化AI助手默认上下文
                setTimeout(() => {
                    initializeDefaultContext();
                }, 100);
            }

            // Mermaid图表增强功能
            function enhanceMermaidDiagrams() {
                document.querySelectorAll('.mermaid').forEach(mermaidElement => {
                    // 检查是否已经渲染为SVG
                    const svg = mermaidElement.querySelector('svg');
                    if (!svg) {
                        console.log('跳过未渲染的Mermaid元素:', mermaidElement);
                        return;
                    }
                    
                    // 避免重复增强（但允许主题切换后重新增强）
                    if (mermaidElement.dataset.enhanced && !mermaidElement.dataset.needsReenhancement) return;
                    mermaidElement.dataset.enhanced = 'true';
                    mermaidElement.dataset.needsReenhancement = 'false';
                    
                    console.log('增强Mermaid图表:', mermaidElement);
                    
                    // 确保mermaid元素有相对定位
                    mermaidElement.style.position = 'relative';
                    mermaidElement.style.cursor = 'pointer';
                    mermaidElement.style.transition = 'all 0.2s ease';
                    
                    // 添加悬停效果
                    mermaidElement.addEventListener('mouseenter', () => {
                        mermaidElement.style.boxShadow = '0 4px 16px rgba(0, 0, 0, 0.1)';
                        mermaidElement.style.transform = 'translateY(-2px)';
                    });
                    
                    mermaidElement.addEventListener('mouseleave', () => {
                        mermaidElement.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.1)';
                        mermaidElement.style.transform = 'translateY(0)';
                    });
                    
                    // 添加点击预览功能
                    mermaidElement.addEventListener('click', () => {
                        openMermaidPreview(mermaidElement);
                    });
                    
                    // 创建控制按钮容器
                    const controlsContainer = document.createElement('div');
                    controlsContainer.className = 'mermaid-controls';
                    controlsContainer.style.cssText = `
                        position: absolute;
                        top: 0.5rem;
                        right: 0.5rem;
                        display: flex;
                        gap: 0.25rem;
                        opacity: 0;
                        transition: opacity 0.2s ease;
                        z-index: 10;
                    `;
                    
                    // 下载按钮
                    const downloadBtn = document.createElement('button');
                    downloadBtn.innerHTML = '⬇️';
                    downloadBtn.title = '下载图片';
                    downloadBtn.style.cssText = `
                        background: #007bff;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        padding: 0.25rem;
                        cursor: pointer;
                        width: 28px;
                        height: 28px;
                        font-size: 12px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                        transition: all 0.2s ease;
                    `;
                    
                    downloadBtn.addEventListener('mouseenter', () => {
                        downloadBtn.style.background = '#0056b3';
                        downloadBtn.style.transform = 'scale(1.1)';
                    });
                    
                    downloadBtn.addEventListener('mouseleave', () => {
                        downloadBtn.style.background = '#007bff';
                        downloadBtn.style.transform = 'scale(1)';
                    });
                    
                    downloadBtn.addEventListener('click', (e) => {
                        e.stopPropagation();
                        downloadMermaidImage(mermaidElement);
                    });
                    
                    // 复制按钮
                    const copyBtn = document.createElement('button');
                    copyBtn.innerHTML = '📋';
                    copyBtn.title = '复制图片';
                    copyBtn.style.cssText = `
                        background: #28a745;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        padding: 0.25rem;
                        cursor: pointer;
                        width: 28px;
                        height: 28px;
                        font-size: 12px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                        transition: all 0.2s ease;
                    `;
                    
                    copyBtn.addEventListener('mouseenter', () => {
                        copyBtn.style.background = '#1e7e34';
                        copyBtn.style.transform = 'scale(1.1)';
                    });
                    
                    copyBtn.addEventListener('mouseleave', () => {
                        copyBtn.style.background = '#28a745';
                        copyBtn.style.transform = 'scale(1)';
                    });
                    
                    copyBtn.addEventListener('click', (e) => {
                        e.stopPropagation();
                        copyMermaidImage(mermaidElement);
                    });
                    
                    // 添加按钮到容器
                    controlsContainer.appendChild(downloadBtn);
                    controlsContainer.appendChild(copyBtn);
                    mermaidElement.appendChild(controlsContainer);
                    
                    // 悬停显示/隐藏控制按钮
                    mermaidElement.addEventListener('mouseenter', () => {
                        controlsContainer.style.opacity = '1';
                    });
                    
                    mermaidElement.addEventListener('mouseleave', () => {
                        controlsContainer.style.opacity = '0';
                    });
                });
            }
            
            // 全局变量跟踪当前预览状态
            let currentPreviewModal = null;
            let isPreviewOpen = false;
            let isPreviewOpening = false; // 防止重复点击
            
            // 替换预览内容（避免重新创建模态框）
            function replacePreviewContent(mermaidElement) {
                if (!currentPreviewModal || !isPreviewOpen) return;
                
                const svg = mermaidElement.querySelector('svg');
                if (!svg) return;
                
                // 找到当前预览的内容容器
                const contentContainer = currentPreviewModal.querySelector('.content');
                if (!contentContainer) return;
                
                // 重置缩放状态
                window.currentZoom = 1;
                window.currentTranslate = { x: 0, y: 0 };
                
                // 移除旧的SVG和缩放信息
                const oldSvg = contentContainer.querySelector('#previewSvg');
                const oldZoomInfo = contentContainer.querySelector('#zoomInfo');
                if (oldSvg) oldSvg.remove();
                if (oldZoomInfo) oldZoomInfo.remove();
                
                // 创建新的SVG内容（复用原有的克隆逻辑）
                const clonedSvg = createClonedSvg(svg);
                const zoomInfo = createZoomInfo();
                
                // 添加新内容
                contentContainer.appendChild(clonedSvg);
                contentContainer.appendChild(zoomInfo);
                
                // 重新设置事件监听器
                setupSvgInteractions(clonedSvg);
                
                // 更新缩放信息显示
                updateZoomInfo();
            }
            
            // 创建克隆的SVG（提取为独立函数）
            function createClonedSvg(svg) {
                // 克隆SVG并保持样式完全一致
                const clonedSvg = svg.cloneNode(true);
                clonedSvg.id = 'previewSvg';
                
                // 深度复制所有样式信息
                function copyElementStyles(source, target) {
                    const sourceStyles = window.getComputedStyle(source);
                    
                    // 复制所有重要的样式属性
                    const importantStyles = [
                        'color', 'backgroundColor', 'fill', 'stroke', 'strokeWidth',
                        'fontFamily', 'fontSize', 'fontWeight', 'fontStyle',
                        'textAnchor', 'dominantBaseline', 'opacity'
                    ];
                    
                    importantStyles.forEach(prop => {
                        const value = sourceStyles.getPropertyValue(prop);
                        if (value && value !== 'initial' && value !== 'inherit') {
                            target.style.setProperty(prop, value);
                        }
                    });
                    
                    // 递归处理子元素
                    for (let i = 0; i < source.children.length; i++) {
                        if (target.children[i]) {
                            copyElementStyles(source.children[i], target.children[i]);
                        }
                    }
                }
                
                // 应用样式复制
                copyElementStyles(svg, clonedSvg);
                
                // 设置预览模式的基本样式
                clonedSvg.style.cssText += `
                    max-width: 100%;
                    max-height: 100%;
                    width: auto;
                    height: auto;
                    transition: transform 0.2s ease;
                    cursor: grab;
                `;
                
                // 保持原始SVG的所有属性
                const originalSvgRect = svg.getBoundingClientRect();
                const originalWidth = svg.getAttribute('width') || originalSvgRect.width;
                const originalHeight = svg.getAttribute('height') || originalSvgRect.height;
                
                // 保持原始尺寸和viewBox
                if (originalWidth && originalHeight) {
                    clonedSvg.setAttribute('width', originalWidth);
                    clonedSvg.setAttribute('height', originalHeight);
                }
                
                if (svg.getAttribute('viewBox')) {
                    clonedSvg.setAttribute('viewBox', svg.getAttribute('viewBox'));
                }
                
                // 复制所有SVG属性
                Array.from(svg.attributes).forEach(attr => {
                    if (attr.name !== 'id' && attr.name !== 'style') {
                        clonedSvg.setAttribute(attr.name, attr.value);
                    }
                });
                
                return clonedSvg;
            }
            
            // 创建缩放信息显示（提取为独立函数）
            function createZoomInfo() {
                const zoomInfo = document.createElement('div');
                zoomInfo.id = 'zoomInfo';
                zoomInfo.style.cssText = `
                    position: absolute;
                    bottom: 1rem;
                    left: 50%;
                    transform: translateX(-50%);
                    background: var(--bg-secondary);
                    color: var(--text-primary);
                    padding: 0.5rem 1rem;
                    border-radius: 6px;
                    font-size: 0.9rem;
                    font-weight: 500;
                    pointer-events: none;
                    border: 1px solid var(--border-color);
                    min-width: 60px;
                    text-align: center;
                    z-index: 10;
                `;
                return zoomInfo;
            }
            
            // 设置SVG交互事件（提取为独立函数）
            function setupSvgInteractions(clonedSvg) {
                let isDragging = false;
                let dragStart = { x: 0, y: 0 };
                
                // 添加拖拽功能
                clonedSvg.addEventListener('mousedown', (e) => {
                    isDragging = true;
                    dragStart = { x: e.clientX, y: e.clientY };
                    clonedSvg.style.cursor = 'grabbing';
                });
                
                document.addEventListener('mousemove', (e) => {
                    if (!isDragging) return;
                    
                    const deltaX = e.clientX - dragStart.x;
                    const deltaY = e.clientY - dragStart.y;
                    
                    window.currentTranslate.x += deltaX;
                    window.currentTranslate.y += deltaY;
                    
                    window.updateSvgTransform();
                    dragStart = { x: e.clientX, y: e.clientY };
                });
                
                document.addEventListener('mouseup', () => {
                    isDragging = false;
                    clonedSvg.style.cursor = 'grab';
                });
                
                // 滚轮缩放
                clonedSvg.addEventListener('wheel', (e) => {
                    e.preventDefault();
                    const delta = e.deltaY > 0 ? 0.9 : 1.1;
                    window.currentZoom *= delta;
                    window.currentZoom = Math.max(0.1, Math.min(5, window.currentZoom));
                    window.updateSvgTransform();
                });
            }
            
            // 全局关闭预览函数
            function closeAllMermaidPreviews() {
                // 关闭所有可能存在的预览模态框
                const existingModals = document.querySelectorAll('[id^="mermaidPreviewModal"]');
                existingModals.forEach(modal => {
                    modal.style.opacity = '0';
                    setTimeout(() => {
                        if (document.body.contains(modal)) {
                            document.body.removeChild(modal);
                        }
                    }, 200);
                });
                
                // 重置全局状态
                currentPreviewModal = null;
                isPreviewOpen = false;
                isPreviewOpening = false;
                
                // 移除所有键盘事件监听器
                document.removeEventListener('keydown', globalKeydownHandler);
            }
            
            // 全局键盘事件处理器
            function globalKeydownHandler(e) {
                if (e.key === 'Escape') {
                    closeAllMermaidPreviews();
                } else if (isPreviewOpen && currentPreviewModal) {
                    // 处理缩放快捷键
                    const previewSvg = currentPreviewModal.querySelector('#previewSvg');
                    if (previewSvg && typeof window.updateSvgTransform === 'function') {
                        if (e.key === '+' || e.key === '=') {
                            e.preventDefault();
                            window.currentZoom *= 1.2;
                            window.updateSvgTransform();
                        } else if (e.key === '-') {
                            e.preventDefault();
                            window.currentZoom *= 0.8;
                            window.updateSvgTransform();
                        } else if (e.key === '0') {
                            e.preventDefault();
                            window.currentZoom = 1;
                            window.currentTranslate = { x: 0, y: 0 };
                            window.updateSvgTransform();
                        }
                    }
                }
            }
            
            // 打开Mermaid预览模态框
            function openMermaidPreview(mermaidElement) {
                const svg = mermaidElement.querySelector('svg');
                if (!svg) return;
                
                // 防止重复点击
                if (isPreviewOpening) {
                    return;
                }
                
                // 如果已经有预览打开，检查是否是同一个元素
                if (isPreviewOpen && currentPreviewModal) {
                    // 如果点击的是同一个图表，直接返回，不做任何操作
                    const currentSvg = currentPreviewModal.querySelector('#previewSvg');
                    if (currentSvg) {
                        // 简单比较SVG的outerHTML来判断是否是同一个图表
                        const currentSvgHTML = currentSvg.outerHTML;
                        const newSvgHTML = svg.outerHTML;
                        if (currentSvgHTML === newSvgHTML) {
                            return;
                        }
                    }
                    
                    // 如果是不同的图表，直接替换内容而不是重新创建模态框
                    replacePreviewContent(mermaidElement);
                    return;
                }
                
                // 设置预览状态
                isPreviewOpening = true;
                isPreviewOpen = true;
                
                // 创建模态框（使用唯一ID）
                const modal = document.createElement('div');
                const modalId = `mermaidPreviewModal_${Date.now()}`;
                modal.id = modalId;
                currentPreviewModal = modal;
                modal.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.8);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    z-index: 9999;
                    opacity: 0;
                    transition: opacity 0.2s ease;
                `;
                
                // 创建容器
                const container = document.createElement('div');
                container.style.cssText = `
                    position: relative;
                    width: 95vw;
                    height: 95vh;
                    max-width: none;
                    max-height: none;
                    background: var(--bg-primary);
                    border-radius: 8px;
                    border: 1px solid var(--border-color);
                    overflow: hidden;
                    display: flex;
                    flex-direction: column;
                `;
                
                // 创建头部
                const header = document.createElement('div');
                header.style.cssText = `
                    padding: 1rem;
                    background: var(--bg-secondary);
                    border-bottom: 1px solid var(--border-color);
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    flex-shrink: 0;
                `;
                
                const title = document.createElement('div');
                title.textContent = 'Mermaid 图表预览';
                title.style.cssText = `
                    font-weight: 600;
                    color: var(--text-primary);
                    font-size: 1.1rem;
                `;
                
                // 创建控制按钮组
                const controls = document.createElement('div');
                controls.style.cssText = `
                    display: flex;
                    gap: 0.5rem;
                    align-items: center;
                `;
                
                // 放大按钮
                const zoomInBtn = createControlButton('+', '放大', () => {
                    window.currentZoom *= 1.2;
                    window.updateSvgTransform();
                });
                
                // 缩小按钮
                const zoomOutBtn = createControlButton('-', '缩小', () => {
                    window.currentZoom *= 0.8;
                    window.updateSvgTransform();
                });
                
                // 重置按钮
                const resetBtn = createControlButton('重置', '重置缩放', () => {
                    window.currentZoom = 1;
                    window.currentTranslate = { x: 0, y: 0 };
                    window.updateSvgTransform();
                });
                
                // 关闭按钮
                const closeBtn = createControlButton('关闭', '关闭预览', () => {
                    closeAllMermaidPreviews();
                }, '#dc3545');
                
                controls.appendChild(zoomOutBtn);
                controls.appendChild(zoomInBtn);
                controls.appendChild(resetBtn);
                controls.appendChild(closeBtn);
                
                header.appendChild(title);
                header.appendChild(controls);
                
                // 创建内容区域
                const content = document.createElement('div');
                content.className = 'content'; // 添加类名以便后续查找
                content.style.cssText = `
                    padding: 2rem;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    flex: 1;
                    overflow: auto;
                    position: relative;
                    background: var(--bg-primary);
                    min-height: 0;
                `;
                
                // 确保预览容器继承正确的主题样式
                const currentTheme = document.documentElement.getAttribute('data-theme');
                if (currentTheme) {
                    container.setAttribute('data-theme', currentTheme);
                    modal.setAttribute('data-theme', currentTheme);
                }
                
                // 将原始SVG的父容器样式应用到预览容器
                const originalParent = svg.closest('.mermaid');
                if (originalParent) {
                    const parentStyles = window.getComputedStyle(originalParent);
                    content.style.backgroundColor = parentStyles.backgroundColor;
                    content.style.color = parentStyles.color;
                }
                
                // 重置缩放状态
                window.currentZoom = 1;
                window.currentTranslate = { x: 0, y: 0 };
                
                // 更新SVG变换函数
                window.updateSvgTransform = function() {
                    const clonedSvg = currentPreviewModal?.querySelector('#previewSvg');
                    if (clonedSvg) {
                        clonedSvg.style.transform = `translate(${window.currentTranslate.x}px, ${window.currentTranslate.y}px) scale(${window.currentZoom})`;
                        const zoomInfo = currentPreviewModal?.querySelector('#zoomInfo');
                        if (zoomInfo) {
                            zoomInfo.textContent = `${Math.round(window.currentZoom * 100)}%`;
                        }
                    }
                };
                
                // 使用提取的函数创建SVG和缩放信息
                const clonedSvg = createClonedSvg(svg);
                const zoomInfo = createZoomInfo();
                
                // 设置SVG交互
                setupSvgInteractions(clonedSvg);
                
                // 更新缩放信息显示
                zoomInfo.textContent = `${Math.round(window.currentZoom * 100)}%`;
                
                content.appendChild(clonedSvg);
                content.appendChild(zoomInfo);
                
                container.appendChild(header);
                container.appendChild(content);
                modal.appendChild(container);
                document.body.appendChild(modal);
                
                // 显示动画
                setTimeout(() => {
                    modal.style.opacity = '1';
                    // 动画完成后重置开启状态
                    setTimeout(() => {
                        isPreviewOpening = false;
                    }, 200);
                }, 10);
                
                // 点击背景关闭
                modal.addEventListener('click', (e) => {
                    if (e.target === modal) {
                        closeAllMermaidPreviews();
                    }
                });
                
                // 添加全局键盘事件监听器
                document.addEventListener('keydown', globalKeydownHandler);
            }
            
            // 创建控制按钮
            function createControlButton(text, title, onClick, bgColor = '#6c757d') {
                const btn = document.createElement('button');
                btn.textContent = text;
                btn.title = title;
                btn.style.cssText = `
                    background: ${bgColor};
                    color: white;
                    border: none;
                    border-radius: 4px;
                    padding: 0.5rem 1rem;
                    cursor: pointer;
                    font-size: 14px;
                    font-weight: 500;
                    transition: background-color 0.2s ease;
                    white-space: nowrap;
                `;
                
                btn.addEventListener('click', onClick);
                
                btn.addEventListener('mouseenter', () => {
                    btn.style.opacity = '0.8';
                });
                
                btn.addEventListener('mouseleave', () => {
                    btn.style.opacity = '1';
                });
                
                return btn;
            }
            
            // 下载Mermaid图片
            async function downloadMermaidImage(mermaidElement) {
                const svg = mermaidElement.querySelector('svg');
                if (!svg) return;
                
                try {
                    // 方法1: 直接下载SVG文件
                    const svgData = new XMLSerializer().serializeToString(svg);
                    const svgBlob = new Blob([svgData], { type: 'image/svg+xml;charset=utf-8' });
                    const url = URL.createObjectURL(svgBlob);
                    
                    const link = document.createElement('a');
                    link.download = `mermaid-diagram-${Date.now()}.svg`;
                    link.href = url;
                    link.click();
                    
                    URL.revokeObjectURL(url);
                    showToast('SVG图片下载成功！');
                    
                    // 尝试转换为PNG（如果支持的话）
                    setTimeout(() => {
                        convertSvgToPng(svg, svgData).catch(() => {
                            // PNG转换失败时的备用方案已经在convertSvgToPng中处理
                        });
                    }, 100);
                    
                } catch (error) {
                    console.error('下载失败:', error);
                    showToast('下载失败，请重试', 'error');
                }
            }
            
            // 转换SVG为PNG
            async function convertSvgToPng(svg, svgData) {
                try {
                    // 清理SVG数据，移除可能导致安全问题的内容
                    let cleanSvgData = svgData;
                    
                    // 确保SVG有正确的命名空间
                    if (!cleanSvgData.includes('xmlns="http://www.w3.org/2000/svg"')) {
                        cleanSvgData = cleanSvgData.replace('<svg', '<svg xmlns="http://www.w3.org/2000/svg"');
                    }
                    
                    // 获取SVG尺寸
                    const svgRect = svg.getBoundingClientRect();
                    const svgWidth = svgRect.width || 800;
                    const svgHeight = svgRect.height || 600;
                    
                    // 创建canvas
                    const canvas = document.createElement('canvas');
                    const ctx = canvas.getContext('2d');
                    
                    // 设置canvas尺寸
                    canvas.width = svgWidth * 2;
                    canvas.height = svgHeight * 2;
                    ctx.scale(2, 2);
                    
                    // 创建图片
                    const img = new Image();
                    img.crossOrigin = 'anonymous'; // 尝试避免跨域问题
                    
                    // 使用data URL而不是blob URL
                    const dataUrl = 'data:image/svg+xml;base64,' + btoa(unescape(encodeURIComponent(cleanSvgData)));
                    
                    img.onload = () => {
                        try {
                            // 白色背景
                            ctx.fillStyle = 'white';
                            ctx.fillRect(0, 0, svgWidth, svgHeight);
                            
                            // 绘制SVG
                            ctx.drawImage(img, 0, 0, svgWidth, svgHeight);
                            
                            // 下载PNG
                            canvas.toBlob((blob) => {
                                if (blob) {
                                    const url = URL.createObjectURL(blob);
                                    const link = document.createElement('a');
                                    link.download = `mermaid-diagram-${Date.now()}.png`;
                                    link.href = url;
                                    link.click();
                                    URL.revokeObjectURL(url);
                                    showToast('PNG图片下载成功！');
                                } else {
                                    showToast('PNG转换失败，已下载SVG格式', 'warning');
                                }
                            }, 'image/png');
                            
                        } catch (canvasError) {
                            console.warn('Canvas操作失败:', canvasError);
                            showToast('PNG转换失败，已下载SVG格式', 'warning');
                        }
                    };
                    
                    img.onerror = () => {
                        console.warn('图片加载失败，PNG转换失败');
                        showToast('PNG转换失败，已下载SVG格式', 'warning');
                    };
                    
                    img.src = dataUrl;
                    
                } catch (error) {
                    console.warn('PNG转换失败:', error);
                    showToast('PNG转换失败，已下载SVG格式', 'warning');
                }
            }
            
            // 复制Mermaid图片
            async function copyMermaidImage(mermaidElement) {
                const svg = mermaidElement.querySelector('svg');
                if (!svg) return;
                
                try {
                    const svgData = new XMLSerializer().serializeToString(svg);
                    // 直接转换为PNG并复制到剪贴板
                    await convertSvgToPngAndCopy(svg, svgData);
                } catch (error) {
                    console.error('复制失败:', error);
                    showToast('复制失败，请重试', 'error');
                }
            }
            
            // 转换SVG为PNG并复制
            async function convertSvgToPngAndCopy(svg, svgData) {
                try {
                    // 清理SVG数据
                    let cleanSvgData = svgData;
                    if (!cleanSvgData.includes('xmlns="http://www.w3.org/2000/svg"')) {
                        cleanSvgData = cleanSvgData.replace('<svg', '<svg xmlns="http://www.w3.org/2000/svg"');
                    }
                    
                    // 获取SVG尺寸
                    const svgRect = svg.getBoundingClientRect();
                    const svgWidth = svgRect.width || 800;
                    const svgHeight = svgRect.height || 600;
                    
                    // 创建canvas
                    const canvas = document.createElement('canvas');
                    const ctx = canvas.getContext('2d');
                    
                    canvas.width = svgWidth * 2;
                    canvas.height = svgHeight * 2;
                    ctx.scale(2, 2);
                    
                    // 创建图片
                    const img = new Image();
                    img.crossOrigin = 'anonymous';
                    
                    // 使用data URL
                    const dataUrl = 'data:image/svg+xml;base64,' + btoa(unescape(encodeURIComponent(cleanSvgData)));
                    
                    img.onload = () => {
                        try {
                            // 白色背景
                            ctx.fillStyle = 'white';
                            ctx.fillRect(0, 0, svgWidth, svgHeight);
                            
                            // 绘制SVG
                            ctx.drawImage(img, 0, 0, svgWidth, svgHeight);
                            
                            // 复制到剪贴板
                            canvas.toBlob(async (blob) => {
                                if (blob) {
                                    try {
                                        await navigator.clipboard.write([
                                            new ClipboardItem({ 'image/png': blob })
                                        ]);
                                        showToast('PNG图片已复制到剪贴板！');
                                    } catch (clipboardError) {
                                        console.warn('复制PNG失败:', clipboardError);
                                        showToast('图片复制失败，请重试', 'error');
                                    }
                                } else {
                                    showToast('图片转换失败，请重试', 'error');
                                }
                            }, 'image/png');
                            
                        } catch (canvasError) {
                            console.warn('Canvas操作失败:', canvasError);
                            showToast('图片复制失败，请重试', 'error');
                        }
                    };
                    
                    img.onerror = () => {
                        console.warn('图片加载失败');
                        showToast('图片复制失败，请重试', 'error');
                    };
                    
                    img.src = dataUrl;
                    
                } catch (error) {
                    console.warn('PNG转换失败:', error);
                    showToast('图片复制失败，请重试', 'error');
                }
            }
            
            // 显示提示消息
            function showToast(message, type = 'success') {
                const toast = document.createElement('div');
                toast.textContent = message;
                
                let backgroundColor;
                switch (type) {
                    case 'success':
                        backgroundColor = '#28a745';
                        break;
                    case 'error':
                        backgroundColor = '#dc3545';
                        break;
                    case 'warning':
                        backgroundColor = '#ffc107';
                        break;
                    default:
                        backgroundColor = '#28a745';
                }
                
                toast.style.cssText = `
                    position: fixed;
                    top: 20px;
                    right: 20px;
                    background: ${backgroundColor};
                    color: ${type === 'warning' ? '#212529' : 'white'};
                    padding: 0.75rem 1rem;
                    border-radius: 6px;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
                    z-index: 10000;
                    font-size: 0.9rem;
                    animation: slideInRight 0.3s ease;
                    max-width: 300px;
                    word-wrap: break-word;
                `;
                
                document.body.appendChild(toast);
                
                setTimeout(() => {
                    toast.style.animation = 'slideOutRight 0.3s ease';
                    setTimeout(() => {
                        if (document.body.contains(toast)) {
                            document.body.removeChild(toast);
                        }
                    }, 300);
                }, 3000); // 延长显示时间到3秒
            }
            
            // 添加动画样式和预览模式样式
            const style = document.createElement('style');
            style.textContent = `
                @keyframes slideInRight {
                    from { transform: translateX(100%); opacity: 0; }
                    to { transform: translateX(0); opacity: 1; }
                }
                @keyframes slideOutRight {
                    from { transform: translateX(0); opacity: 1; }
                    to { transform: translateX(100%); opacity: 0; }
                }
                
                /* 确保预览模式中的Mermaid图表样式一致 */
                #mermaidPreviewModal {
                    --preview-bg: var(--bg-primary);
                    --preview-text: var(--text-primary);
                    --preview-border: var(--border-color);
                }
                
                #mermaidPreviewModal[data-theme="dark"] {
                    --preview-bg: var(--bg-primary);
                    --preview-text: var(--text-primary);
                    --preview-border: var(--border-color);
                }
                
                #mermaidPreviewModal[data-theme="light"] {
                    --preview-bg: var(--bg-primary);
                    --preview-text: var(--text-primary);
                    --preview-border: var(--border-color);
                }
                
                #mermaidPreviewModal[data-theme="morandi"] {
                    --preview-bg: var(--bg-primary);
                    --preview-text: var(--text-primary);
                    --preview-border: var(--border-color);
                }
                
                /* 预览模式中的SVG样式继承 */
                #mermaidPreviewModal svg {
                    background: transparent !important;
                }
                
                #mermaidPreviewModal svg * {
                    font-family: inherit !important;
                }
                
                /* 确保预览容器的背景与主题一致 */
                #mermaidPreviewModal .content {
                    background: var(--preview-bg) !important;
                }
            `;
            document.head.appendChild(style);
            
            
            
            // 页面加载后增强Mermaid图表
            setTimeout(() => {
                enhanceMermaidDiagrams();
            }, 1000);
            
            // 监听内容变化，自动增强新的Mermaid图表
            const mermaidObserver = new MutationObserver((mutations) => {
                let shouldEnhance = false;
                mutations.forEach((mutation) => {
                    mutation.addedNodes.forEach((node) => {
                        if (node.nodeType === Node.ELEMENT_NODE) {
                            if (node.classList && node.classList.contains('mermaid')) {
                                shouldEnhance = true;
                            } else if (node.querySelectorAll) {
                                const mermaidElements = node.querySelectorAll('.mermaid');
                                if (mermaidElements.length > 0) {
                                    shouldEnhance = true;
                                }
                            }
                        }
                    });
                });
                
                if (shouldEnhance) {
                    setTimeout(() => {
                        enhanceMermaidDiagrams();
                    }, 100);
                }
            });
            
            mermaidObserver.observe(document.body, {
                childList: true,
                subtree: true
            });

            // AI助手功能
            let isAiAssistantOpen = false;
            let isAiLoading = false;
            let isSuggestionsCollapsed = false;
            let hasUserSentMessage = false;
            let chatHistory = []; // 存储聊天历史
            let selectedContextFiles = []; // 存储用户选择的上下文文件

            // 切换AI助手面板
            function toggleAiAssistant() {
                const trigger = document.getElementById('aiAssistantTrigger');
                const panel = document.getElementById('aiAssistantPanel');
                
                isAiAssistantOpen = !isAiAssistantOpen;
                
                if (isAiAssistantOpen) {
                    trigger.classList.add('hidden');
                    panel.classList.add('show');
                    // 聚焦到输入框
                    setTimeout(() => {
                        document.getElementById('aiInput').focus();
                    }, 300);
                } else {
                    trigger.classList.remove('hidden');
                    panel.classList.remove('show');
                }
            }

            // 清空聊天历史
            function clearChatHistory() {
                if (confirm('确定要清空所有聊天记录吗？')) {
                    // 清空聊天历史数组
                    chatHistory = [];
                    
                    // 清空聊天界面，但保留欢迎消息
                    const messagesContainer = document.getElementById('aiChatMessages');
                    messagesContainer.innerHTML = `
                        <div class="ai-message ai-message-assistant">
                            <div class="ai-message-content">
                                <p>👋 你好！我是<strong>Litho Advisor</strong>，你的文档助手，可以帮你理解和分析文档内容。有什么问题尽管问我！</p>
                            </div>
                        </div>
                    `;
                    
                    // 重置状态
                    hasUserSentMessage = false;
                    
                    // 如果推荐区域是折叠的，展开它
                    if (isSuggestionsCollapsed) {
                        toggleSuggestions();
                    }
                    
                    // 恢复初始推荐问题
                    const suggestionsContainer = document.querySelector('.ai-suggestions-list');
                    suggestionsContainer.innerHTML = `
                        <button class="ai-suggestion-item" onclick="sendSuggestion('这个项目的主要功能是什么？')">
                            这个项目的主要功能是什么？
                        </button>
                        <button class="ai-suggestion-item" onclick="sendSuggestion('如何快速上手这个项目？')">
                            如何快速上手这个项目？
                        </button>
                        <button class="ai-suggestion-item" onclick="sendSuggestion('项目的技术架构是怎样的？')">
                            项目的技术架构是怎样的？
                        </button>
                    `;
                }
            }

            // 切换推荐区域折叠状态
            function toggleSuggestions() {
                const suggestions = document.getElementById('aiSuggestions');
                const toggle = document.getElementById('aiSuggestionsToggle');
                
                isSuggestionsCollapsed = !isSuggestionsCollapsed;
                
                if (isSuggestionsCollapsed) {
                    suggestions.classList.add('collapsed');
                } else {
                    suggestions.classList.remove('collapsed');
                }
            }

            // 自动折叠推荐区域（用户发送消息后）
            function autoCollapseSuggestions() {
                if (!hasUserSentMessage && !isSuggestionsCollapsed) {
                    hasUserSentMessage = true;
                    setTimeout(() => {
                        toggleSuggestions();
                    }, 1000); // 延迟1秒后自动折叠
                }
            }

            // 发送建议问题
            function sendSuggestion(question) {
                const input = document.getElementById('aiInput');
                input.value = question;
                updateSendButton();
                sendMessage();
            }

            // 获取当前文档内容作为上下文
            function getCurrentDocumentContext() {
                const contentContainer = document.querySelector('.markdown-content');
                if (contentContainer) {
                    // 提取文本内容，去除HTML标签
                    const text = contentContainer.textContent || contentContainer.innerText || '';
                    // 限制上下文长度，避免请求过大
                    return text.substring(0, 3000);
                }
                return null;
            }

            // 获取所有选中的上下文文件内容
            async function getSelectedContextFilesContent() {
                const contextContents = [];
                
                // 添加用户选择的上下文文件
                for (const file of selectedContextFiles) {
                    // 跳过当前文件（当前文件会单独处理）
                    if (currentFile && file.path === currentFile) {
                        continue;
                    }
                    
                    try {
                        const response = await fetch(`/api/file?file=${encodeURIComponent(file.path)}`);
                        if (response.ok) {
                            const data = await response.json();
                            contextContents.push({
                                name: file.name,
                                content: data.content.substring(0, 3000)
                            });
                        }
                    } catch (error) {
                        console.warn(`无法加载文件 ${file.name}:`, error);
                    }
                }
                
                // 添加当前文档（如果存在且不重复）
                const currentContent = getCurrentDocumentContext();
                const currentFileName = currentFile ? currentFile.split('/').pop() : null;
                
                if (currentContent && currentFileName) {
                    contextContents.push({
                        name: currentFileName,
                        content: currentContent
                    });
                }
                
                // 格式化上下文内容
                if (contextContents.length > 0) {
                    let contextText = "用户选择的上下文文件内容：\n";
                    contextContents.forEach((item, index) => {
                        contextText += `\n[${index + 1}] 文件: ${item.name}\n${item.content}\n`;
                    });
                    return contextText;
                }
                
                return null;
            }

            // 显示文档选择面板
            function showDocumentSelector() {
                // 创建模态框
                const modal = document.createElement('div');
                modal.id = 'documentSelectorModal';
                modal.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.5);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    z-index: 10000;
                `;
                
                const container = document.createElement('div');
                container.style.cssText = `
                    background: var(--bg-primary);
                    border-radius: 12px;
                    width: 80%;
                    max-width: 600px;
                    max-height: 80vh;
                    overflow: hidden;
                    display: flex;
                    flex-direction: column;
                    border: 1px solid var(--border-color);
                `;
                
                const header = document.createElement('div');
                header.style.cssText = `
                    padding: 1rem 1.5rem;
                    background: var(--bg-secondary);
                    border-bottom: 1px solid var(--border-color);
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                `;
                
                const title = document.createElement('h3');
                title.textContent = '选择文档添加到上下文';
                title.style.cssText = `
                    margin: 0;
                    color: var(--text-primary);
                    font-size: 1.2rem;
                `;
                
                const closeBtn = document.createElement('button');
                closeBtn.innerHTML = '&times;';
                closeBtn.style.cssText = `
                    background: none;
                    border: none;
                    font-size: 1.5rem;
                    cursor: pointer;
                    color: var(--text-secondary);
                    padding: 0;
                    width: 30px;
                    height: 30px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                `;
                closeBtn.onclick = () => document.body.removeChild(modal);
                
                const content = document.createElement('div');
                content.style.cssText = `
                    padding: 1rem;
                    overflow-y: auto;
                    flex: 1;
                `;
                
                // 创建文档列表
                const fileList = document.createElement('div');
                fileList.id = 'documentList';
                fileList.style.cssText = `
                    max-height: 60vh;
                    overflow-y: auto;
                `;
                
                // 递归渲染文档树
                function renderFileNode(node, container, level = 0) {
                    const itemDiv = document.createElement('div');
                    itemDiv.style.cssText = `
                        display: flex;
                        align-items: center;
                        padding: 0.5rem;
                        margin: 0.25rem 0;
                        border-radius: 6px;
                        cursor: pointer;
                        transition: background 0.2s;
                    `;
                    
                    // 为文件夹和文件设置不同的点击行为
                    if (node.is_file) {
                        itemDiv.onmouseenter = () => {
                            itemDiv.style.background = 'var(--bg-secondary)';
                        };
                        
                        itemDiv.onmouseleave = () => {
                            itemDiv.style.background = 'transparent';
                        };
                    } else {
                        // 文件夹不响应悬停效果
                        itemDiv.style.cursor = 'default';
                    }
                    
                    const checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkbox.style.cssText = `
                        margin-right: 0.5rem;
                    `;
                    
                    // 设置数据属性以便后续查找
                    checkbox.setAttribute('data-path', node.path);
                    
                    // 检查文件是否已被选中
                    const isSelected = selectedContextFiles.some(f => f.path === node.path);
                    checkbox.checked = isSelected;
                    
                    // 默认选中架构概览文档
                    if (node.name === '2、架构概览.md') {
                        checkbox.checked = true;
                        // 如果还没有添加到选中列表，则添加
                        if (!isSelected) {
                            selectedContextFiles.push({
                                name: node.name,
                                path: node.path
                            });
                        }
                    }
                    
                    // 当前文件默认选中且不可取消
                    const currentFileName = currentFile ? currentFile.split('/').pop() : null;
                    if (node.is_file && currentFileName && node.name === currentFileName) {
                        checkbox.checked = true;
                        checkbox.disabled = true; // 当前文件不可取消选择
                    }
                    
                    // 文件夹不能被选择
                    if (!node.is_file) {
                        checkbox.style.visibility = 'hidden'; // 隐藏文件夹的复选框
                        checkbox.disabled = true;
                    }
                    
                    checkbox.onchange = (e) => {
                        if (e.target.checked) {
                            // 添加到选中列表
                            selectedContextFiles.push({
                                name: node.name,
                                path: node.path
                            });
                        } else {
                            // 从选中列表移除
                            selectedContextFiles = selectedContextFiles.filter(f => f.path !== node.path);
                        }
                        // 更新上下文标签显示
                        updateContextTags();
                    };
                    
                    const icon = document.createElement('span');
                    icon.style.cssText = `
                        margin-right: 0.5rem;
                        width: 20px;
                        text-align: center;
                    `;
                    
                    if (node.is_file) {
                        icon.textContent = '📄';
                    } else {
                        icon.textContent = '📁';
                    }
                    
                    const nameSpan = document.createElement('span');
                    nameSpan.textContent = node.name;
                    nameSpan.style.cssText = `
                        flex: 1;
                        color: var(--text-primary);
                    `;
                    
                    // 添加缩进
                    itemDiv.style.paddingLeft = `${0.5 + level * 1}rem`;
                    
                    // 为文件添加点击整个行选择的功能
                    if (node.is_file) {
                        itemDiv.onclick = (e) => {
                            // 如果点击的是复选框本身，不处理（避免重复触发）
                            if (e.target === checkbox) return;
                            
                            // 如果是当前文件，不允许取消选择
                            const currentFileName = currentFile ? currentFile.split('/').pop() : null;
                            if (currentFileName && node.name === currentFileName) return;
                            
                            // 切换复选框状态
                            checkbox.checked = !checkbox.checked;
                            checkbox.onchange({ target: checkbox });
                        };
                    }
                    
                    itemDiv.appendChild(checkbox);
                    itemDiv.appendChild(icon);
                    itemDiv.appendChild(nameSpan);
                    
                    container.appendChild(itemDiv);
                    
                    // 如果是文件夹，渲染子节点
                    if (!node.is_file && node.children && node.children.length > 0) {
                        node.children.forEach(child => {
                            renderFileNode(child, container, level + 1);
                        });
                    }
                }
                
                // 渲染整个文档树（跳过根节点）
                if (originalTreeData && originalTreeData.children) {
                    originalTreeData.children.forEach(child => {
                        renderFileNode(child, fileList, 0);
                    });
                }
                
                content.appendChild(fileList);
                
                const footer = document.createElement('div');
                footer.style.cssText = `
                    padding: 1rem;
                    background: var(--bg-secondary);
                    border-top: 1px solid var(--border-color);
                    display: flex;
                    justify-content: flex-end;
                    gap: 0.5rem;
                `;
                
                const cancelBtn = document.createElement('button');
                cancelBtn.textContent = '取消';
                cancelBtn.style.cssText = `
                    padding: 0.5rem 1rem;
                    background: var(--bg-tertiary);
                    border: 1px solid var(--border-color);
                    border-radius: 6px;
                    color: var(--text-primary);
                    cursor: pointer;
                `;
                cancelBtn.onclick = () => document.body.removeChild(modal);
                
                const confirmBtn = document.createElement('button');
                confirmBtn.textContent = '确认选择';
                confirmBtn.style.cssText = `
                    padding: 0.5rem 1rem;
                    background: var(--accent-color);
                    border: 1px solid var(--accent-color);
                    border-radius: 6px;
                    color: white;
                    cursor: pointer;
                `;
                confirmBtn.onclick = () => {
                    // 更新上下文标签显示
                    updateContextTags();
                    document.body.removeChild(modal);
                };
                
                footer.appendChild(cancelBtn);
                footer.appendChild(confirmBtn);
                
                header.appendChild(title);
                header.appendChild(closeBtn);
                
                container.appendChild(header);
                container.appendChild(content);
                container.appendChild(footer);
                
                modal.appendChild(container);
                document.body.appendChild(modal);
                
                // 点击背景关闭
                modal.onclick = (e) => {
                    if (e.target === modal) {
                        document.body.removeChild(modal);
                    }
                };
            }

            // 更新上下文标签显示
            function updateContextTags() {
                const tagsContainer = document.getElementById('contextTagsContainer');
                if (!tagsContainer) return;
                
                // 清空现有标签
                tagsContainer.innerHTML = '';
                
                // 获取当前文件名
                const currentFileName = currentFile ? currentFile.split('/').pop() : null;
                
                // 为每个选中的文件创建标签
                selectedContextFiles.forEach((file, index) => {
                    const tag = document.createElement('div');
                    tag.style.cssText = `
                        display: inline-flex;
                        align-items: center;
                        background: var(--accent-color);
                        color: white;
                        border-radius: 12px;
                        padding: 0.25rem 0.75rem;
                        margin-right: 0.5rem;
                        margin-bottom: 0.5rem;
                        font-size: 0.85rem;
                    `;
                    
                    const nameSpan = document.createElement('span');
                    nameSpan.textContent = file.name;
                    nameSpan.style.cssText = `
                        margin-right: 0.5rem;
                        max-width: 150px;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                    `;
                    
                    // 如果是当前文件，不显示删除按钮
                    if (currentFileName && file.name === currentFileName) {
                        tag.style.background = 'var(--text-secondary)'; // 不同的颜色表示不可删除
                        tag.appendChild(nameSpan);
                    } else {
                        // 其他文件显示删除按钮
                        const removeBtn = document.createElement('button');
                        removeBtn.innerHTML = '&times;';
                        removeBtn.style.cssText = `
                            background: none;
                            border: none;
                            color: white;
                            cursor: pointer;
                            font-size: 1.2rem;
                            line-height: 1;
                            padding: 0;
                            width: 16px;
                            height: 16px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                        `;
                        
                        removeBtn.onclick = () => {
                            // 从选中列表中移除
                            selectedContextFiles = selectedContextFiles.filter(f => f.path !== file.path);
                            // 更新标签显示
                            updateContextTags();
                            // 更新文档选择器中的复选框状态（如果打开的话）
                            const checkbox = document.querySelector(`input[type="checkbox"][data-path="${file.path}"]`);
                            if (checkbox) {
                                checkbox.checked = false;
                            }
                        };
                        
                        tag.appendChild(nameSpan);
                        tag.appendChild(removeBtn);
                    }
                    
                    tagsContainer.appendChild(tag);
                });
            }

            // 初始化默认上下文
            function initializeDefaultContext() {
                // 默认添加架构概览文档
                selectedContextFiles = [{
                    name: '2、架构概览.md',
                    path: '2、架构概览.md'
                }];
                
                // 如果有当前文件，也添加到上下文
                if (currentFile) {
                    const currentFileName = currentFile.split('/').pop();
                    selectedContextFiles.push({
                        name: currentFileName,
                        path: currentFile
                    });
                }
                
                // 更新上下文标签显示
                updateContextTags();
            }

            // 处理输入框键盘事件
            function handleAiInputKeydown(event) {
                // 检查是否正在使用输入法
                if (event.isComposing || event.keyCode === 229) {
                    // 如果正在使用输入法，不处理 Enter 键
                    return;
                }
                
                // 检查是否输入了@符号
                if (event.key === '@') {
                    // 延迟显示文档选择面板，确保@符号已经输入
                    setTimeout(() => {
                        showDocumentSelector();
                    }, 10);
                    return;
                }
                
                if (event.key === 'Enter' && !event.shiftKey) {
                    event.preventDefault();
                    sendMessage();
                } else if (event.key === 'Escape') {
                    toggleAiAssistant();
                }
            }

            // 自动调整文本框高度
            function adjustTextareaHeight(textarea) {
                textarea.style.height = 'auto';
                textarea.style.height = Math.min(textarea.scrollHeight, 100) + 'px';
                updateSendButton();
            }

            // 更新发送按钮状态
            function updateSendButton() {
                const input = document.getElementById('aiInput');
                const sendBtn = document.getElementById('aiSendBtn');
                const hasText = input.value.trim().length > 0;
                
                sendBtn.disabled = !hasText || isAiLoading;
            }

            // 发送消息（流式版本）
            async function sendMessage() {
                const input = document.getElementById('aiInput');
                const message = input.value.trim();
                
                if (!message || isAiLoading) return;
                
                // 清空输入框（但保留上下文指示器）
                input.value = '';
                adjustTextareaHeight(input);
                updateSendButton();
                
                // 添加用户消息到界面
                addMessage(message, 'user');
                
                // 添加用户消息到历史记录
                chatHistory.push({
                    role: 'user',
                    content: message
                });
                
                // 自动折叠推荐区域（首次发送消息后）
                autoCollapseSuggestions();
                
                // 创建AI消息容器，用于流式显示
                const aiMessageElement = addStreamingMessage();
                isAiLoading = true;
                updateSendButton();
                
                try {
                    // 获取选中的上下文文件内容
                    const context = await getSelectedContextFilesContent();
                    
                    // 调用流式AI API
                    const response = await fetch('/api/chat', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'text/event-stream',
                        },
                        body: JSON.stringify({
                            message: message,
                            context: context,
                            history: chatHistory.slice(0, -1) // 发送除了当前消息之外的历史记录
                        })
                    });
                    
                    if (!response.ok) {
                        throw new Error(`HTTP ${response.status}: ${response.statusText}`);
                    }
                    
                    // 处理流式响应
                    await handleStreamResponse(response, aiMessageElement);
                    
                } catch (error) {
                    console.error('AI请求失败:', error);
                    
                    // 移除流式消息容器
                    if (aiMessageElement && aiMessageElement.parentNode) {
                        aiMessageElement.parentNode.removeChild(aiMessageElement);
                    }
                    
                    // 显示错误消息
                    addMessage('抱歉，我现在无法回答您的问题。请稍后再试。', 'assistant', true);
                } finally {
                    isAiLoading = false;
                    updateSendButton();
                }
            }

            // 创建流式消息容器
            function addStreamingMessage() {
                const messagesContainer = document.getElementById('aiChatMessages');
                
                const messageDiv = document.createElement('div');
                messageDiv.className = 'ai-message ai-message-assistant';
                
                const contentDiv = document.createElement('div');
                contentDiv.className = 'ai-message-content';
                contentDiv.innerHTML = '<span class="ai-cursor">|</span>'; // 添加光标效果
                
                messageDiv.appendChild(contentDiv);
                messagesContainer.appendChild(messageDiv);
                
                // 滚动到底部
                messagesContainer.scrollTop = messagesContainer.scrollHeight;
                
                return messageDiv;
            }

            // 处理流式响应
            async function handleStreamResponse(response, messageElement) {
                const reader = response.body.getReader();
                const decoder = new TextDecoder();
                let fullContent = '';
                const contentDiv = messageElement.querySelector('.ai-message-content');
                
                try {
                    while (true) {
                        const { done, value } = await reader.read();
                        
                        if (done) break;
                        
                        const chunk = decoder.decode(value, { stream: true });
                        const lines = chunk.split('\n');
                        
                        for (const line of lines) {
                            if (line.startsWith('data: ')) {
                                const data = line.slice(6);
                                
                                if (data === '[DONE]') {
                                    // 移除光标
                                    contentDiv.innerHTML = renderSimpleMarkdown(fullContent);
                                    return;
                                }
                                
                                try {
                                    const event = JSON.parse(data);
                                    
                                    if (event.event_type === 'content' && event.content) {
                                        fullContent += event.content;
                                        // 更新显示内容，保持光标
                                        contentDiv.innerHTML = renderSimpleMarkdown(fullContent) + '<span class="ai-cursor">|</span>';
                                        
                                        // 滚动到底部
                                        const messagesContainer = document.getElementById('aiChatMessages');
                                        messagesContainer.scrollTop = messagesContainer.scrollHeight;
                                    } else if (event.event_type === 'finish') {
                                        // 移除光标
                                        contentDiv.innerHTML = renderSimpleMarkdown(fullContent);
                                        
                                        // 添加AI回复到历史记录
                                        chatHistory.push({
                                            role: 'assistant',
                                            content: fullContent
                                        });
                                        
                                        // 更新建议问题
                                        if (event.suggestions) {
                                            updateSuggestions(event.suggestions);
                                        }
                                        return;
                                    } else if (event.event_type === 'error') {
                                        throw new Error(event.content || '流式响应错误');
                                    }
                                } catch (parseError) {
                                    console.warn('解析SSE数据失败:', parseError, 'data:', data);
                                }
                            }
                        }
                    }
                } catch (error) {
                    console.error('流式响应处理错误:', error);
                    // 移除光标，显示错误
                    contentDiv.innerHTML = '抱歉，响应过程中出现错误。';
                    throw error;
                }
            }

            // 获取当前文档内容作为上下文
            function getCurrentDocumentContext() {
                const contentContainer = document.querySelector('.markdown-content');
                if (contentContainer) {
                    // 提取文本内容，去除HTML标签
                    const text = contentContainer.textContent || contentContainer.innerText || '';
                    // 限制上下文长度，避免请求过大
                    return text.substring(0, 3000);
                }
                return null;
            }

            // 添加消息到聊天区域
            function addMessage(content, type, isError = false) {
                const messagesContainer = document.getElementById('aiChatMessages');
                
                const messageDiv = document.createElement('div');
                messageDiv.className = `ai-message ai-message-${type}`;
                
                const contentDiv = document.createElement('div');
                contentDiv.className = 'ai-message-content';
                
                if (type === 'assistant' && !isError) {
                    // 对AI回复进行简单的代码渲染
                    contentDiv.innerHTML = renderSimpleMarkdown(content);
                } else {
                    contentDiv.textContent = content;
                }
                
                if (isError) {
                    contentDiv.style.color = '#dc3545';
                }
                
                messageDiv.appendChild(contentDiv);
                messagesContainer.appendChild(messageDiv);
                
                // 滚动到底部
                messagesContainer.scrollTop = messagesContainer.scrollHeight;
                
                return messageDiv;
            }

            // 添加加载消息
            function addLoadingMessage() {
                const messagesContainer = document.getElementById('aiChatMessages');
                
                const messageDiv = document.createElement('div');
                messageDiv.className = 'ai-message ai-message-loading';
                
                const contentDiv = document.createElement('div');
                contentDiv.className = 'ai-message-content';
                contentDiv.innerHTML = `
                    <span>AI正在思考</span>
                    <div class="ai-typing-indicator">
                        <div class="ai-typing-dot"></div>
                        <div class="ai-typing-dot"></div>
                        <div class="ai-typing-dot"></div>
                    </div>
                `;
                
                messageDiv.appendChild(contentDiv);
                messagesContainer.appendChild(messageDiv);
                
                // 滚动到底部
                messagesContainer.scrollTop = messagesContainer.scrollHeight;
                
                return messageDiv;
            }

            // 移除加载消息
            function removeLoadingMessage(loadingElement) {
                if (loadingElement && loadingElement.parentNode) {
                    loadingElement.parentNode.removeChild(loadingElement);
                }
            }

            // 简单的代码渲染
            function renderSimpleMarkdown(text) {
                // 先处理 mermaid 代码块（在普通代码块之前）
                const mermaidBlocks = [];
                const mermaidPlaceholders = [];
                
                text = text.replace(/```mermaid\n([\s\S]*?)\n```/g, (match, mermaidCode) => {
                    const mermaidId = `mermaid-ai-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
                    const placeholder = `__MERMAID_PLACEHOLDER_${mermaidId}__`;
                    mermaidBlocks.push({ id: mermaidId, code: mermaidCode.trim() });
                    mermaidPlaceholders.push({ placeholder, id: mermaidId, code: mermaidCode.trim() });
                    return placeholder;
                });

                // 处理普通代码块（排除已处理的 mermaid）
                text = text.replace(/```(\w+)?\n([\s\S]*?)\n```/g, (match, lang, code) => {
                    return `<pre><code class="language-${lang || ''}">${code}</code></pre>`;
                });

                // 处理其他 markdown 语法（但不处理换行符）
                text = text
                    .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
                    .replace(/\*(.*?)\*/g, '<em>$1</em>')
                    .replace(/`(.*?)`/g, '<code>$1</code>');

                // 将 mermaid 占位符替换为实际的 div 元素
                mermaidPlaceholders.forEach(item => {
                    text = text.replace(item.placeholder, `<div class="mermaid" id="${item.id}">${item.code}</div>`);
                });

                // 最后处理换行符（在 mermaid 处理之后）
                text = text.replace(/\n/g, '<br>');

                // 异步渲染 mermaid 图表
                if (mermaidBlocks.length > 0) {
                    setTimeout(() => {
                        mermaidBlocks.forEach(block => {
                            const element = document.getElementById(block.id);
                            if (element && typeof mermaid !== 'undefined') {
                                try {
                                    console.log('渲染AI消息中的Mermaid图表:', block.id, '代码:', block.code);
                                    // 确保元素内容是纯文本，没有HTML标签
                                    element.textContent = block.code;
                                    
                                    // 使用 mermaid.run() 渲染图表
                                    mermaid.run(undefined, `#${block.id}`).then(() => {
                                        console.log('Mermaid图表渲染成功:', block.id);
                                        // 渲染完成后增强图表
                                        setTimeout(() => {
                                            enhanceMermaidDiagrams();
                                        }, 100);
                                    }).catch(error => {
                                        console.warn('AI消息中的Mermaid图表渲染失败:', error);
                                        element.innerHTML = `
                                            <div style="border: 1px solid #dc3545; border-radius: 4px; padding: 1rem; background: #f8d7da; color: #721c24;">
                                                <strong>Mermaid 图表渲染失败</strong>
                                                <pre style="margin-top: 0.5rem; background: #fff; padding: 0.5rem; border-radius: 4px; overflow-x: auto;"><code>${block.code}</code></pre>
                                            </div>
                                        `;
                                    });
                                } catch (error) {
                                    console.warn('AI消息中的Mermaid图表渲染失败:', error);
                                    element.innerHTML = `
                                        <div style="border: 1px solid #dc3545; border-radius: 4px; padding: 1rem; background: #f8d7da; color: #721c24;">
                                            <strong>Mermaid 图表渲染失败</strong>
                                            <pre style="margin-top: 0.5rem; background: #fff; padding: 0.5rem; border-radius: 4px; overflow-x: auto;"><code>${block.code}</code></pre>
                                        </div>
                                    `;
                                }
                            }
                        });
                    }, 100);
                }

                return text;
            }

            // 更新建议问题
            function updateSuggestions(suggestions) {
                const suggestionsContainer = document.querySelector('.ai-suggestions-list');
                
                if (!suggestions || suggestions.length === 0) {
                    return;
                }
                
                // 清空现有建议
                suggestionsContainer.innerHTML = '';
                
                // 添加新建议
                suggestions.forEach(suggestion => {
                    const button = document.createElement('button');
                    button.className = 'ai-suggestion-item';
                    button.textContent = suggestion;
                    button.onclick = () => sendSuggestion(suggestion);
                    suggestionsContainer.appendChild(button);
                });
                
                // 如果推荐区域是折叠的，可以选择性地展开（这里我们保持折叠状态，让用户手动点击展开）
                // 这样可以节省空间，同时用户可以根据需要查看新的建议
            }

            // 监听输入框变化
            document.addEventListener('DOMContentLoaded', () => {
                const input = document.getElementById('aiInput');
                if (input) {
                    input.addEventListener('input', () => {
                        adjustTextareaHeight(input);
                        updateSendButton();
                    });
                }
                
                // 初始化默认选中的上下文文件（架构概览文档）
                initializeDefaultContext();
            });

            // 初始化默认上下文
            function initializeDefaultContext() {
                // 默认添加架构概览文档
                selectedContextFiles = [{
                    name: '2、架构概览.md',
                    path: '2、架构概览.md'
                }];
                
                // 更新上下文标签显示
                updateContextTags();
            }

            // 点击页面其他地方时关闭AI助手（可选）
            document.addEventListener('click', (event) => {
                const panel = document.getElementById('aiAssistantPanel');
                const trigger = document.getElementById('aiAssistantTrigger');
                
                if (isAiAssistantOpen && 
                    !panel.contains(event.target) && 
                    !trigger.contains(event.target)) {
                    // 可以选择是否启用点击外部关闭功能
                    // toggleAiAssistant();
                }
            });
        </script>
    </body>
</html>
