use crate::setup::setup_api;

#[tokio::test]
async fn all_courses_endpoint_returns_array() {
    let app = setup_api().await;
    let client = reqwest::Client::new();

    let response = client
        .get(format!("{}/api/v1/courses", &app.address))
        .send()
        .await
        .expect("failed to execute test");

    assert!(response.status().is_success());
    assert_eq!(
        response.headers().get("content-type").unwrap(),
        "application/json"
    );

    let body: serde_json::Value = response
        .json::<serde_json::Value>()
        .await
        .expect("failed to parse json");

    assert!(body.is_array());
}

#[tokio::test]
async fn get_course_by_slug_endpoint_returns_course() {
    // first hit the all courses endpoint, then select the first course, take its slug
    // and use it to hit the get course by slug endpoint.
    let app = setup_api().await;
    let client = reqwest::Client::new();

    // Get all courses
    let all_courses_response = client
        .get(format!("{}/api/v1/courses", &app.address))
        .send()
        .await
        .expect("failed to get all courses");
    assert!(all_courses_response.status().is_success());

    let courses_body: serde_json::Value = all_courses_response
        .json::<serde_json::Value>()
        .await
        .expect("failed to parse all courses json");
    assert!(courses_body.is_array());

    let first_course = courses_body
        .as_array()
        .and_then(|arr| arr.first())
        .expect("no courses found");
    let slug = first_course
        .get("slug")
        .and_then(|v| v.as_str())
        .expect("course has no slug");

    let response = client
        .get(format!("{}/api/v1/courses/{}", &app.address, slug))
        .send()
        .await
        .expect("failed to execute test");
    assert!(response.status().is_success());
    assert_eq!(
        response.headers().get("content-type").unwrap(),
        "application/json"
    );
    let body: serde_json::Value = response
        .json::<serde_json::Value>()
        .await
        .expect("failed to parse json");
    assert!(body.is_object());
    assert_eq!(body["slug"], slug);
}

#[tokio::test]
async fn get_course_by_slug_endpoint_returns_404_for_non_existent_slug() {
    let app = setup_api().await;
    let client = reqwest::Client::new();

    // Use a slug that is unlikely to exist
    let non_existent_slug = "this-course-does-not-exist";

    let response = client
        .get(format!(
            "{}/api/v1/courses/{}",
            &app.address, non_existent_slug
        ))
        .send()
        .await
        .expect("failed to execute test");

    assert_eq!(response.status(), reqwest::StatusCode::NOT_FOUND);
}
