pub trait StaticLookup: Sized + Clone {
    fn all() -> Vec<Self>;
}
