use anyhow::Result;
use std::net::TcpListener;
use actix_web::{App, HttpServer, HttpResponse, web};
use actix_web::dev::Server;
use crate::config::AppConfig;
use crate::api::tag::all_tags;
use crate::api::category::all_categories;
use actix_cors::Cors;

pub struct Api {
    server: Server,
    address: String,
    port : u16,
}

impl Api {
    pub async fn run(cfg : &AppConfig)-> Result<Self> {
        let address = format!("{}:{}", cfg.host, cfg.port);

        let listener = TcpListener::bind(&address)?;
        let port = listener.local_addr().unwrap().port();
        let server = listen_and_serve(listener)?;

        Ok(Api {
            server,
            address,
            port,
        })
    }

    pub fn address(&self) -> &str {
        &self.address
    }

    pub fn port(&self) -> u16 {
        self.port
    }

    pub async fn run_until_stopped(self) -> Result<(), std::io::Error> {
        self.server.await
    }
}

fn listen_and_serve(listener: TcpListener) -> Result<Server, std::io::Error> {
    let server = HttpServer::new(move || {
        App::new()
            .wrap(
                Cors::default()
                    .allow_any_origin()
                    .allow_any_method()
                    .allow_any_header()
            )
            .route("/api/v1/healthz", web::get().to(health_check))
            .route("/api/v1/tags", web::get().to(all_tags))
            .route("/api/v1/categories", web::get().to(all_categories))

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
