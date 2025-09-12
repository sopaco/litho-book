use thiserror::Error;

#[derive(Error, Debug)]
pub enum LithoBookError {
    #[error("IO error: {0}")]
    Io(#[from] std::io::Error),
    
    #[error("JSON serialization error: {0}")]
    Json(#[from] serde_json::Error),
    
    
    #[error("File not found: {path}")]
    FileNotFound { path: String },
    
    #[error("Invalid file path: {path}")]
    InvalidPath { path: String },
    
    #[error("Directory scan error: {0}")]
    DirectoryScan(String),
    
    #[error("Server error: {0}")]
    Server(String),
    
    #[error("Configuration error: {0}")]
    Config(String),
}

pub type Result<T> = std::result::Result<T, LithoBookError>;

impl From<LithoBookError> for axum::http::StatusCode {
    fn from(err: LithoBookError) -> Self {
        match err {
            LithoBookError::FileNotFound { .. } => axum::http::StatusCode::NOT_FOUND,
            LithoBookError::InvalidPath { .. } => axum::http::StatusCode::BAD_REQUEST,
            LithoBookError::Json(_) => axum::http::StatusCode::INTERNAL_SERVER_ERROR,
            LithoBookError::Io(_) => axum::http::StatusCode::INTERNAL_SERVER_ERROR,
            LithoBookError::DirectoryScan(_) => axum::http::StatusCode::INTERNAL_SERVER_ERROR,
            LithoBookError::Server(_) => axum::http::StatusCode::INTERNAL_SERVER_ERROR,
            LithoBookError::Config(_) => axum::http::StatusCode::BAD_REQUEST,
        }
    }
}