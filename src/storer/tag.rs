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

    fn id(&self) -> i32 {
        self.id
    }
    fn slug(&self) -> &str {
        &self.slug
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

    #[test]
    fn test_find_by_id() {
        let tag = Tag::find_by_id(1).expect("Tag not found");
        assert_eq!(tag.name, "rust");
    }

    #[test]
    fn test_find_by_slug() {
        let tag = Tag::find_by_slug("go").expect("Tag not found");
        assert_eq!(tag.id, 2);
    }

    #[test]
    fn test_not_found() {
        assert!(Tag::find_by_id(999).is_none());
        assert!(Tag::find_by_slug("python").is_none());
    }
}
