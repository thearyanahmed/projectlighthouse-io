use serde::Serialize;
use sqlx::types::chrono;
use sqlx::{PgPool, Result};

#[derive(Serialize)]
pub struct Course {
    pub id: i32,
    pub name: String,
    pub slug: String,
    pub description: String,
    pub thumbnail: Option<String>,

    pub seo_title: Option<String>,
    pub seo_description: Option<String>,
    pub seo_keywords: Option<String>,
    pub seo_image: Option<String>,

    pub created_at: Option<chrono::NaiveDateTime>,
    pub updated_at: Option<chrono::NaiveDateTime>,
    pub deleted_at: Option<chrono::NaiveDateTime>,
}

pub async fn get_courses(pool: &PgPool) -> Result<Vec<Course>> {
    let courses = sqlx::query_as!(
        Course,
        r#"
        SELECT
            id,
            name,
            slug,
            description,
            thumbnail,
            seo_title,
            seo_description,
            seo_keywords,
            seo_image,
            created_at,
            updated_at,
            deleted_at
        FROM courses
        LIMIT 10
        "#
    )
    .fetch_all(pool)
    .await?;

    Ok(courses)
}

pub async fn find_course_by_slug(pool: &PgPool, slug: &str) -> Result<Option<Course>> {
    let course = sqlx::query_as!(
        Course,
        r#"
        SELECT
            id,
            name,
            slug,
            description,
            thumbnail,
            seo_title,
            seo_description,
            seo_keywords,
            seo_image,
            created_at,
            updated_at,
            deleted_at
        FROM courses
        WHERE slug = $1
        "#,
        slug
    )
    .fetch_optional(pool)
    .await?;

    Ok(course)
}
