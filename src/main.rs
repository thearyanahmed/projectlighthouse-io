mod storer;

fn main() {
    let tags = storer::Tag::all();
    let categories = storer::Category::all();

    println!("Tags: {:#?}", tags);
    println!("Categories: {:#?}", categories);
}

