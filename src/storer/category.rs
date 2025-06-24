use crate::storer::StaticLookup;
use serde::Serialize;

#[derive(Serialize, Clone, Debug)]
pub struct Category {
    pub id: i32,
    pub name: String,
    pub slug: String,
}

impl StaticLookup for Category {
    // Categories will hardly change. And the change is easy.
    // Better to save calls on database and then thinking about caching.
    // Thus tags are hardcoded, for now and probably forever.
    fn all() -> Vec<Self> {
        let categories = [
            Category {
                id: 1,
                name: "containers".to_string(),
                slug: "containers".to_string(),
            },
            Category {
                id: 2,
                name: "kubernetes".to_string(),
                slug: "kubernetes".to_string(),
            },
        ];
        return categories.to_vec();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::storer::StaticLookup;

    #[test]
    fn test_all_categories() {
        let categories = Category::all();
        assert_eq!(categories.len(), 2);
        assert_eq!(categories[0].name, "containers");
        assert_eq!(categories[1].slug, "kubernetes");
    }
}
