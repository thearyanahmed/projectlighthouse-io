# Storer

To use generic function calls like `Tag::all()`, which is derived from `lookup::StaticLookup`. We need to make to import `lookup::StaticLookup` as well.

For example,
```rs
use crate::storer::Tag;
use crate::storer::StaticLookup;

let tags = Tag::all();
```
