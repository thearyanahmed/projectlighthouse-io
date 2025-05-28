use actix_web::HttpResponse;
use crate::storer::Tag;
use crate::storer::StaticLookup;

pub async fn all_tags() -> HttpResponse {
    let tags = Tag::all();

    HttpResponse::Ok()
        .content_type("application/json")
        .json(tags)
}
