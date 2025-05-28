use lighthouseio::api::Api;
use lighthouseio::config::get_configuration;

pub struct TestApp {
    pub address: String,
    pub port: u16,
}

// Spawns an instance of the app. It binds to a random port.
pub async fn setup_api() -> TestApp {
    let mut config = get_configuration().expect("failed to get configuration");

    config.port = 0; // bind to a random port

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
