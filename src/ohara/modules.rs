use serde::Serialize;
use sqlx::{PgPool, Result};

use crate::ohara::Lesson;

#[derive(Serialize, Debug)]
pub struct Module {
    pub id: i32,
    pub course_id: i32,
    pub name: String,
    pub position: i16,
}

/// Returns a SQL query to find all modules for a given course_id, sorted by position.
pub async fn find_modules_by_course_id(pool: &PgPool, course_id: i32) -> Result<Vec<Module>> {
    let modules = sqlx::query_as!(
        Module,
        r#"
        SELECT id, course_id, name, position
        FROM modules
        WHERE course_id = $1
        ORDER BY position ASC
        "#,
        course_id
    )
    .fetch_all(pool)
    .await?;

    Ok(modules)
}

pub async fn find_lesson_by_id(pool: &PgPool, id: i32) -> Result<Option<Lesson>> {
    let lesson = sqlx::query_as!(
        Lesson,
        r#"
        SELECT id, course_id, module_id, name, media_url, content, created_at, updated_at, deleted_at,
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
