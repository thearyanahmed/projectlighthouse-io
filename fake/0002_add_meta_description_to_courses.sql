-- Module 1: Introduction
UPDATE lessons SET meta_description = 'Kick off the introduction module and understand what this lesson is about.' WHERE module_id = 1 AND name = 'Introduction to the course';
UPDATE lessons SET meta_description = 'Get familiar with the course goals and structure.' WHERE module_id = 1 AND name = 'Welcome!';
UPDATE lessons SET meta_description = 'Install Go and configure your workspace for CLI development.' WHERE module_id = 1 AND name = 'Setting up your environment';
UPDATE lessons SET meta_description = 'Understand Go basics: Variables, Values & Types.' WHERE module_id = 1 AND name = 'Go 101: Variables, Values & Types';
UPDATE lessons SET meta_description = 'Understand Go basics: Conditionals & Loops.' WHERE module_id = 1 AND name = 'Go 101: Conditionals & Loops';
UPDATE lessons SET meta_description = 'Understand Go basics: Functions & Pointers.' WHERE module_id = 1 AND name = 'Go 101: Functions & Pointers';
UPDATE lessons SET meta_description = 'Understand Go basics: Packages.' WHERE module_id = 1 AND name = 'Go 101: Packages';

-- Module 2: Counting Words
UPDATE lessons SET meta_description = 'Initialize a fresh CLI app and structure your Go codebase.' WHERE module_id = 2 AND name = 'Starting a new project';
UPDATE lessons SET meta_description = 'Learn file reading/writing using Go’s standard library.' WHERE module_id = 2 AND name = 'Reading from a file';
UPDATE lessons SET meta_description = 'Implement a simple tool to count words in text files.' WHERE module_id = 2 AND name = 'A Simple Word Counter';

-- Module 3: Input, Output, & Arguments
UPDATE lessons SET meta_description = 'Learn how to handle different forms of input in CLI apps.' WHERE module_id = 3 AND name = 'Introduction to input';
UPDATE lessons SET meta_description = 'Understand how exit codes communicate success or failure.' WHERE module_id = 3 AND name = 'Exit codes';
UPDATE lessons SET meta_description = 'Use stderr to print error messages without affecting standard output.' WHERE module_id = 3 AND name = 'Standard error';
UPDATE lessons SET meta_description = 'Efficiently read large files without consuming too much memory.' WHERE module_id = 3 AND name = 'Reading large files';
UPDATE lessons SET meta_description = 'Learn how Go handles byte slices and ASCII characters.' WHERE module_id = 3 AND name = 'Bytes & ascii';
UPDATE lessons SET meta_description = 'Understand how to work with Unicode characters and runes.' WHERE module_id = 3 AND name = 'Unicode & Runes';
UPDATE lessons SET meta_description = 'Use bufio to optimize I/O operations in Go.' WHERE module_id = 3 AND name = 'The bufio package';
UPDATE lessons SET meta_description = 'Make your code flexible using io.Reader and dependency decoupling.' WHERE module_id = 3 AND name = 'Decoupling & io.Reader';
UPDATE lessons SET meta_description = 'Parse command line arguments to customize CLI behavior.' WHERE module_id = 3 AND name = 'Command line arguments';
UPDATE lessons SET meta_description = 'Gracefully handle and report multiple errors.' WHERE module_id = 3 AND name = 'Handling multiple errors';
UPDATE lessons SET meta_description = 'Use defer to safely close files.' WHERE module_id = 3 AND name = 'Closing files with defer';
UPDATE lessons SET meta_description = 'Read data from stdin for pipeline-friendly tools.' WHERE module_id = 3 AND name = 'Standard input';
UPDATE lessons SET meta_description = 'Use bufio.Scanner to tokenize and process input.' WHERE module_id = 3 AND name = 'Scanning data';

