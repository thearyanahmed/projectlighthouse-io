-- Add migration script here
UPDATE lessons SET content = '
Our approach will be to make a plan for the features and work our way through.

> All the code could be found at https://github.com/thearyanahmed/lucy

So, getting started, our url shortener is a program, that stores a longer form of url (text) against an unique and short text. You can think of a hashmap. Where the values are URLs and keys are unique ids.

We’ll need to identify the url based on the unique id. If it exists, we return it, if not, return a different result.

The unique ids should contain characters that can create a valid url. Because usually we’ll have an endpoint that contains the unique id. So we’ll use [0-9,a-z,A-Z] values.

## Unique IDs
How many unique ids can be created from these values? 0–9 = 10, a-z and A-Z both containing 26 each. Total 10+26+26= 62 possible characters. If we use 6 characters, we should be able to create 62^6 = 56,800,235,584 values.

For our simple project, this should be more than enough. The formula is number of characters we can choose ^ characters we’ll use.

> A ^ n = Number of possible values

Summary till this point
Build a program that stores valid urls against an unique id

Have the functionality to find an url by its id

We will be focusing on the core part of functionalities now. We want to build a library that gives us a the mentioned features.

## Coding with Rust
We’ll have a simple library, that exposes find , record and all functions to our clients. And will support multiple datastores. I want to lay out the approach from a user’s perspective. We have a service (struct) called Lucy , that gives us the functionality for the following.

- Saving a new record
- Finding a record by uuid
- Finding all records

The records are saved in a datastore, the datastore can be anything, hashmap, redis, mysql etc. It is accessed by a trait object ( dyn TraitName ). This trait, in our case is Datastore .

## Datastore
We want our service class to have access to a datastore via a public trait object. So we can have support for multiple data stores.

```rust
pub trait Datastore {
    fn find(&mut self, uuid: &str) -> Result<Record, LucyError>;

    fn record(&mut self, record: Record) -> Result<bool, String>;

    fn all(&mut self) -> Vec<Record>;
}
```
We’ll call our library Lucy (just needed a name). And the structure is simple.

```rust
pub struct Lucy {
    ds: Box<dyn Datastore>,
}

impl Lucy {
    pub fn new(driver: DatastoreDriver) -> Lucy {

    }

    pub fn find(&mut self, uuid: &str) -> Result<Record, LucyError> {
    }

    pub fn record(&mut self, record: Record) -> Result<bool, String> {
    }

    pub fn all(&mut self) -> Vec<Record> {
    }

}
```

I’d like to address a few other things. The Record from the above code is simply a structure for holding an uuid and url.

```rust
pub struct Record {
    pub url: String,
    pub uuid: String,
}
```
And LucyError is an enum for the errors specific from this library.

```rust
pub enum LucyError {
    UrlNotFoundError,
    NotAValidUrlError
}

impl LucyError {
    pub fn to_string(&self) -> String {
        match *self {
            Self::UrlNotFoundError => "url not found".to_string(),
            Self::NotAValidUrlError => "not a valid url".to_string(),
        }
    }
}
```

## Implement Lucy
Our simple Lucy needs to be instantiated with a datastore , which can be selected from the outside.

```rust
impl Lucy {
    pub fn new(driver: DatastoreDriver) -> Lucy {
        let ds = Lucy::get_datastore(driver);
        Lucy { ds }
    }

    fn get_datastore(driver: DatastoreDriver) -> Box<dyn Datastore> {
        match driver {
            DatastoreDriver::InMemoryHashmap => Box::new(HashmapStore::new()),
            DatastoreDriver::Redis => Box::new(RedisStore::new()),
        }
    }
}
```

We want our datastore to be something dynamic, something that implements Datastore trait, anything that implements Datastore trait. For starters, we had two options, either go with generics or dynamic dispatch.

Box is a pointer to heap allocation. More details here.

From our library’s user point of view, a user (dev) would run the following code to create an instance of our Lucyservice.

```rust
let mut lucy = Lucy::new(DatastoreDriver::InMemoryHashmap);
To record (save) an url, we call,

for _ in 0..100 {
  match lucy.record(Record::new(faker.gen(&FakeOption::URL))) {
    Err(err) => println!("error: {}",err),
      _ => {},
    }
}
```
To find a specific one,

```rust
match lucy.find(&y) {
    Ok(r) => {
        println!("FOUND URL: {}",r.url)
      },

    Err(e) => print!("NOT FOUND {}",e.to_string()),
}
```

