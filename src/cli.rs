use clap::Parser;
use std::path::PathBuf;

#[derive(Parser, Debug)]
#[command(name = "litho-book")]
#[command(about = "A web-based reader for litho-generated documentation")]
#[command(version)]
pub struct Args {
    /// Path to the markdown documentation directory
    #[arg(short, long, value_name = "DIR")]
    pub docs_dir: PathBuf,
    
    /// Port to serve the web interface on
    #[arg(short, long, default_value = "3000", value_name = "PORT")]
    pub port: u16,
    
    /// Host to bind the server to
    #[arg(long, default_value = "127.0.0.1", value_name = "HOST")]
    pub host: String,
    
    /// Open browser automatically after starting the server
    #[arg(short, long)]
    pub open: bool,
    
    /// Enable verbose logging
    #[arg(short, long)]
    pub verbose: bool,
}

impl Args {
    /// Validate the command line arguments
    pub fn validate(&self) -> anyhow::Result<()> {
        if !self.docs_dir.exists() {
            anyhow::bail!(
                "Documentation directory does not exist: {}",
                self.docs_dir.display()
            );
        }
        
        if !self.docs_dir.is_dir() {
            anyhow::bail!(
                "Path is not a directory: {}",
                self.docs_dir.display()
            );
        }
        
        // Check if port is available
        if self.port < 1024 && !is_privileged() {
            anyhow::bail!(
                "Port {} requires administrator privileges. Please use a port >= 1024 or run as administrator.",
                self.port
            );
        }
        
        Ok(())
    }
    
    /// Get the server URL
    pub fn server_url(&self) -> String {
        format!("http://{}:{}", self.host, self.port)
    }
    
    /// Get the bind address
    pub fn bind_address(&self) -> String {
        format!("{}:{}", self.host, self.port)
    }
}

/// Check if the current process has elevated privileges
fn is_privileged() -> bool {
    #[cfg(unix)]
    {
        unsafe { libc::geteuid() == 0 }
    }
    
    #[cfg(windows)]
    {
        // On Windows, we'll just return true for simplicity
        // In a real implementation, you'd check for admin privileges
        true
    }
    
    #[cfg(not(any(unix, windows)))]
    {
        false
    }
}