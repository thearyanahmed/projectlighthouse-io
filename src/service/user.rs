pub struct User {
    pub id: i32,
    pub name: String,
    pub email: String,

    pub created_at: chrono::NaiveDateTime,
    pub updated_at: chrono::NaiveDateTime,
    pub deleted_at: Option<chrono::NaiveDateTime>,

    pub google_id: Option<String>,
    pub google_access_token: Option<String>,
    pub google_refresh_token: Option<String>,

    pub github_id: Option<String>,
    pub github_access_token: Option<String>,
    pub github_refresh_token: Option<String>,
}
