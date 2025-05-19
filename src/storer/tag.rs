#[derive(Debug)]
pub struct Tag {
    pub id: i32,
    pub name: String,
    pub slug: String,
}

pub struct Tags {
}

impl Tags {
    pub fn all() -> [Tag; 28] {
        let tags = [
                Tag { id: 1, name: "rust".to_string(), slug: "rust".to_string() },
                Tag { id: 2, name: "go".to_string(), slug: "go".to_string() },
                Tag { id: 3, name: "docker".to_string(), slug: "docker".to_string() },
                Tag { id: 4, name: "kubernetes".to_string(), slug: "kubernetes".to_string() },
                Tag { id: 5, name: "containers".to_string(), slug: "containers".to_string() },
                Tag { id: 6, name: "cpu".to_string(), slug: "cpu".to_string() },
                Tag { id: 7, name: "io".to_string(), slug: "io".to_string() },
                Tag { id: 8, name: "memory".to_string(), slug: "memory".to_string() },
                Tag { id: 9, name: "concurrency".to_string(), slug: "concurrency".to_string() },
                Tag { id: 10, name: "parallelism".to_string(), slug: "parallelism".to_string() },
                Tag { id: 11, name: "async".to_string(), slug: "async".to_string() },
                Tag { id: 12, name: "synchronization".to_string(), slug: "synchronization".to_string() },
                Tag { id: 13, name: "mutex".to_string(), slug: "mutex".to_string() },
                Tag { id: 14, name: "atomic".to_string(), slug: "atomic".to_string() },
                Tag { id: 15, name: "deadlock".to_string(), slug: "deadlock".to_string() },
                Tag { id: 16, name: "livelock".to_string(), slug: "livelock".to_string() },
                Tag { id: 17, name: "starvation".to_string(), slug: "starvation".to_string() },
                Tag { id: 18, name: "thread".to_string(), slug: "thread".to_string() },
                Tag { id: 19, name: "stack".to_string(), slug: "stack".to_string() },
                Tag { id: 20, name: "heap".to_string(), slug: "heap".to_string() },
                Tag { id: 21, name: "process".to_string(), slug: "process".to_string() },
                Tag { id: 22, name: "cpu".to_string(), slug: "cpu".to_string() },
                Tag { id: 23, name: "io".to_string(), slug: "io".to_string() },
                Tag { id: 24, name: "memory".to_string(), slug: "memory".to_string() },
                Tag { id: 25, name: "concurrency".to_string(), slug: "concurrency".to_string() },
                Tag { id: 26, name: "parallelism".to_string(), slug: "parallelism".to_string() },
                Tag { id: 27, name: "async".to_string(), slug: "async".to_string() },
                Tag { id: 28, name: "synchronization".to_string(), slug: "synchronization".to_string() },
            ];

        return tags;
    }
}
