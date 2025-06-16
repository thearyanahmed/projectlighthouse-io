use crate::api::CacheControl;
use crate::api::cache_control_header;
use crate::ohara::Course;
use crate::ohara::ViewCourseResponse;
use crate::ohara::find_lesson_by_id;
use crate::ohara::{
    find_course_by_slug, find_modules_by_course_id, get_courses, get_lessons_by_course_id,
};
use actix_web::HttpResponse;
use actix_web::http::header::ContentType;
use actix_web::http::header::{ETag, EntityTag};
use actix_web::web;
use chrono::{DateTime, Utc};
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

pub async fn get_lesson_by_id(pool: web::Data<PgPool>, id: web::Path<i32>) -> HttpResponse {
    let id = id.into_inner();

    if id <= 0 {
        return HttpResponse::NotFound().finish();
    }

    let lesson = find_lesson_by_id(&pool, id).await;

    match lesson {
        Ok(Some(lesson)) => {
            let last_updated: chrono::NaiveDateTime = match lesson.updated_at {
                Some(date) => date.into(),
                None => lesson.created_at.into(),
            };

            let etag_datetime: DateTime<Utc> =
                DateTime::from_naive_utc_and_offset(last_updated, Utc);
            let etag_value = etag_datetime.to_rfc3339();
            let etag = EntityTag::new(false, etag_value);

            HttpResponse::Ok()
                .insert_header(ETag(etag))
                .insert_header(cache_control_header(CacheControl::MaxAge(60)))
                .json(lesson)
        }
        Ok(None) => HttpResponse::NotFound().finish(),
        Err(_) => HttpResponse::InternalServerError().finish(),
    }
}
