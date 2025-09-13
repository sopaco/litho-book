use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::{Path, PathBuf};
use tracing::{debug, warn};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FileNode {
    pub name: String,
    pub path: String,
    pub is_file: bool,
    pub children: Vec<FileNode>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub size: Option<u64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub modified: Option<String>,
}

#[derive(Debug, Clone)]
pub struct DocumentTree {
    pub root: FileNode,
    pub file_map: HashMap<String, PathBuf>,
    pub stats: TreeStats,
}

#[derive(Debug, Clone)]
pub struct TreeStats {
    pub total_files: usize,
    pub total_dirs: usize,
    pub total_size: u64,
}

impl DocumentTree {
    /// Create a new document tree from the given directory
    pub fn new(docs_dir: &Path) -> anyhow::Result<Self> {
        let mut file_map = HashMap::new();
        let mut stats = TreeStats {
            total_files: 0,
            total_dirs: 0,
            total_size: 0,
        };
        
        debug!("Building document tree from: {}", docs_dir.display());
        
        // Create a virtual root that contains the children of the actual directory
        let mut children = Vec::new();
        
        // Read directory contents and sort them
        let mut entries: Vec<_> = std::fs::read_dir(docs_dir)?
            .filter_map(|entry| entry.ok())
            .collect();
        
        // Sort entries: directories first, then files, both alphabetically
        entries.sort_by(|a, b| {
            let a_is_dir = a.path().is_dir();
            let b_is_dir = b.path().is_dir();
            
            match (a_is_dir, b_is_dir) {
                (true, false) => std::cmp::Ordering::Less,  // Directories first
                (false, true) => std::cmp::Ordering::Greater, // Files second
                _ => a.file_name().cmp(&b.file_name()), // Same type: sort by name
            }
        });
        
        for entry in entries {
            let path = entry.path();
            
            // Skip hidden files and non-markdown files (unless it's a directory)
            if let Some(name) = path.file_name().and_then(|n| n.to_str()) {
                if name.starts_with('.') {
                    debug!("Skipping hidden file/directory: {}", name);
                    continue;
                }
                
                if path.is_file() && path.extension().and_then(|s| s.to_str()) != Some("md") {
                    debug!("Skipping non-markdown file: {}", name);
                    continue;
                }
            }
            
            match Self::build_tree(&path, docs_dir, &mut file_map, &mut stats) {
                Ok(child) => children.push(child),
                Err(e) => {
                    warn!("Failed to process path {}: {}", path.display(), e);
                    continue;
                }
            }
        }
        
        // Create virtual root node
        let root = FileNode {
            name: "root".to_string(),
            path: "".to_string(),
            is_file: false,
            children,
            size: None,
            modified: None,
        };
        
        debug!(
            "Document tree built: {} files, {} directories, {} bytes total",
            stats.total_files, stats.total_dirs, stats.total_size
        );
        
        Ok(DocumentTree { root, file_map, stats })
    }
    
