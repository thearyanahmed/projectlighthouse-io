use crate::ohara::Course;
use crate::ohara::{find_course_by_slug, get_courses};
use actix_web::HttpResponse;
use actix_web::http::header::ContentType;
use actix_web::web;
use sqlx::PgPool;

pub async fn all_courses(pool: web::Data<PgPool>) -> HttpResponse {
    let courses: Vec<Course> = get_courses(&pool).await.unwrap_or_else(|_| Vec::new());

    HttpResponse::Ok()
        .content_type(ContentType::json())
        .json(courses)
}

pub async fn get_course_by_slug(pool: web::Data<PgPool>, slug: web::Path<String>) -> HttpResponse {
    let slug = slug.into_inner();

    if slug.is_empty() {
        return HttpResponse::NotFound().finish();
    }

    let course = find_course_by_slug(&pool, &slug).await.unwrap_or(None);

    match course {
        Some(course) => HttpResponse::Ok()
            .content_type(ContentType::json())
            .json(course),
        None => HttpResponse::NotFound().finish(),
    }
}
