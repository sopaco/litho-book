use axum::{
    Router,
    extract::{Query, State},
    http::StatusCode,
    response::{Html, Json},
    routing::get,
};
use serde::{Deserialize, Serialize};
use tower_http::cors::CorsLayer;
use tracing::{debug, error, info};

use crate::filesystem::{DocumentTree, SearchResult};

#[derive(Clone)]
pub struct AppState {
    pub doc_tree: DocumentTree,
    pub docs_path: String,
}

#[derive(Deserialize)]
pub struct FileQuery {
    file: Option<String>,
}

#[derive(Deserialize)]
pub struct SearchQuery {
    q: Option<String>,
}

#[derive(Serialize)]
pub struct FileResponse {
    pub content: String,
    pub html: String,
    pub path: String,
    pub size: Option<u64>,
    pub modified: Option<String>,
}

#[derive(Serialize)]
pub struct SearchResponse {
    pub results: Vec<SearchResult>,
    pub total: usize,
    pub query: String,
}

#[derive(Serialize)]
pub struct StatsResponse {
    pub total_files: usize,
    pub total_dirs: usize,
    pub total_size: u64,
    pub formatted_size: String,
}

/// Create the main application router
pub fn create_router(doc_tree: DocumentTree, docs_path: String) -> Router {
    let state = AppState {
        doc_tree,
        docs_path,
    };

    Router::new()
        .route("/", get(index_handler))
        .route("/api/file", get(get_file_handler))
        .route("/api/tree", get(get_tree_handler))
        .route("/api/search", get(search_handler))
        .route("/api/stats", get(stats_handler))
        .route("/health", get(health_handler))
        .layer(CorsLayer::permissive())
        .with_state(state)
}

/// Serve the main index page
async fn index_handler(State(state): State<AppState>) -> Result<Html<String>, StatusCode> {
    debug!("Serving index page");

    let tree_json = serde_json::to_string(&state.doc_tree.root).map_err(|e| {
        error!("Failed to serialize document tree: {}", e);
        StatusCode::INTERNAL_SERVER_ERROR
    })?;

    let html = generate_index_html(&tree_json, &state.docs_path);
    Ok(Html(html))
}

/// Get file content and render as HTML
async fn get_file_handler(
    Query(params): Query<FileQuery>,
    State(state): State<AppState>,
) -> Result<Json<FileResponse>, StatusCode> {
    let file_path = params.file.ok_or_else(|| {
        debug!("Missing file parameter in request");
        StatusCode::BAD_REQUEST
    })?;

    debug!("Requesting file: {}", file_path);

    let content = state.doc_tree.get_file_content(&file_path).map_err(|e| {
        error!("Failed to read file {}: {}", file_path, e);
        StatusCode::NOT_FOUND
    })?;

    let html = state.doc_tree.render_markdown(&content);

    // Get file metadata if available
    let file_info = state
        .doc_tree
        .file_map
        .get(&file_path)
        .and_then(|path| std::fs::metadata(path).ok())
        .map(|metadata| {
            let size = metadata.len();
            let modified = metadata.modified().ok().and_then(|time| {
                time.duration_since(std::time::UNIX_EPOCH)
                    .ok()
                    .map(|d| {
                        let datetime = chrono::DateTime::from_timestamp(d.as_secs() as i64, 0)?;
                        Some(datetime.format("%Y-%m-%d %H:%M:%S").to_string())
                    })
                    .flatten()
            });
            (size, modified)
        });

    let response = FileResponse {
        content,
        html,
        path: file_path,
        size: file_info.as_ref().map(|(size, _)| *size),
        modified: file_info.and_then(|(_, modified)| modified),
    };

    info!("Successfully served file: {}", response.path);
    Ok(Json(response))
}

/// Get the document tree structure
async fn get_tree_handler(State(state): State<AppState>) -> Json<serde_json::Value> {
    debug!("Serving document tree");
    Json(serde_json::to_value(&state.doc_tree.root).unwrap_or_default())
}

/// Search for content with full-text search
async fn search_handler(
    Query(params): Query<SearchQuery>,
    State(state): State<AppState>,
) -> Result<Json<SearchResponse>, StatusCode> {
    let query = params.q.unwrap_or_default();

    if query.trim().is_empty() {
        return Ok(Json(SearchResponse {
            results: vec![],
            total: 0,
            query: query.clone(),
        }));
    }

    debug!("Searching for: {}", query);

    let results = state.doc_tree.search_content(&query);
    let total = results.len();

    debug!("Found {} results matching query: {}", total, query);

    Ok(Json(SearchResponse { 
        results, 
        total, 
        query 
    }))
}

/// Get statistics about the document tree
async fn stats_handler(State(state): State<AppState>) -> Json<StatsResponse> {
    let stats = state.doc_tree.get_stats();

    let formatted_size = format_bytes(stats.total_size);

    Json(StatsResponse {
        total_files: stats.total_files,
        total_dirs: stats.total_dirs,
        total_size: stats.total_size,
        formatted_size,
    })
}

/// Health check endpoint
async fn health_handler() -> Json<serde_json::Value> {
    Json(serde_json::json!({
        "status": "healthy",
        "timestamp": chrono::Utc::now().to_rfc3339(),
        "version": env!("CARGO_PKG_VERSION")
    }))
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

/// Generate the main HTML page
fn generate_index_html(tree_json: &str, docs_path: &str) -> String {
    // Read the template file
    let template_content = include_str!("../templates/index.html.tpl");

    // Replace the placeholders with actual data
    template_content
        .replace("{{ tree_json|safe }}", tree_json)
        .replace("{{ docs_path }}", docs_path)
}
