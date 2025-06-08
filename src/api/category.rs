use crate::storer::Category;
use crate::storer::StaticLookup;
use actix_web::HttpResponse;

pub async fn all_categories() -> HttpResponse {
    let categories = Category::all();

    HttpResponse::Ok()
        .content_type("application/json")
        .json(categories)
}
