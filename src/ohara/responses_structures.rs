use chrono::Utc;
use serde::Serialize;
use sqlx::types::chrono;

#[derive(Serialize, Debug, Clone)]
pub struct ViewCourseResponse {
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

    pub lessons: Vec<ViewLessonResponse>,
}

#[derive(Serialize, Debug, Clone)]
pub struct ViewLessonResponse {
    pub id: i32,
    pub course_id: i32,
    pub name: String,
    pub media_url: Option<String>,
    pub content: Option<String>,

    pub created_at: Option<chrono::NaiveDateTime>,
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

impl ViewLessonResponse {
    pub fn from_lesson(lesson: crate::ohara::Lesson) -> Self {
        let (content, media_url, meta_description) = match lesson.published_at {
            Some(published_at) if published_at < Utc::now().naive_utc() => (
                Some("Coming soon".to_string()),
                Some("#".to_string()),
                lesson.meta_description,
            ),
            None => (
                Some("Coming soon".to_string()),
                Some("#".to_string()),
                Some("Coming soon".to_string()),
            ),
            _ => (lesson.content, lesson.media_url, lesson.meta_description),
        };

        Self {
            id: lesson.id,
            course_id: lesson.course_id,
            name: lesson.name,
            media_url: media_url,
            content: content,

            created_at: Some(lesson.created_at),
            updated_at: lesson.updated_at,
            deleted_at: lesson.deleted_at,

            meta_name: lesson.meta_name,
            meta_description: meta_description,
            meta_keywords: lesson.meta_keywords,
            meta_image: lesson.meta_image,

            page_layout: lesson.page_layout,

            read_time: lesson.read_time,
            watch_time: lesson.watch_time,
            published_at: lesson.published_at,
        }
    }
}

impl ViewCourseResponse {
    pub fn from_course(course: crate::ohara::Course, lessons: Vec<crate::ohara::Lesson>) -> Self {
        let lessons_responses = lessons
            .into_iter()
            .map(ViewLessonResponse::from_lesson)
            .collect::<Vec<_>>();

        Self {
            id: course.id,
            name: course.name,
            slug: course.slug,
            description: course.description,
            thumbnail: course.thumbnail,

            seo_title: course.seo_title,
            seo_description: course.seo_description,
            seo_keywords: course.seo_keywords,
            seo_image: course.seo_image,

            created_at: course.created_at,
            updated_at: course.updated_at,
            lessons: lessons_responses,
        }
    }
}