-- Module 4: Adding Features
UPDATE lessons SET meta_description = 'Start adding more functionality to your CLI app.' WHERE module_id = 4 AND name = 'Adding new features';
UPDATE lessons SET meta_description = 'Add support for counting lines in a file.' WHERE module_id = 4 AND name = 'Counting lines';
UPDATE lessons SET meta_description = 'Add byte-counting logic to your CLI app.' WHERE module_id = 4 AND name = 'Counting bytes';
UPDATE lessons SET meta_description = 'Use encapsulation to keep logic clean and maintainable.' WHERE module_id = 4 AND name = 'Encapsulation';
UPDATE lessons SET meta_description = 'Seek through files for fine-grained reading.' WHERE module_id = 4 AND name = 'File offsets and seeking';
UPDATE lessons SET meta_description = 'Learn how to define and use methods in Go.' WHERE module_id = 4 AND name = 'Methods';
UPDATE lessons SET meta_description = 'Accept a variable number of arguments in functions.' WHERE module_id = 4 AND name = 'Variadic parameters';
UPDATE lessons SET meta_description = 'Understand pointer vs value receivers.' WHERE module_id = 4 AND name = 'Method receivers';
UPDATE lessons SET meta_description = 'Use flags to allow user configuration of your CLI.' WHERE module_id = 4 AND name = 'CLI flags';
UPDATE lessons SET meta_description = 'Make your app faster with a single-pass approach.' WHERE module_id = 4 AND name = 'Single pass algorithm';
UPDATE lessons SET meta_description = 'Format your output in a user-friendly tabular view.' WHERE module_id = 4 AND name = 'Tabular output';
UPDATE lessons SET meta_description = 'Structure your project for readability and scalability.' WHERE module_id = 4 AND name = 'Organizing our code';
UPDATE lessons SET meta_description = 'Control access to functions using package visibility.' WHERE module_id = 4 AND name = 'Package visibility';
UPDATE lessons SET meta_description = 'Pass arguments when creating custom types.' WHERE module_id = 4 AND name = 'Constructor arguments';
UPDATE lessons SET meta_description = 'Understand testing strategies in Go.' WHERE module_id = 4 AND name = 'Whitebox vs Blackbox testing';

-- Module 5: Concurrency & Streams
UPDATE lessons SET meta_description = 'Explore the importance of concurrency in CLI apps.' WHERE module_id = 5 AND name = 'Introduction to concurrency & data';
UPDATE lessons SET meta_description = 'Run tasks concurrently using goroutines and sync them with waitgroups.' WHERE module_id = 5 AND name = 'Goroutines & Waitgroups';
UPDATE lessons SET meta_description = 'Use channels to communicate safely between goroutines.' WHERE module_id = 5 AND name = 'Channels';
UPDATE lessons SET meta_description = 'Handle and propagate errors from asynchronous tasks.' WHERE module_id = 5 AND name = 'Handling async errors';
UPDATE lessons SET meta_description = 'Use TeeReader to copy data while reading.' WHERE module_id = 5 AND name = 'io.TeeReader';
UPDATE lessons SET meta_description = 'Connect reader/writer streams using io.Pipe.' WHERE module_id = 5 AND name = 'io.Pipe';
UPDATE lessons SET meta_description = 'Write to multiple outputs simultaneously.' WHERE module_id = 5 AND name = 'io.MultiWriter';

-- Module 6: Advanced Testing
UPDATE lessons SET meta_description = 'Explore advanced testing strategies for Go programs.' WHERE module_id = 6 AND name = 'Introduction to Advanced Testing';
UPDATE lessons SET meta_description = 'Measure the performance of your functions with benchmarks.' WHERE module_id = 6 AND name = 'Benchmark testing';
UPDATE lessons SET meta_description = 'Write high-level tests to verify app functionality.' WHERE module_id = 6 AND name = 'End to end testing (e2e)';
UPDATE lessons SET meta_description = 'Simulate file inputs in end-to-end tests.' WHERE module_id = 6 AND name = 'e2e: Testing files';
UPDATE lessons SET meta_description = 'Write e2e tests for multiple input scenarios.' WHERE module_id = 6 AND name = 'e2e: Multiple files';
UPDATE lessons SET meta_description = 'Ensure test output remains stable across runs.' WHERE module_id = 6 AND name = 'Determinstic output';
UPDATE lessons SET meta_description = 'Test your CLI’s flags and argument combinations.' WHERE module_id = 6 AND name = 'e2e: Testing flags';
UPDATE lessons SET meta_description = 'Write reusable functions to simplify your tests.' WHERE module_id = 6 AND name = 'Creating test helpers';

