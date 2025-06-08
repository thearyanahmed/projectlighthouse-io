use lighthouseio::api::Api;
use lighthouseio::api::get_connection_pool;
use lighthouseio::config::{DatabaseSettings, get_configuration};
use sqlx::{Connection, Executor, PgConnection, PgPool};
use std::ffi::OsStr;
use tokio::fs;
use uuid::Uuid;

pub struct TestApp {
    pub address: String,
    pub port: u16,
    pub db_pool: PgPool,
}

// Spawns an instance of the app. It binds to a random port.
pub async fn setup_api() -> TestApp {
    let config = {
        let mut config = get_configuration().expect("failed to get configuration");

        config.database.database_name = Uuid::new_v4().to_string();
        config.port = 0;

        config
    };

    configure_database(&config.database).await;
    let app = Api::run(&config)
        .await
        .expect("failed to build application.");

    let port = app.port();

    let address = format!("http://localhost:{}", port);
    let _ = tokio::spawn(app.run_until_stopped());

    let db_pool = get_connection_pool(&config.database);
    log::debug!("address is {}", address);

    TestApp {
        port,
        address,
        db_pool,
    }
}

// Configures the database. Creates a connection pool and runs migration.
pub async fn configure_database(config: &DatabaseSettings) -> PgPool {
    println!("Configuring database: {:?}", config);
    let mut connection = PgConnection::connect_with(&config.without_db())
        .await
        .expect("failed to connect to postgres.");

    // create a database
    connection
        .execute(format!(r#"CREATE DATABASE "{}";"#, config.database_name).as_str())
        .await
        .expect("failed to created database.");

    let connection_pool = PgPool::connect_with(config.with_db())
        .await
        .expect("failed to connect to pool.");

    sqlx::migrate!("./migrations")
        .run(&connection_pool)
        .await
        .expect("failed to migrate.");

    // Read the SQL file from the "fake/" directory and execute its contents
    let sql_dir = std::path::Path::new("fake/");
    let mut sql_content = String::new();

    let mut entries = fs::read_dir(sql_dir)
        .await
        .expect("failed to read fake/ directory");

    while let Some(entry) = entries.next_entry().await.expect("failed to read entry") {
        let path = entry.path();
        if path.extension() == Some(OsStr::new("sql")) {
            let content = fs::read_to_string(&path)
                .await
                .unwrap_or_else(|_| panic!("failed to read {:?}", path));
            sql_content.push_str(&content);
            sql_content.push('\n');
        }
    }

    connection_pool
        .execute(sql_content.as_str())
        .await
        .expect("failed to execute SQL from fake/*.sql");

    return connection_pool;
}
