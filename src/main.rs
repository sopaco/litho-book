mod cli;
mod error;
mod filesystem;
mod server;

use clap::Parser;
use tracing::{error, info, warn};
use tracing_subscriber::{layer::SubscriberExt, util::SubscriberInitExt};

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    // Parse command line arguments
    let args = cli::Args::parse();

    // Initialize logging
    init_logging(args.verbose);

    // Print banner
    print_banner();

    // Validate arguments
    if let Err(e) = args.validate() {
        error!("参数验证失败: {}", e);
        std::process::exit(1);
    }

    info!("正在扫描文档目录: {}", args.docs_dir.display());

    // Build document tree
    let doc_tree = match filesystem::DocumentTree::new(&args.docs_dir) {
        Ok(tree) => {
            let stats = tree.get_stats();
            info!(
                "成功扫描文档目录: {} 个文件, {} 个目录, 总大小: {}",
                stats.total_files,
                stats.total_dirs,
                format_bytes(stats.total_size)
            );

            if stats.total_files == 0 {
                warn!("未找到任何 Markdown 文件，请检查目录是否包含 .md 文件");
            }

            tree
        }
        Err(e) => {
            error!("扫描文档目录失败: {}", e);
            std::process::exit(1);
        }
    };

    // Create router
    let docs_path = args.docs_dir.display().to_string().replace('\\', "/");
    let app = server::create_router(doc_tree, docs_path, args.language());

    // Start server
    let bind_address = args.bind_address();
    let listener = match tokio::net::TcpListener::bind(&bind_address).await {
        Ok(listener) => {
            info!("服务器绑定成功: {}", bind_address);
            listener
        }
        Err(e) => {
            error!("无法绑定到地址 {}: {}", bind_address, e);
            std::process::exit(1);
        }
    };

    let server_url = args.server_url();

    info!("🚀 Litho Book 服务器启动成功!");
    info!("📖 访问地址: {}", server_url);
    info!("📁 文档目录: {}", args.docs_dir.display());
    info!("⏹️  按 Ctrl+C 停止服务器");

    // Auto-open browser
    if args.open {
        info!("正在打开浏览器...");
        if let Err(e) = open_browser(&server_url) {
            warn!("无法自动打开浏览器: {}", e);
            info!("请手动访问: {}", server_url);
        }
    }

    // Start server
    if let Err(e) = axum::serve(listener, app).await {
        error!("服务器运行错误: {}", e);
        std::process::exit(1);
    }

    Ok(())
}

/// Initialize logging based on verbosity level
fn init_logging(verbose: bool) {
    let filter = if verbose {
        tracing_subscriber::filter::LevelFilter::DEBUG
    } else {
        tracing_subscriber::filter::LevelFilter::INFO
    };

    tracing_subscriber::registry()
        .with(
            tracing_subscriber::fmt::layer()
                .with_target(false)
                .with_thread_ids(false)
                .with_thread_names(false)
                .with_file(false)
                .with_line_number(false),
        )
        .with(filter)
        .init();
}

/// Print application banner
fn print_banner() {
    println!();
    println!("📚 Litho Book - Documentation Reader");
    println!("   Version: {}", env!("CARGO_PKG_VERSION"));
    println!("   A web-based reader for litho-generated documentation");
    println!();
}

/// Open browser automatically
fn open_browser(url: &str) -> anyhow::Result<()> {
    #[cfg(target_os = "windows")]
    {
        std::process::Command::new("cmd")
            .args(["/c", "start", "", url])
            .spawn()?;
    }

    #[cfg(target_os = "macos")]
    {
        std::process::Command::new("open").arg(url).spawn()?;
    }

    #[cfg(target_os = "linux")]
    {
        // Try different browsers in order of preference
        let browsers = ["xdg-open", "firefox", "chromium", "google-chrome"];

        for browser in &browsers {
            if std::process::Command::new(browser).arg(url).spawn().is_ok() {
                return Ok(());
            }
        }

        anyhow::bail!("No suitable browser found");
    }

    #[cfg(not(any(target_os = "windows", target_os = "macos", target_os = "linux")))]
    {
        anyhow::bail!("Automatic browser opening not supported on this platform");
    }

    Ok(())
}

/// Format bytes into human-readable format
fn format_bytes(bytes: u64) -> String {
    const UNITS: &[&str] = &["B", "KB", "MB", "GB", "TB"];

    if bytes == 0 {
        return "0 B".to_string();
    }

    let mut size = bytes as f64;
    let mut unit_index = 0;

    while size >= 1024.0 && unit_index < UNITS.len() - 1 {
        size /= 1024.0;
        unit_index += 1;
    }

    if unit_index == 0 {
        format!("{} {}", bytes, UNITS[unit_index])
    } else {
        format!("{:.1} {}", size, UNITS[unit_index])
    }
}
