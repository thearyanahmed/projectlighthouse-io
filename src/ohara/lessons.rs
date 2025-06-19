use serde::Serialize;
use sqlx::{PgPool, Result};

#[derive(Serialize, Debug, Clone)]
pub struct Lesson {
    pub id: i32,
    pub course_id: i32,
    pub name: String,
    // pub thumbnail: Option<String>, // Uncomment if you add thumbnail
    pub media_url: Option<String>,
    pub content: Option<String>,

    pub created_at: chrono::NaiveDateTime,
    pub updated_at: Option<chrono::NaiveDateTime>,
    pub deleted_at: Option<chrono::NaiveDateTime>,
    pub published_at: Option<chrono::NaiveDateTime>,

    pub meta_name: Option<String>,
    pub meta_description: Option<String>,
    pub meta_keywords: Option<String>,
    pub meta_image: Option<String>,

    pub page_layout: i16,

    pub read_time: Option<String>,
    pub watch_time: Option<String>,
}

pub async fn get_lessons_by_course_id(pool: &PgPool, course_id: i32) -> Result<Vec<Lesson>> {
    let lessons = sqlx::query_as!(
        Lesson,
        r#"
        SELECT
            id,
            course_id,
            name,
            media_url,
            content,
            created_at,
            updated_at,
            deleted_at,
            published_at,
            meta_name,
            meta_description,
            meta_keywords,
            meta_image,
            page_layout,
            read_time,
            watch_time
        FROM lessons
        WHERE course_id = $1
        "#,
        course_id
    )
    .fetch_all(pool)
    .await?;

    Ok(lessons)
}

pub async fn find_lesson_by_id(pool: &PgPool, id: i32) -> Result<Option<Lesson>> {
    let lesson = sqlx::query_as!(
        Lesson,
        r#"
        SELECT id, course_id, name, media_url, content, created_at, updated_at, deleted_at, published_at,
               meta_name, meta_description, meta_keywords, meta_image, page_layout, read_time, watch_time
        FROM lessons
        WHERE id = $1
        "#,
        id
    )
    .fetch_optional(pool)
    .await?;

    Ok(lesson)
}
