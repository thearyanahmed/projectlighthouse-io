CREATE TABLE users {
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

    google_id VARCHAR(100) UNIQUE NULL,
    google_access_token VARCHAR(255) NULL,
    google_refresh_token VARCHAR(255) NULL,

    github_id VARCHAR(100) UNIQUE NULL,
    github_access_token VARCHAR(255) NULL,
    github_refresh_token VARCHAR(255) NULL,

    # need to have fields for bio and stuff
}

CREATE TABLE courses {
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,

    locale smallint NOT NULL, # default to 0 : should be english

    # need to have SEO related fields
    meta_name VARCHAR(100) NULL,
    meta_description TEXT NULL,
    meta_keywords TEXT NULL,
    meta_image VARCHAR(255) NULL,
    meta_url VARCHAR(255) NULL,

    # need to have view stats
    public_visits INT DEFAULT 0,
    total_course_page_read INT DEFAULT 0, # number of times an page was read

    price DECIMAL(10, 2) DEFAULT 0.00,

    page_layout VARCHAR(100) DEFAULT 'default',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
}

# use hardcoded const for categories and tags
# use small integer for those in the db

# coure categories is a many to many relationship
CREATE TABLE course_categories {
    course_id INT NOT NULL,
    category_id INT NOT NULL, # not in db, but const 
}

# tags are same as well, use hardcoded struct
CREATE TABLE course_tags {
    course_id INT NOT NULL,
    tag_id INT NOT NULL, # not in db, but const
}

CREATE TABLE course_chapters {
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (course_id) REFERENCES courses(id)
}

CREATE TABLE contents {
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    chapter_id INT NULL,
    name VARCHAR(100) NOT NULL,
    embed_content VARCHAR(1000) NULL, # having this null means it is not a video
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    meta_name VARCHAR(100) NULL,
    meta_description TEXT NULL,
    meta_keywords TEXT NULL,
    meta_image VARCHAR(255) NULL,
    meta_url VARCHAR(255) NULL,
    page_layout VARCHAR(100) DEFAULT 'default',
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (chapter_id) REFERENCES course_chapters(id)
}

CREATE TABLE course_tags {
    content_id INT NOT NULL,
    tag_id INT NOT NULL, # not in db, but const
}

