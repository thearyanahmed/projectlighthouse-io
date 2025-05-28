mod api;
mod config;
mod storer;

use api::Api;
use config::get_configuration;

#[tokio::main]
async fn main() -> std::io::Result<()> {
    let cfg = get_configuration().expect("failed to get configuration");

    let app = Api::run(&cfg).await.expect("failed to start api server");

    println!("server running at: {}", app.address());
    app.run_until_stopped().await?;

    Ok(())
}
