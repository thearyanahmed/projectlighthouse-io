use storer::StaticLookup;

mod storer;
mod config;
mod api;

use api::Api;

#[tokio::main]
async fn main() -> std::io::Result<()> {
    let cfg = config::AppConfig::load().expect("failed to load configuration");

    let app = Api::run(&cfg).await.expect("failed to start api server");

    println!("server running at: {}", app.address());
    app.run_until_stopped().await?;

    Ok(())

}

