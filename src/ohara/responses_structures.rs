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

    pub published_at: Option<chrono::NaiveDateTime>,
    pub created_at: Option<chrono::NaiveDateTime>,
    pub updated_at: Option<chrono::NaiveDateTime>,

    pub modules: Vec<ViewModuleResponse>,
}

#[derive(Serialize, Debug, Clone)]
pub struct ViewModuleResponse {
    pub id: i32,
    pub course_id: i32,
    pub name: String,
    pub position: i16,

    pub lessons: Vec<ViewLessonResponse>,
}

#[derive(Serialize, Debug, Clone)]
pub struct ViewLessonResponse {
    pub id: i32,
    pub course_id: i32,
    pub module_id: i32,
    pub name: String,
    pub media_url: Option<String>,
    pub content: Option<String>,

    pub created_at: Option<chrono::NaiveDateTime>,
    pub updated_at: Option<chrono::NaiveDateTime>,
    pub deleted_at: Option<chrono::NaiveDateTime>,

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
        Self {
            id: lesson.id,
            course_id: lesson.course_id,
            module_id: lesson.module_id,
            name: lesson.name,
            media_url: lesson.media_url,
            content: lesson.content,

            created_at: lesson.created_at,
            updated_at: lesson.updated_at,
            deleted_at: lesson.deleted_at,

            meta_name: lesson.meta_name,
            meta_description: lesson.meta_description,
            meta_keywords: lesson.meta_keywords,
            meta_image: lesson.meta_image,

            page_layout: lesson.page_layout,

            read_time: lesson.read_time,
            watch_time: lesson.watch_time,
        }
    }
}

impl ViewModuleResponse {
    pub fn from_module(module: crate::ohara::Module, lessons: Vec<crate::ohara::Lesson>) -> Self {
        Self {
            id: module.id,
            course_id: module.course_id,
            name: module.name,
            position: module.position,

            lessons: lessons
                .into_iter()
                .map(ViewLessonResponse::from_lesson)
                .collect(),
        }
    }
}

impl ViewCourseResponse {
    pub fn from_course(
        course: crate::ohara::Course,
        modules: Vec<crate::ohara::Module>,
        lessons: Vec<crate::ohara::Lesson>,
    ) -> Self {
        let module_map: std::collections::HashMap<i32, Vec<crate::ohara::Lesson>> = lessons
            .into_iter()
            .filter(|lesson| lesson.course_id == course.id)
            .fold(std::collections::HashMap::new(), |mut acc, lesson| {
                acc.entry(lesson.module_id).or_default().push(lesson);
                acc
            });

        let modules_responses = modules
            .into_iter()
            .filter(|module| module.course_id == course.id)
            .map(|module| {
                let lessons = module_map.get(&module.id).cloned().unwrap_or_default();
                ViewModuleResponse::from_module(module, lessons)
            })
            .collect();

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

            published_at: course.published_at,
            created_at: course.created_at,
            updated_at: course.updated_at,

            modules: modules_responses,
        }
    }
}
