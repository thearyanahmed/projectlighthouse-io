use serde_aux::field_attributes::deserialize_number_from_string;
use anyhow::Result;

#[derive(serde::Deserialize, Debug)]
pub struct AppConfig {
    #[serde(deserialize_with = "deserialize_number_from_string")]
    pub port: u16,
    #[serde(deserialize_with = "deserialize_number_from_string")]
    pub host: String,
}

impl AppConfig {
    pub fn load() -> Result<AppConfig> {
        // we want to read .env file
        // if APP_ENV is production, we read  production.toml
        // else we read local.toml 
        let env = std::env::var("APP_ENV").unwrap_or_else(|_| "local".to_string());

        let config_file = match env.as_str() {
            "production" => "production.toml",
            _ => "local.toml",
        };

        let config_content = std::fs::read_to_string(config_file)
            .unwrap_or_else(|_| panic!("failed to read config file: {}", config_file));

        let config: AppConfig = toml::from_str(&config_content)
            .unwrap_or_else(|_| panic!("failed to parse config file: {}", config_file));

        Ok(config)
    }
}
