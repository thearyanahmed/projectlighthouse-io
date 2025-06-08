use serde::Serialize;
use sqlx::{PgPool, Result};

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
