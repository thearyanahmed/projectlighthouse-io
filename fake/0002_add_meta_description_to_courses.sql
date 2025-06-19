-- These UPDATE statements assume that:
-- 1. The lessons table has been created/altered to allow NULL for module_id.
-- 2. The new courses (derived from the original modules) have been inserted.
-- 3. The lessons have been inserted and correctly linked to their respective new courses
--    (i.e., their course_id matches the ID of the new course and module_id is NULL).

-- Module 1: Introduction -> Course: 'Introduction to Go Command Line Applications'
UPDATE lessons SET meta_description = 'Kick off the introduction module and understand what this lesson is about.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'introduction-to-go-cli-applications') AND name = 'Introduction to the course';
UPDATE lessons SET meta_description = 'Get familiar with the course goals and structure.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'introduction-to-go-cli-applications') AND name = 'Welcome!';
UPDATE lessons SET meta_description = 'Install Go and configure your workspace for CLI development.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'introduction-to-go-cli-applications') AND name = 'Setting up your environment';
UPDATE lessons SET meta_description = 'Understand Go basics: Variables, Values & Types.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'introduction-to-go-cli-applications') AND name = 'Go 101: Variables, Values & Types';
UPDATE lessons SET meta_description = 'Understand Go basics: Conditionals & Loops.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'introduction-to-go-cli-applications') AND name = 'Go 101: Conditionals & Loops';
UPDATE lessons SET meta_description = 'Understand Go basics: Functions & Pointers.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'introduction-to-go-cli-applications') AND name = 'Go 101: Functions & Pointers';
UPDATE lessons SET meta_description = 'Understand Go basics: Packages.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'introduction-to-go-cli-applications') AND name = 'Go 101: Packages';

-- Module 2: Counting Words -> Course: 'Building a Word Counter in Go'
UPDATE lessons SET meta_description = 'Initialize a fresh CLI app and structure your Go codebase.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'building-a-word-counter-in-go') AND name = 'Starting a new project';
UPDATE lessons SET meta_description = 'Learn file reading/writing using Go’s standard library.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'building-a-word-counter-in-go') AND name = 'Reading from a file';
UPDATE lessons SET meta_description = 'Implement a simple tool to count words in text files.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'building-a-word-counter-in-go') AND name = 'A Simple Word Counter';

-- Module 3: Input, Output, & Arguments -> Course: 'Handling Input, Output, and Arguments in Go CLI'
UPDATE lessons SET meta_description = 'Learn how to handle different forms of input in CLI apps.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Introduction to input';
UPDATE lessons SET meta_description = 'Understand how exit codes communicate success or failure.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Exit codes';
UPDATE lessons SET meta_description = 'Use stderr to print error messages without affecting standard output.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Standard error';
UPDATE lessons SET meta_description = 'Efficiently read large files without consuming too much memory.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Reading large files';
UPDATE lessons SET meta_description = 'Learn how Go handles byte slices and ASCII characters.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Bytes & ascii';
UPDATE lessons SET meta_description = 'Understand how to work with Unicode characters and runes.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Unicode & Runes';
UPDATE lessons SET meta_description = 'Use bufio to optimize I/O operations in Go.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'The bufio package';
UPDATE lessons SET meta_description = 'Make your code flexible using io.Reader and dependency decoupling.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Decoupling & io.Reader';
UPDATE lessons SET meta_description = 'Parse command line arguments to customize CLI behavior.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Command line arguments';
UPDATE lessons SET meta_description = 'Gracefully handle and report multiple errors.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Handling multiple errors';
UPDATE lessons SET meta_description = 'Use defer to safely close files.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Closing files with defer';
UPDATE lessons SET meta_description = 'Read data from stdin for pipeline-friendly tools.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Standard input';
UPDATE lessons SET meta_description = 'Use bufio.Scanner to tokenize and process input.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli') AND name = 'Scanning data';

-- Module 4: Adding Features -> Course: 'Adding Advanced Features to Go CLI Applications'
UPDATE lessons SET meta_description = 'Start adding more functionality to your CLI app.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Adding new features';
UPDATE lessons SET meta_description = 'Add support for counting lines in a file.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Counting lines';
UPDATE lessons SET meta_description = 'Add byte-counting logic to your CLI app.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Counting bytes';
UPDATE lessons SET meta_description = 'Use encapsulation to keep logic clean and maintainable.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Encapsulation';
UPDATE lessons SET meta_description = 'Seek through files for fine-grained reading.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'File offsets and seeking';
UPDATE lessons SET meta_description = 'Learn how to define and use methods in Go.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Methods';
UPDATE lessons SET meta_description = 'Accept a variable number of arguments in functions.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Variadic parameters';
UPDATE lessons SET meta_description = 'Understand pointer vs value receivers.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Method receivers';
UPDATE lessons SET meta_description = 'Use flags to allow user configuration of your CLI.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'CLI flags';
UPDATE lessons SET meta_description = 'Make your app faster with a single-pass approach.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Single pass algorithm';
UPDATE lessons SET meta_description = 'Format your output in a user-friendly tabular view.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Tabular output';
UPDATE lessons SET meta_description = 'Structure your project for readability and scalability.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Organizing our code';
UPDATE lessons SET meta_description = 'Control access to functions using package visibility.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Package visibility';
UPDATE lessons SET meta_description = 'Pass arguments when creating custom types.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Constructor arguments';
UPDATE lessons SET meta_description = 'Understand testing strategies in Go.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli') AND name = 'Whitebox vs Blackbox testing';

