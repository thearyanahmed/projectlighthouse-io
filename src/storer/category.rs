use crate::storer::StaticLookup;

#[derive(Clone,Debug)]
pub struct Category {
    pub id: i32,
    pub name: String,
    pub slug: String,
}

impl StaticLookup for Category{
    // Categories will hardly change. And the change is easy.
    // Better to save calls on database and then thinking about caching.
    // Thus tags are hardcoded, for now and probably forever.
    fn all() -> Vec<Self> {
        let categories = [
            Category { id: 1, name: "containers".to_string(), slug: "rust".to_string() },
            Category { id: 2, name: "go".to_string(), slug: "go".to_string() },
        ];
        return categories.to_vec();
    }

    fn id(&self) -> i32 { self.id }
    fn slug(&self) -> &str { &self.slug }
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
        assert_eq!(categories[1].slug, "go");
    }

    #[test]
    fn test_find_by_id() {
        let category = Category::find_by_id(1).expect("Category not found");
        assert_eq!(category.name, "containers");
    }

    #[test]
    fn test_find_by_slug() {
        let category = Category::find_by_slug("go").expect("Category not found");
        assert_eq!(category.id, 2);
    }

    #[test]
    fn test_not_found() {
        assert!(Category::find_by_id(999).is_none());
        assert!(Category::find_by_slug("python").is_none());
    }
}


