mod storer;

fn main() {
    let tags = storer::Tags::all();

    println!("Tags: {:#?}", tags);
}

