use crate::setup::setup_api;

#[tokio::test]
async fn health_check_works() {
    let app = setup_api().await;
    let client = reqwest::Client::new();

    let response = client
        .get(format!("{}/v1/healthz", &app.address))
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
    assert_eq!(body, serde_json::json!({"status": "ok"}));
}
