use storer::StaticLookup;

mod storer;
mod config;

#[tokio::main]
async fn main() -> std::io::Result<()> {
    let cfg = config::AppConfig::load().expect("failed to load configuration");
    println!("Loaded configuration: {:?}", cfg);
    Ok(())

}

