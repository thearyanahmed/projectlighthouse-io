#[derive(Clone,Debug)]
pub struct Category {
    pub id: i32,
    pub name: String,
    pub slug: String,
}

impl Category {
    // Tags will hardly change. And the change is easy.
    // Better to save calls on database and then thinking about caching.
    // Thus tags are hardcoded, for now and probably forever.
    pub fn all() -> Vec<Category> {
        let categories = [
            Category { id: 1, name: "rust".to_string(), slug: "rust".to_string() },
            Category { id: 2, name: "go".to_string(), slug: "go".to_string() },
        ];
        return categories.to_vec();
    }
}
