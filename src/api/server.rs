use crate::api::category::all_categories;
use crate::api::tag::all_tags;
use crate::config::AppConfig;
use crate::config::DatabaseSettings;
use crate::ohara::get_lesson_by_id;
use crate::ohara::{all_courses, get_course_by_slug};
use actix_cors::Cors;
use actix_web::dev::Server;
use actix_web::middleware;
use actix_web::middleware::Logger;
use actix_web::web::Data;
use actix_web::{App, HttpRequest, HttpResponse, HttpServer, web};
use anyhow::Result;
// use futures::StreamExt;
use futures_util::stream::StreamExt;
use log::{error, info};
use sqlx::PgPool;
use sqlx::postgres::PgPoolOptions;
use std::net::TcpListener;
pub struct Api {
    server: Server,
    address: String,

    #[allow(dead_code)]
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

    #[allow(dead_code)]
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
                    .allow_any_header(),
            )
            .wrap(middleware::NormalizePath::trim())
            .wrap(Logger::new("%a %t %T %P %b %{User-Agent}i"))
            .service(
                web::scope("/v1")
                    .route("/healthz", web::get().to(health_check))
                    .route("/webhooks", web::post().to(handle_webhook))
                    .route("/tags", web::get().to(all_tags))
                    .route("/categories", web::get().to(all_categories))
                    .service(
                        web::scope("/courses")
                            .route("", web::get().to(all_courses))
                            .route("/{slug}", web::get().to(get_course_by_slug)),
                    )
                    .service(
                        web::scope("/lessons").route("/{id}", web::get().to(get_lesson_by_id)),
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

pub async fn handle_webhook(req: HttpRequest, mut body: web::Payload) -> HttpResponse {
    // Log headers
    for (key, value) in req.headers().iter() {
        info!("Header: {}: {:?}", key, value);
    }

    // Read body
    let mut body_bytes = web::BytesMut::new();
    while let Some(result) = body.next().await {
        match result {
            Ok(chunk) => body_bytes.extend_from_slice(&chunk),
            Err(e) => {
                error!("Failed to read request body: {}", e);
                return HttpResponse::BadRequest().finish();
            }
        }
    }

    info!("Body: {}", String::from_utf8_lossy(&body_bytes));

    HttpResponse::Ok().finish()
}
