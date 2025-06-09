use crate::api::category::all_categories;
use crate::api::tag::all_tags;
use crate::config::AppConfig;
use crate::config::DatabaseSettings;
use crate::ohara::{all_courses, get_course_by_slug};
use actix_cors::Cors;
use actix_web::dev::Server;
use actix_web::middleware;
use actix_web::web::Data;
use actix_web::{App, HttpResponse, HttpServer, web};
use anyhow::Result;
use sqlx::PgPool;
use sqlx::postgres::PgPoolOptions;
use std::net::TcpListener;

pub struct Api {
    server: Server,
    address: String,
    port: u16,
}

impl Api {
    pub async fn run(cfg: &AppConfig) -> Result<Self> {
        let address = format!("{}:{}", cfg.host, cfg.port);

        let connection_pool = get_connection_pool(&cfg.database);

        let listener = TcpListener::bind(&address)?;
        let port = listener.local_addr().unwrap().port();
        let server = listen_and_serve(listener, connection_pool)?;

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

pub fn get_connection_pool(configuration: &DatabaseSettings) -> PgPool {
    PgPoolOptions::new().connect_lazy_with(configuration.connect_options())
}

fn listen_and_serve(listener: TcpListener, db_pool: PgPool) -> Result<Server, std::io::Error> {
    let db_pool = Data::new(db_pool);

    let server = HttpServer::new(move || {
        App::new()
            .wrap(
                Cors::default()
                    .allow_any_origin()
                    .allow_any_method()
                    .allow_any_header()
            )
            .wrap(
                middleware::NormalizePath::trim()
            )
            .service(
                web::scope("/api/v1")
                    .route("/healthz", web::get().to(health_check))
                    .route("/tags", web::get().to(all_tags))
                    .route("/categories", web::get().to(all_categories))
                    .service(
                        web::scope("/courses")
                            .route("", web::get().to(all_courses))
                            .route("/{slug}", web::get().to(get_course_by_slug))
                    ),
            )
            .app_data(db_pool.clone())
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