    /// Recursively build the file tree
    fn build_tree(
        current_path: &Path,
        base_path: &Path,
        file_map: &mut HashMap<String, PathBuf>,
        stats: &mut TreeStats,
    ) -> anyhow::Result<FileNode> {
        let name = current_path
            .file_name()
            .unwrap_or_default()
            .to_string_lossy()
            .to_string();
        
        let relative_path = current_path
            .strip_prefix(base_path)
            .unwrap_or(current_path)
            .to_string_lossy()
            .replace('\\', "/");
        
        if current_path.is_file() {
            let metadata = std::fs::metadata(current_path)?;
            let size = metadata.len();
            let modified = metadata
                .modified()
                .ok()
                .and_then(|time| {
                    time.duration_since(std::time::UNIX_EPOCH)
                        .ok()
                        .map(|d| {
                            let datetime = chrono::DateTime::from_timestamp(d.as_secs() as i64, 0)?;
                            Some(datetime.format("%Y-%m-%d %H:%M:%S").to_string())
                        })
                        .flatten()
                });
            
            if current_path.extension().and_then(|s| s.to_str()) == Some("md") {
                file_map.insert(relative_path.clone(), current_path.to_path_buf());
                stats.total_files += 1;
                stats.total_size += size;
            }
            
            return Ok(FileNode {
                name,
                path: relative_path,
                is_file: true,
                children: vec![],
                size: Some(size),
                modified,
            });
        }
        
        stats.total_dirs += 1;
        let mut children = Vec::new();
        
        // Read directory contents and sort them
        let mut entries: Vec<_> = std::fs::read_dir(current_path)?
            .filter_map(|entry| entry.ok())
            .collect();
        
        // Sort entries: directories first, then files, both alphabetically
        entries.sort_by(|a, b| {
            let a_is_dir = a.path().is_dir();
            let b_is_dir = b.path().is_dir();
            
            match (a_is_dir, b_is_dir) {
                (true, false) => std::cmp::Ordering::Less,  // Directories first
                (false, true) => std::cmp::Ordering::Greater, // Files second
                _ => {
                    // Same type: sort by name (case-insensitive)
                    let a_name = a.file_name().to_string_lossy().to_lowercase();
                    let b_name = b.file_name().to_string_lossy().to_lowercase();
                    a_name.cmp(&b_name)
                }
            }
        });
        
        for entry in entries {
            let path = entry.path();
            
            // Skip hidden files and non-markdown files (unless it's a directory)
            if let Some(name) = path.file_name().and_then(|n| n.to_str()) {
                if name.starts_with('.') {
                    debug!("Skipping hidden file/directory: {}", name);
                    continue;
                }
                
                if path.is_file() && path.extension().and_then(|s| s.to_str()) != Some("md") {
                    debug!("Skipping non-markdown file: {}", name);
                    continue;
                }
            }
            
            match Self::build_tree(&path, base_path, file_map, stats) {
                Ok(child) => children.push(child),
                Err(e) => {
                    warn!("Failed to process path {}: {}", path.display(), e);
                    continue;
                }
            }
        }
        
        Ok(FileNode {
            name,
            path: relative_path,
            is_file: false,
            children,
            size: None,
            modified: None,
        })
    }
    
    /// Get the content of a file by its relative path
    pub fn get_file_content(&self, file_path: &str) -> anyhow::Result<String> {
        let path = self.file_map.get(file_path)
            .ok_or_else(|| anyhow::anyhow!("File not found: {}", file_path))?;
        
        debug!("Reading file: {}", path.display());
        let content = std::fs::read_to_string(path)
            .map_err(|e| anyhow::anyhow!("Failed to read file {}: {}", path.display(), e))?;
        
        Ok(content)
    }
    
    /// Render markdown content to HTML
    pub fn render_markdown(&self, content: &str) -> String {
        use pulldown_cmark::{Parser, Options, html};
        
        let mut options = Options::empty();
        options.insert(Options::ENABLE_TABLES);
        options.insert(Options::ENABLE_FOOTNOTES);
        options.insert(Options::ENABLE_STRIKETHROUGH);
        options.insert(Options::ENABLE_TASKLISTS);
        options.insert(Options::ENABLE_SMART_PUNCTUATION);
        options.insert(Options::ENABLE_HEADING_ATTRIBUTES);
        
        let parser = Parser::new_ext(content, options);
        let mut html_output = String::new();
        html::push_html(&mut html_output, parser);
        
        html_output
    }
    
    /// Get statistics about the document tree
    pub fn get_stats(&self) -> &TreeStats {
        &self.stats
    }
    
    /// Search for files matching a query
    pub fn search_files(&self, query: &str) -> Vec<&String> {
        let query_lower = query.to_lowercase();
        self.file_map
            .keys()
            .filter(|path| {
                path.to_lowercase().contains(&query_lower) ||
                path.split('/').any(|part| part.to_lowercase().contains(&query_lower))
            })
            .collect()
    }
}