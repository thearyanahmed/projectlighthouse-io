use storer::StaticLookup;

mod storer;

fn main() {
    let tags = storer::Tag::find_by_id(1);
    let categories = storer::Category::all();

    let all_tags = storer::Tag::all();
    println!("Tags: {:#?}", tags);
    println!("All Tags: {:#?}", all_tags);
    println!("Categories: {:#?}", categories);
}

