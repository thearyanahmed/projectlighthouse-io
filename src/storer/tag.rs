use crate::storer::lookup::StaticLookup;
use serde::Serialize;

#[derive(Serialize, Clone, Debug)]
pub struct Tag {
    pub id: i32,
    pub name: String,
    pub slug: String,
}

impl StaticLookup for Tag {
    // Tags will hardly change. And the change is easy.
    // Better to save calls on database and then thinking about caching.
    // Thus tags are hardcoded, for now and probably forever.
    fn all() -> Vec<Self> {
        let tags = [
            Tag {
                id: 1,
                name: "rust".to_string(),
                slug: "rust".to_string(),
            },
            Tag {
                id: 2,
                name: "go".to_string(),
                slug: "go".to_string(),
            },
        ];
        return tags.to_vec();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::storer::StaticLookup;

    #[test]
    fn test_all_tags() {
        let tags = Tag::all();
        assert_eq!(tags.len(), 2);
        assert_eq!(tags[0].name, "rust");
        assert_eq!(tags[1].slug, "go");
    }
}
