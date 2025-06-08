use crate::api::CacheControl;
use crate::api::cache_control_header;
use crate::ohara::Course;
use crate::ohara::ViewCourseResponse;
use crate::ohara::{
    find_course_by_slug, find_modules_by_course_id, get_courses, get_lessons_by_course_id,
};
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

    if course.is_none() {
        return HttpResponse::NotFound().finish();
    }

    let modules = match course {
        Some(ref course) => find_modules_by_course_id(&pool, course.id)
            .await
            .unwrap_or_else(|_| Vec::new()),
        None => Vec::new(),
    };

    let lessons = match (&course, !modules.is_empty()) {
        (Some(course), true) => get_lessons_by_course_id(&pool, course.id)
            .await
            .unwrap_or_else(|_| Vec::new()),
        _ => Vec::new(),
    };

    let course_response: ViewCourseResponse = match course {
        Some(course) => ViewCourseResponse::from_course(course, modules, lessons),
        None => return HttpResponse::NotFound().finish(),
    };

    HttpResponse::Ok()
        .insert_header(cache_control_header(CacheControl::MaxAge(60)))
        .content_type(ContentType::json())
        .json(course_response)
}
