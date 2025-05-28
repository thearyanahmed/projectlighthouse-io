use lighthouseio::api::Api;

pub struct TestApp {
    pub address: String,
    pub port: u16,
}

// Spawns an instance of the app. It binds to a random port.
pub async fn setup_api() -> TestApp {
    let mut config = lighthouseio::config::AppConfig::load("test").expect("failed to load config");

    config.port = 0; // bind to a random port

    println!("config is {:?}", config);

    let app = Api::run(&config)
        .await
        .expect("failed to build application.");

    let port = app.port();

    let address = format!("http://localhost:{}", port);
    let _ = tokio::spawn(app.run_until_stopped());

    // let db_pool = get_connection_pool(&config.database);
    log::debug!("address is {}", address);

    TestApp { port, address }
}
