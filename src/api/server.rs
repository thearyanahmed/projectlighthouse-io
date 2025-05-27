use anyhow::Result;
use std::net::TcpListener;
use actix_web::{App, HttpServer, HttpResponse, web};
use actix_web::dev::Server;
use crate::config::AppConfig;

pub struct Api {
    server: Server,
    address: String,
}

impl Api {
    pub async fn run(cfg : &AppConfig)-> Result<Self> {
        let address = format!("{}:{}", cfg.host, cfg.port);

        let listener = TcpListener::bind(&address)?;

        let server = listen_and_serve(listener)?;

        Ok(Api {
            server,
            address,
        })
    }

    pub fn address(&self) -> &str {
        &self.address
    }

    pub async fn run_until_stopped(self) -> Result<(), std::io::Error> {
        self.server.await
    }
}

fn listen_and_serve(listener: TcpListener) -> Result<Server, std::io::Error> {
    let server = HttpServer:: new(move || {
        App::new()
            .route("/healthz",web::get().to(health_check))

    })
    .listen(listener)?
        .run();

    Ok(server)
}

pub async fn health_check() -> HttpResponse {
    let response_body = serde_json::json!({
        "status": "ok"
    });
    HttpResponse::Ok()
        .content_type("application/json")
        .json(response_body)
}
