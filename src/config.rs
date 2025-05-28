use anyhow::Result;
use serde_aux::field_attributes::deserialize_number_from_string;

#[derive(serde::Deserialize, Debug)]
pub struct AppConfig {
    #[serde(deserialize_with = "deserialize_number_from_string")]
    pub port: u16,
    pub host: String,
}

pub fn get_configuration() -> Result<AppConfig, config::ConfigError> {
    let base_path = std::env::current_dir().expect("failed to determine the current directory.");
    let config_dir = base_path.join("config");
    let config_file = config_dir.join("base.yml");

    let settings = config::Config::builder()
        .add_source(config::File::from(config_file))
        .build()
        .expect("failed to build config");

    let app_config: AppConfig = settings.try_deserialize()?;
    Ok(app_config)
}

pub enum Environment {
    Local,
    Production,
}

impl Environment {
    pub fn as_str(&self) -> &'static str {
        match self {
            Environment::Local => "local",
            Environment::Production => "local",
        }
    }
}

impl TryFrom<String> for Environment {
    type Error = String;

    fn try_from(value: String) -> Result<Self, Self::Error> {
        match value.to_lowercase().as_str() {
            "local" => Ok(Self::Local),
            "production" => Ok(Self::Production),
            other => Err(format!(
                "{} is nota supported environment. use either 'local' or 'production'",
                other
            )),
        }
    }
}