-- Module 7: Commands, Signals, & Contexts
UPDATE lessons SET meta_description = 'Run external commands from your Go app.' WHERE module_id = 7 AND name = 'Executing commands';
UPDATE lessons SET meta_description = 'Pass data into commands through stdin.' WHERE module_id = 7 AND name = 'Passing in input';
UPDATE lessons SET meta_description = 'Fine-tune command execution with configuration.' WHERE module_id = 7 AND name = 'Configuring commands';
UPDATE lessons SET meta_description = 'Run processes concurrently with proper management.' WHERE module_id = 7 AND name = 'Asynchronous execution';
UPDATE lessons SET meta_description = 'Handle system signals like SIGINT and SIGTERM.' WHERE module_id = 7 AND name = 'Signals';
UPDATE lessons SET meta_description = 'Clean up and exit cleanly on shutdown.' WHERE module_id = 7 AND name = 'Graceful shutdown';
UPDATE lessons SET meta_description = 'Cancel long-running operations on demand.' WHERE module_id = 7 AND name = 'Cancellation';
UPDATE lessons SET meta_description = 'Use context for timeouts, cancellation, and deadlines.' WHERE module_id = 7 AND name = 'context.Context';
UPDATE lessons SET meta_description = 'Watch and manage spawned processes.' WHERE module_id = 7 AND name = 'Building a process guard';
UPDATE lessons SET meta_description = 'Open a text editor programmatically from Go.' WHERE module_id = 7 AND name = 'Opening an editor';
UPDATE lessons SET meta_description = 'Integrate fuzzy finding in your app with fzf.' WHERE module_id = 7 AND name = 'Fuzzing finding with fzf';

-- Module 8: Filesystem & Networking
UPDATE lessons SET meta_description = 'Explore file and network capabilities in Go.' WHERE module_id = 8 AND name = 'Introduction to Networking & Files';
UPDATE lessons SET meta_description = 'Open files with the right read/write/append flags.' WHERE module_id = 8 AND name = 'File flags';
UPDATE lessons SET meta_description = 'Manage file permission modes programmatically.' WHERE module_id = 8 AND name = 'File permissions';
UPDATE lessons SET meta_description = 'Recursively explore directories using filepath.Walk.' WHERE module_id = 8 AND name = 'Walking the filesystem';
UPDATE lessons SET meta_description = 'Prevent duplicate processes using lock/PID files.' WHERE module_id = 8 AND name = 'Lockfiles & PIDFiles';
UPDATE lessons SET meta_description = 'Implement file-level locking for shared access.' WHERE module_id = 8 AND name = 'File locks';
UPDATE lessons SET meta_description = 'Use Go’s net package to build basic network tools.' WHERE module_id = 8 AND name = 'The net package';
UPDATE lessons SET meta_description = 'Create a TCP client and connect to a server.' WHERE module_id = 8 AND name = 'TCP Client';
UPDATE lessons SET meta_description = 'Resolve hostnames to IPs using Go.' WHERE module_id = 8 AND name = 'DNS lookups';
UPDATE lessons SET meta_description = 'Build a simple port scanner to check open ports.' WHERE module_id = 8 AND name = 'Port scanning';
UPDATE lessons SET meta_description = 'Build HTTP clients and servers in Go.' WHERE module_id = 8 AND name = 'The net/http package';
UPDATE lessons SET meta_description = 'Handle JSON and other encoding formats.' WHERE module_id = 8 AND name = 'Marshaling & unmarshaling data';
UPDATE lessons SET meta_description = 'Send and serve files over HTTP.' WHERE module_id = 8 AND name = 'Sending files with HTTP';
UPDATE lessons SET meta_description = 'Write tests for your HTTP endpoints.' WHERE module_id = 8 AND name = 'Testing HTTP Requests';
