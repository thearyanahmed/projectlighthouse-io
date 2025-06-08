use std::fmt;

pub enum CacheControl {
    NoCache,
    NoStore,
    MaxAge(u32),
    Public,
    Private,
}

impl fmt::Display for CacheControl {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            CacheControl::NoCache => write!(f, "no-cache"),
            CacheControl::NoStore => write!(f, "no-store"),
            CacheControl::MaxAge(secs) => write!(f, "max-age={}", secs),
            CacheControl::Public => write!(f, "public"),
            CacheControl::Private => write!(f, "private"),
        }
    }
}

pub fn cache_control_header(value: CacheControl) -> (&'static str, String) {
    ("Cache-Control", value.to_string())
}
