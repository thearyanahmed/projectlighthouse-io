use crate::storer::StaticLookup;
use crate::storer::Tag;
use actix_web::HttpResponse;

pub async fn all_tags() -> HttpResponse {
    let tags = Tag::all();

    HttpResponse::Ok()
        .content_type("application/json")
        .json(tags)
}
