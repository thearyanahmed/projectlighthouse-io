use lighthouseio::api::Api;
use lighthouseio::api::get_connection_pool;
use lighthouseio::config::{DatabaseSettings, get_configuration};
use sqlx::{Connection, Executor, PgConnection, PgPool};
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

    return connection_pool;
}