-- Module 5: Concurrency & Streams -> Course: 'Concurrency and Streams in Go CLI'
UPDATE lessons SET meta_description = 'Explore the importance of concurrency in CLI apps.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'concurrency-and-streams-go-cli') AND name = 'Introduction to concurrency & data';
UPDATE lessons SET meta_description = 'Run tasks concurrently using goroutines and sync them with waitgroups.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'concurrency-and-streams-go-cli') AND name = 'Goroutines & Waitgroups';
UPDATE lessons SET meta_description = 'Use channels to communicate safely between goroutines.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'concurrency-and-streams-go-cli') AND name = 'Channels';
UPDATE lessons SET meta_description = 'Handle and propagate errors from asynchronous tasks.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'concurrency-and-streams-go-cli') AND name = 'Handling async errors';
UPDATE lessons SET meta_description = 'Use TeeReader to copy data while reading.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'concurrency-and-streams-go-cli') AND name = 'io.TeeReader';
UPDATE lessons SET meta_description = 'Connect reader/writer streams using io.Pipe.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'concurrency-and-streams-go-cli') AND name = 'io.Pipe';
UPDATE lessons SET meta_description = 'Write to multiple outputs simultaneously.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'concurrency-and-streams-go-cli') AND name = 'io.MultiWriter';

-- Module 6: Advanced Testing -> Course: 'Advanced Testing Techniques for Go CLI'
UPDATE lessons SET meta_description = 'Explore advanced testing strategies for Go programs.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli') AND name = 'Introduction to Advanced Testing';
UPDATE lessons SET meta_description = 'Measure the performance of your functions with benchmarks.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli') AND name = 'Benchmark testing';
UPDATE lessons SET meta_description = 'Write high-level tests to verify app functionality.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli') AND name = 'End to end testing (e2e)';
UPDATE lessons SET meta_description = 'Simulate file inputs in end-to-end tests.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli') AND name = 'e2e: Testing files';
UPDATE lessons SET meta_description = 'Write e2e tests for multiple input scenarios.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli') AND name = 'e2e: Multiple files';
UPDATE lessons SET meta_description = 'Ensure test output remains stable across runs.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli') AND name = 'Determinstic output';
UPDATE lessons SET meta_description = 'Test your CLI’s flags and argument combinations.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli') AND name = 'e2e: Testing flags';
UPDATE lessons SET meta_description = 'Write reusable functions to simplify your tests.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli') AND name = 'Creating test helpers';

-- Module 7: Commands, Signals, & Contexts -> Course: 'Managing Commands, Signals, and Contexts in Go CLI'
UPDATE lessons SET meta_description = 'Run external commands from your Go app.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Executing commands';
UPDATE lessons SET meta_description = 'Pass data into commands through stdin.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Passing in input';
UPDATE lessons SET meta_description = 'Fine-tune command execution with configuration.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Configuring commands';
UPDATE lessons SET meta_description = 'Run processes concurrently with proper management.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Asynchronous execution';
UPDATE lessons SET meta_description = 'Handle system signals like SIGINT and SIGTERM.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Signals';
UPDATE lessons SET meta_description = 'Clean up and exit cleanly on shutdown.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Graceful shutdown';
UPDATE lessons SET meta_description = 'Cancel long-running operations on demand.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Cancellation';
UPDATE lessons SET meta_description = 'Use context for timeouts, cancellation, and deadlines.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'context.Context';
UPDATE lessons SET meta_description = 'Watch and manage spawned processes.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Building a process guard';
UPDATE lessons SET meta_description = 'Open a text editor programmatically from Go.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Opening an editor';
UPDATE lessons SET meta_description = 'Integrate fuzzy finding in your app with fzf.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli') AND name = 'Fuzzing finding with fzf';

-- Module 8: Filesystem & Networking -> Course: 'Filesystem and Networking for Go CLI Applications'
UPDATE lessons SET meta_description = 'Explore file and network capabilities in Go.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'Introduction to Networking & Files';
UPDATE lessons SET meta_description = 'Open files with the right read/write/append flags.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'File flags';
UPDATE lessons SET meta_description = 'Manage file permission modes programmatically.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'File permissions';
UPDATE lessons SET meta_description = 'Recursively explore directories using filepath.Walk.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'Walking the filesystem';
UPDATE lessons SET meta_description = 'Prevent duplicate processes using lock/PID files.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'Lockfiles & PIDFiles';
UPDATE lessons SET meta_description = 'Implement file-level locking for shared access.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'File locks';
UPDATE lessons SET meta_description = 'Use Go’s net package to build basic network tools.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'The net package';
UPDATE lessons SET meta_description = 'Create a TCP client and connect to a server.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'TCP Client';
UPDATE lessons SET meta_description = 'Resolve hostnames to IPs using Go.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'DNS lookups';
UPDATE lessons SET meta_description = 'Build a simple port scanner to check open ports.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'Port scanning';
UPDATE lessons SET meta_description = 'Build HTTP clients and servers in Go.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'The net/http package';
UPDATE lessons SET meta_description = 'Handle JSON and other encoding formats.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'Marshaling & unmarshaling data';
UPDATE lessons SET meta_description = 'Sending files with HTTP.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'Sending files with HTTP';
UPDATE lessons SET meta_description = 'Write tests for your HTTP endpoints.'
WHERE course_id = (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli') AND name = 'Testing HTTP Requests';
