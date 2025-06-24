use env_logger::Env;
mod api;
mod config;
mod ohara;
mod storer;

use api::Api;
use config::get_configuration;

#[tokio::main]
async fn main() -> std::io::Result<()> {
    let cfg = get_configuration().expect("failed to get configuration");
    env_logger::init_from_env(Env::default().default_filter_or("info"));

    let app = Api::run(&cfg).await.expect("failed to start api server");

    println!("server running at: {}", app.address());
    app.run_until_stopped().await?;

    Ok(())
}
