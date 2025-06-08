use crate::ohara::Course;
use crate::ohara::get_courses;
use actix_web::HttpResponse;
use actix_web::http::header::ContentType;
use actix_web::web;
use sqlx::PgPool;

pub async fn all_courses(pool: web::Data<PgPool>) -> HttpResponse {
    let courses: Vec<Course> = get_courses(&pool).await.unwrap_or_else(|_| {
        println!("Failed to fetch courses, returning empty list.");
        Vec::new()
    });

    HttpResponse::Ok()
        .content_type(ContentType::json())
        .json(courses)
}
