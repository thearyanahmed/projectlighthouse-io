use crate::setup::setup_api;

#[tokio::test]
async fn test_all_courses() {
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

    println!("Response body: {}", body);

    assert!(body.is_array());
}
