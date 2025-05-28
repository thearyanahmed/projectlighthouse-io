use actix_web::{HttpResponse};
use crate::storer::Category;
use crate::storer::StaticLookup;

pub async fn all_categories() -> HttpResponse {
    let categories = Category::all();

    HttpResponse::Ok()
        .content_type("application/json")
        .json(categories)
}
