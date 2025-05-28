CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    google_id VARCHAR(100) UNIQUE,
    google_access_token VARCHAR(255),
    google_refresh_token VARCHAR(255),

    github_id VARCHAR(100) UNIQUE,
    github_access_token VARCHAR(255),
    github_refresh_token VARCHAR(255)
);
