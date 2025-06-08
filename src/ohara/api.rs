use actix_web::HttpResponse;

use crate::ohara::Course;

pub async fn all_courses() -> HttpResponse {
    println!("Fetching all courses...");
    let mut courses = Vec::<Course>::new();

    let fake_course = Course {
        id: 1,
        name: "Example Course".to_string(),
        slug: "example-course".to_string(),
        description: "This is an example course.".to_string(),
        thumbnail: Some("https://example.com/thumbnail.jpg".to_string()),
        seo_title: Some("Example Course SEO Title".to_string()),
        seo_description: Some("This is an example course for SEO.".to_string()),
        seo_keywords: Some("example, course, seo".to_string()),
        seo_image: Some("https://example.com/seo-image.jpg".to_string()),
        published_at: None,
        created_at: None,
        updated_at: None,
        deleted_at: None,
    };

    courses.push(fake_course);

    HttpResponse::Ok()
        .content_type("application/json")
        .json(courses)
}
