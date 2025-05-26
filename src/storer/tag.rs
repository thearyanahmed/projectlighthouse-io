#[derive(Clone,Debug)]
pub struct Tag {
    pub id: i32,
    pub name: String,
    pub slug: String,
}

impl Tag {
    // Tags will hardly change. And the change is easy.
    // Better to save calls on database and then thinking about caching.
    // Thus tags are hardcoded, for now and probably forever.
    pub fn all() -> Vec<Tag> {
        let tags = [
            Tag { id: 1, name: "rust".to_string(), slug: "rust".to_string() },
            Tag { id: 2, name: "go".to_string(), slug: "go".to_string() },
        ];
        return tags.to_vec();
    }
}
