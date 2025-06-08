-- Insert the course
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image, published_at, created_at, updated_at)
VALUES (
  'Command Line Applications in Go',
  'cli-apps-go',
  'Learn Go by building powerful CLI tools—from file handling to TUI apps and networking.',
  NULL, NULL, NULL, NULL, NULL,
  NOW(), NOW(), NOW()
);

-- Assume the inserted course gets ID = 1

-- Insert modules (positions 0–10)
INSERT INTO modules (course_id, name, position) VALUES
(1, 'Introduction', 0),
(1, 'Counting Words', 1),
(1, 'Input, Output, & Arguments', 2),
(1, 'Adding Features', 3),
(1, 'Concurrency & Streams', 4),
(1, 'Advanced Testing', 5),
(1, 'Commands, Signals, & Contexts', 6),
(1, 'Filesystem & Networking', 7),
(1, 'Powerful Command Line Applications', 8),
(1, 'Popular CLI Packages', 9),
(1, 'Final Project', 10);

-- For lessons we need module IDs; assume auto IDs 1–11 in creation order.
-- Introduction (module_id = 1)
INSERT INTO lessons (course_id, module_id, name, media_url, content, meta_name, meta_description, page_layout, watch_time)
VALUES
(1, 1, 'Introduction to the course', NULL, NULL, NULL, NULL, 1, '02:59'),
(1, 1, 'Welcome!', NULL, NULL, NULL, NULL, 1, '04:57'),
(1, 1, 'Setting up your environment', NULL, NULL, NULL, NULL, 1, '15:28'),
(1, 1, 'Go 101: Variables, Values & Types', NULL, NULL, NULL, NULL, 1, '24:34'),
(1, 1, 'Go 101: Conditionals & Loops', NULL, NULL, NULL, NULL, 1, '19:26'),
(1, 1, 'Go 101: Functions & Pointers', NULL, NULL, NULL, NULL, 1, '17:09'),
(1, 1, 'Go 101: Packages', NULL, NULL, NULL, NULL, 1, '12:45');

-- Counting Words (module_id = 2)
INSERT INTO lessons (course_id, module_id, name, watch_time)
VALUES
(1, 2, 'Starting a new project', '12:41'),
(1, 2, 'Reading from a file', '11:23'),
(1, 2, 'A Simple Word Counter', '09:31'),
(1, 2, 'Writing tests', '15:35'),
(1, 2, 'Edge cases', '10:35'),
(1, 2, 'Table Driven Testing', '13:12'),
(1, 2, 'A better algorithm', '15:23');

-- Input, Output, & Arguments (module_id = 3)
INSERT INTO lessons (course_id, module_id, name, watch_time) VALUES
(1, 3, 'Introduction to input', '02:19'),
(1, 3, 'Exit codes', '05:39'),
(1, 3, 'Standard error', '11:11'),
(1, 3, 'Reading large files', '23:27'),
(1, 3, 'Bytes & ascii', '15:13'),
(1, 3, 'Unicode & Runes', '18:05'),
(1, 3, 'The bufio package', '08:35'),
(1, 3, 'Decoupling & io.Reader', '08:57'),
(1, 3, 'Command line arguments', '09:09'),
(1, 3, 'Handling multiple errors', '16:05'),
(1, 3, 'Closing files with defer', '08:20'),
(1, 3, 'Standard input', '08:04'),
(1, 3, 'Scanning data', '19:46');

-- Adding Features (module_id = 4)
INSERT INTO lessons (course_id, module_id, name, watch_time) VALUES
(1, 4, 'Adding new features', '05:47'),
(1, 4, 'Counting lines', '11:47'),
(1, 4, 'Counting bytes', '10:32'),
(1, 4, 'Encapsulation', '10:41'),
(1, 4, 'File offsets and seeking', '18:45'),
(1, 4, 'Methods', '17:04'),
(1, 4, 'Variadic parameters', '07:01'),
(1, 4, 'Method receivers', '11:48'),
(1, 4, 'CLI flags', '25:13'),
(1, 4, 'Single pass algorithm', '08:53'),
(1, 4, 'Tabular output', '14:59'),
(1, 4, 'Organizing our code', '13:31'),
(1, 4, 'Package visibility', '09:22'),
(1, 4, 'Constructor arguments', '06:41'),
(1, 4, 'Whitebox vs Blackbox testing', '11:24');

-- Concurrency & Streams (module_id = 5)
INSERT INTO lessons (course_id, module_id, name, watch_time) VALUES
(1, 5, 'Introduction to concurrency & data', '01:28'),
(1, 5, 'Goroutines & Waitgroups', '12:02'),
(1, 5, 'Channels', '12:47'),
(1, 5, 'Handling async errors', '14:16'),
(1, 5, 'io.TeeReader', '05:59'),
(1, 5, 'io.Pipe', '07:59'),
(1, 5, 'io.MultiWriter', '05:07');

-- Advanced Testing (module_id = 6)
INSERT INTO lessons (course_id, module_id, name, watch_time) VALUES
(1, 6, 'Introduction to Advanced Testing', '01:09'),
(1, 6, 'Benchmark testing', '09:26'),
(1, 6, 'End to end testing (e2e)', '15:09'),
(1, 6, 'e2e: Testing files', '13:05'),
(1, 6, 'e2e: Multiple files', '17:50'),
(1, 6, 'Determinstic output', '11:34'),
(1, 6, 'e2e: Testing flags', '05:36'),
(1, 6, 'Creating test helpers', '18:45');

-- Commands, Signals, & Contexts (module_id = 7)
INSERT INTO lessons (course_id, module_id, name, watch_time) VALUES
(1, 7, 'Executing commands', '08:59'),
(1, 7, 'Passing in input', '08:18'),
(1, 7, 'Configuring commands', '09:20'),
(1, 7, 'Asynchronous execution', '15:06'),
(1, 7, 'Signals', '13:43'),
(1, 7, 'Graceful shutdown', '07:24'),
(1, 7, 'Cancellation', '17:02'),
(1, 7, 'context.Context', '17:13'),
(1, 7, 'Building a process guard', '22:30'),
(1, 7, 'Opening an editor', '09:52'),
(1, 7, 'Fuzzing finding with fzf', '09:31');

-- Filesystem & Networking (module_id = 8)
INSERT INTO lessons (course_id, module_id, name, watch_time) VALUES
(1, 8, 'Introduction to Networking & Files', '03:20'),
(1, 8, 'File flags', '11:10'),
(1, 8, 'File permissions', '20:20'),
(1, 8, 'Walking the filesystem', '18:13'),
(1, 8, 'Lockfiles & PIDFiles', '16:50'),
(1, 8, 'File locks', '08:25'),
(1, 8, 'The net package', '09:28'),
(1, 8, 'TCP Client', '03:04'),
(1, 8, 'DNS lookups', '03:17'),
(1, 8, 'Port scanning', '07:26'),
(1, 8, 'The net/http package', '17:32'),
(1, 8, 'Marshaling & unmarshaling data', '15:31'),
(1, 8, 'Sending files with HTTP', '08:05'),
(1, 8, 'Testing HTTP Requests', '09:20');

-- The remaining modules are "Coming Soon" with no published lessons yet.
