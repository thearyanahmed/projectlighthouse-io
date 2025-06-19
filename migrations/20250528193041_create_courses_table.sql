CREATE TABLE IF NOT EXISTS courses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    thumbnail VARCHAR(255) NULL,

    seo_title VARCHAR(255) NULL,
    seo_description VARCHAR(500) NULL,
    seo_keywords VARCHAR(255) NULL,
    seo_image VARCHAR(255) NULL,

    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS modules (
    id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES courses(id) ,
    name VARCHAR(200) NOT NULL,
    position SMALLINT NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS lessons (
    id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES courses(id) ,
    module_id INTEGER NOT NULL REFERENCES modules(id) ,
    name VARCHAR(200) NOT NULL,
    -- thumbnail VARCHAR(255) NULL,
    media_url VARCHAR(1000) NULL, -- nullable, could be audio, could be video
    content TEXT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    deleted_at TIMESTAMP NULL,

    meta_name VARCHAR(100) NULL,
    meta_description TEXT NULL,
    meta_keywords TEXT NULL,
    meta_image VARCHAR(255) NULL,

    page_layout SMALLINT NOT NULL DEFAULT 1, -- enum to define layout type, e.g., 0 for default, 1 for video, etc.

    read_time VARCHAR(10) NULL,
    watch_time VARCHAR(10) NULL,
    published_at TIMESTAMP NULL
);
