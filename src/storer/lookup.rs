pub trait StaticLookup: Sized + Clone {
    fn all() -> Vec<Self>;
    fn id(&self) -> i32;
    fn slug(&self) -> &str;

    fn find_by_id(id: i32) -> Option<Self> {
        Self::all().into_iter().find(|x| x.id() == id)
    }

    fn find_by_slug(slug: &str) -> Option<Self> {
        Self::all().into_iter().find(|x| x.slug() == slug)
    }
}