And to find all of them,

```rust
for record in lucy.all() {
    println!("uuid: {} url:{}",record.uuid, record.url);
}
```
It’s a very simple API. Let’s implement the RedisStore to satisfy Datastore trait.

## Implement RedisStore

Our redis store for only holds a connect for now. We use the conventional new function to return an new instance that has the connection to communicate with redis.

```rust
pub struct RedisStore {
    con: redis::Connection,
}

impl RedisStore {
    pub fn new() -> RedisStore {
        // @TODO take connection string as parameter.
        let client = redis::Client::open("redis://127.0.0.1/").expect("could not connect to redis");

        let con = client
            .get_connection()
            .expect("could not get connection to redis");

        RedisStore { con }
    }
}
```

## Implement Datastore for RedisStore
For redis’s data structure, it’ll only be a simple string SET KEY VALUE where the KEY is an uuid and value is the URL itself. I’m using redis-rs crate.

**record** To set a record, we just run SET with given arguments.

```rust
fn record(&mut self, record: Record) -> Result<bool, String> {
        match redis::cmd("SET").arg(record.uuid).arg(record.url).query::<String>(&mut self.con) {
            Ok(_) => Ok(true),
            Err(err) => Err(err.to_string()),
        }
    }
```
Explanation, we run a command using cmd , with our arguments. The order of the arguments are necessary.

find To find a record, we use the previous approach, simply with GET command.

```rust
  fn find(&mut self, uuid: &str) -> Result<Record, LucyError> {
        match redis::cmd("GET").arg(uuid).query::<String>(&mut self.con) {
            Ok(url) => {
                match Record::from(url, uuid.to_string()) {
                    Ok(record) => Ok(record),
                    Err(_) => Err(LucyError::NotAValidUrlError)
                }
            },
            Err(_) => Err(LucyError::UrlNotFoundError),
        }
    }
```

all To implement all method, which will retrieve all saved records in our datastore, we first need to get all the keys and then find all the uuids and then making a bulk call using MGET key1 key2 … keyNwith all the given ids.

```rust
    fn all(&mut self) -> Vec<Record> {
        // Get all the keys
        let keys = match redis::cmd("KEYS").arg("*").query::<Vec<String>>(&mut self.con) {
            Ok(keyset) => keyset,
            Err(_) => vec![],
        };

        if keys.len() == 0 {
            return vec![];
        }

        let mut cmd = redis::cmd("MGET");

        // build the command
        for k in keys.clone() {
            cmd.arg(k);
        }

        // get redis results using MGET key1, key2, ..., keyN
        let urls = match cmd.query::<Vec<String>>(&mut self.con) {
            Ok(results) => results,
            Err(_) => vec![],
        };

        if urls.len() == 0 {
            return vec![];
        }

        // Result mapping
        let mut res : Vec<Record> = vec![];

        for (i, uuid) in keys.iter().enumerate() {
            let url = &urls[i];

            match Record::from(url.to_string(), uuid.to_string()) {
                Ok(record) => res.push(record),
                Err(_) => {},
            }
        }

        res
    }
```
And that does it. This is the core. Using it with a REST api, gRPC or even building a CLI or anything else is up to the dev. If the given datastores don’t work, simply write a datastore that implements Datastore.

## Notes

- This code doesn’t have any tests written, not yet at least.
- This is just a demo project.
- Doesn’t have a method for find_by_url to check if an url exists already.
- Welcoming mistakes to be pointed out.
- UUID collision was not addressed in the code, not yet at least.
- An implementation for serving to the web and over gRPC using Tokio Tonic is in drafts (built for learning purpose only).

The following logic was using to generate uuid of a given length.


## Generate UUID

```rust
let unique_string: String = rand::thread_rng()
        .sample_iter(&Alphanumeric)
        .take(char_length)
        .map(char::from)
        .collect();
```

## Quick Links
- A video on using [alpha numeric ids for n characters by Tom Scott](https://www.youtube.com/watch?v=gocwRvLhDf8&t=1s&ab_channel=TomScott)
- [Consistent hashing](https://en.wikipedia.org/wiki/Consistent_hashing)
- An article on [Consistent hashing](https://tom-e-white.com/2007/11/consistent-hashing.html) by Tom E White
- More on [Rust’s std::boxed::Box](https://doc.rust-lang.org/std/boxed/struct.Box.html)
';
