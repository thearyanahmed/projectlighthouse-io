-- DELETE ALL EXISTING DATA FOR A FRESH START
DELETE FROM lessons;
DELETE FROM modules;
DELETE FROM courses;

-- Insert courses for each original module, with appropriate slugs and descriptions.
-- The lessons will then be linked to these new course IDs.

-- Course: Introduction
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Introduction to Go Command Line Applications',
  'introduction-to-go-cli-applications',
  'Get started with the fundamental concepts and environment setup for building command line applications in Go.',
  NULL, NULL, NULL, NULL, NULL,
  NOW(), NOW()
);

-- Lessons for Introduction (original module_id = 1)
-- Find the ID of the newly created 'introduction-to-go-cli-applications' course
INSERT INTO lessons (course_id, module_id, name, media_url, content, meta_name, meta_description, page_layout, watch_time)
SELECT
    (SELECT id FROM courses WHERE slug = 'introduction-to-go-cli-applications'),
    NULL, -- Module ID is now NULL as we're skipping the modules table
    name, media_url, content, meta_name, meta_description, page_layout, watch_time
FROM (VALUES
    ('Introduction to the course', NULL, NULL, NULL, NULL, 1, '02:59'),
    ('Welcome!', NULL, NULL, NULL, NULL, 1, '04:57'),
    ('Setting up your environment', NULL, NULL, NULL, NULL, 1, '15:28'),
    ('Go 101: Variables, Values & Types', NULL, NULL, NULL, NULL, 1, '24:34'),
    ('Go 101: Conditionals & Loops', NULL, NULL, NULL, NULL, 1, '19:26'),
    ('Go 101: Functions & Pointers', NULL, NULL, NULL, NULL, 1, '17:09'),
    ('Go 101: Packages', NULL, NULL, NULL, NULL, 1, '12:45')
) AS new_lessons (name, media_url, content, meta_name, meta_description, page_layout, watch_time);


-- Course: Counting Words
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Building a Word Counter in Go',
  'building-a-word-counter-in-go',
  'Learn to process text and count words, exploring file reading, testing, and algorithm optimization in Go.',
  NULL, NULL, NULL, NULL, NULL,
   NOW(), NOW()
);

-- Lessons for Counting Words (original module_id = 2)
INSERT INTO lessons (course_id, module_id, name, watch_time)
SELECT
    (SELECT id FROM courses WHERE slug = 'building-a-word-counter-in-go'),
    NULL, -- Module ID is now NULL
    name, watch_time
FROM (VALUES
    ('Starting a new project', '12:41'),
    ('Reading from a file', '11:23'),
    ('A Simple Word Counter', '09:31'),
    ('Writing tests', '15:35'),
    ('Edge cases', '10:35'),
    ('Table Driven Testing', '13:12'),
    ('A better algorithm', '15:23')
) AS new_lessons (name, watch_time);


-- Course: Input, Output, & Arguments
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Handling Input, Output, and Arguments in Go CLI',
  'handling-io-and-arguments-go-cli',
  'Master how to interact with the command line using standard input/output, exit codes, and argument parsing in Go.',
  NULL, NULL, NULL, NULL, NULL,
  NOW(), NOW()
);

-- Lessons for Input, Output, & Arguments (original module_id = 3)
INSERT INTO lessons (course_id, module_id, name, watch_time)
SELECT
    (SELECT id FROM courses WHERE slug = 'handling-io-and-arguments-go-cli'),
    NULL, -- Module ID is now NULL
    name, watch_time
FROM (VALUES
    ('Introduction to input', '02:19'),
    ('Exit codes', '05:39'),
    ('Standard error', '11:11'),
    ('Reading large files', '23:27'),
    ('Bytes & ascii', '15:13'),
    ('Unicode & Runes', '18:05'),
    ('The bufio package', '08:35'),
    ('Decoupling & io.Reader', '08:57'),
    ('Command line arguments', '09:09'),
    ('Handling multiple errors', '16:05'),
    ('Closing files with defer', '08:20'),
    ('Standard input', '08:04'),
    ('Scanning data', '19:46')
) AS new_lessons (name, watch_time);


-- Course: Adding Features
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Adding Advanced Features to Go CLI Applications',
  'adding-advanced-features-go-cli',
  'Expand your CLI tools by implementing new features, using methods, and organizing your Go code effectively.',
  NULL, NULL, NULL, NULL, NULL,
   NOW(), NOW()
);

-- Lessons for Adding Features (original module_id = 4)
INSERT INTO lessons (course_id, module_id, name, watch_time)
SELECT
    (SELECT id FROM courses WHERE slug = 'adding-advanced-features-go-cli'),
    NULL, -- Module ID is now NULL
    name, watch_time
FROM (VALUES
    ('Adding new features', '05:47'),
    ('Counting lines', '11:47'),
    ('Counting bytes', '10:32'),
    ('Encapsulation', '10:41'),
    ('File offsets and seeking', '18:45'),
    ('Methods', '17:04'),
    ('Variadic parameters', '07:01'),
    ('Method receivers', '11:48'),
    ('CLI flags', '25:13'),
    ('Single pass algorithm', '08:53'),
    ('Tabular output', '14:59'),
    ('Organizing our code', '13:31'),
    ('Package visibility', '09:22'),
    ('Constructor arguments', '06:41'),
    ('Whitebox vs Blackbox testing', '11:24')
) AS new_lessons (name, watch_time);


-- Course: Concurrency & Streams
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Concurrency and Streams in Go CLI',
  'concurrency-and-streams-go-cli',
  'Harness the power of Go routines, channels, and I/O streams to build highly concurrent and efficient CLI tools.',
  NULL, NULL, NULL, NULL, NULL,
  NOW(), NOW()
);

-- Lessons for Concurrency & Streams (original module_id = 5)
INSERT INTO lessons (course_id, module_id, name, watch_time)
SELECT
    (SELECT id FROM courses WHERE slug = 'concurrency-and-streams-go-cli'),
    NULL, -- Module ID is now NULL
    name, watch_time
FROM (VALUES
    ('Introduction to concurrency & data', '01:28'),
    ('Goroutines & Waitgroups', '12:02'),
    ('Channels', '12:47'),
    ('Handling async errors', '14:16'),
    ('io.TeeReader', '05:59'),
    ('io.Pipe', '07:59'),
    ('io.MultiWriter', '05:07')
) AS new_lessons (name, watch_time);


-- Course: Advanced Testing
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Advanced Testing Techniques for Go CLI',
  'advanced-testing-go-cli',
  'Explore comprehensive testing strategies, including benchmarks and end-to-end testing, for robust Go CLI applications.',
  NULL, NULL, NULL, NULL, NULL,
  NOW(), NOW()
);

-- Lessons for Advanced Testing (original module_id = 6)
INSERT INTO lessons (course_id, module_id, name, watch_time)
SELECT
    (SELECT id FROM courses WHERE slug = 'advanced-testing-go-cli'),
    NULL, -- Module ID is now NULL
    name, watch_time
FROM (VALUES
    ('Introduction to Advanced Testing', '01:09'),
    ('Benchmark testing', '09:26'),
    ('End to end testing (e2e)', '15:09'),
    ('e2e: Testing files', '13:05'),
    ('e2e: Multiple files', '17:50'),
    ('Determinstic output', '11:34'),
    ('e2e: Testing flags', '05:36'),
    ('Creating test helpers', '18:45')
) AS new_lessons (name, watch_time);


-- Course: Commands, Signals, & Contexts
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image, created_at, updated_at)
VALUES (
  'Managing Commands, Signals, and Contexts in Go CLI',
  'managing-commands-signals-contexts-go-cli',
  'Learn to execute external commands, handle system signals, and utilize contexts for graceful shutdowns in Go CLI apps.',
  NULL, NULL, NULL, NULL, NULL,
 NOW(), NOW()
);

-- Lessons for Commands, Signals, & Contexts (original module_id = 7)
INSERT INTO lessons (course_id, module_id, name, watch_time)
SELECT
    (SELECT id FROM courses WHERE slug = 'managing-commands-signals-contexts-go-cli'),
    NULL, -- Module ID is now NULL
    name, watch_time
FROM (VALUES
    ('Executing commands', '08:59'),
    ('Passing in input', '08:18'),
    ('Configuring commands', '09:20'),
    ('Asynchronous execution', '15:06'),
    ('Signals', '13:43'),
    ('Graceful shutdown', '07:24'),
    ('Cancellation', '17:02'),
    ('context.Context', '17:13'),
    ('Building a process guard', '22:30'),
    ('Opening an editor', '09:52'),
    ('Fuzzing finding with fzf', '09:31')
) AS new_lessons (name, watch_time);


-- Course: Filesystem & Networking
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Filesystem and Networking for Go CLI Applications',
  'filesystem-and-networking-go-cli',
  'Dive into interacting with the filesystem, managing file permissions and locks, and building network-aware Go CLI tools.',
  NULL, NULL, NULL, NULL, NULL,
   NOW(), NOW()
);

-- Lessons for Filesystem & Networking (original module_id = 8)
INSERT INTO lessons (course_id, module_id, name, watch_time)
SELECT
    (SELECT id FROM courses WHERE slug = 'filesystem-and-networking-go-cli'),
    NULL, -- Module ID is now NULL
    name, watch_time
FROM (VALUES
    ('Introduction to Networking & Files', '03:20'),
    ('File flags', '11:10'),
    ('File permissions', '20:20'),
    ('Walking the filesystem', '18:13'),
    ('Lockfiles & PIDFiles', '16:50'),
    ('File locks', '08:25'),
    ('The net package', '09:28'),
    ('TCP Client', '03:04'),
    ('DNS lookups', '03:17'),
    ('Port scanning', '07:26'),
    ('The net/http package', '17:32'),
    ('Marshaling & unmarshaling data', '15:31'),
    ('Sending files with HTTP', '08:05'),
    ('Testing HTTP Requests', '09:20')
) AS new_lessons (name, watch_time);


-- The remaining original modules (Powerful Command Line Applications, Popular CLI Packages, Final Project)
-- did not have associated lessons in the provided data. We will create courses for them.

-- Course: Powerful Command Line Applications
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Building Powerful Command Line Applications in Go',
  'building-powerful-cli-apps-go',
  'Explore advanced patterns and techniques to build highly powerful and robust command line applications with Go.',
  NULL, NULL, NULL, NULL, NULL,
 NOW(), NOW()
);

-- Course: Popular CLI Packages
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Popular Go CLI Packages and Libraries',
  'popular-go-cli-packages-libraries',
  'Discover and integrate essential third-party Go packages and libraries to accelerate your CLI development.',
  NULL, NULL, NULL, NULL, NULL,
   NOW(), NOW()
);

-- Course: Final Project
INSERT INTO courses (name, slug, description, thumbnail, seo_title, seo_description, seo_keywords, seo_image,  created_at, updated_at)
VALUES (
  'Go Command Line Application Final Project',
  'go-cli-application-final-project',
  'Apply all the learned concepts by building a comprehensive final project, solidifying your Go CLI development skills.',
  NULL, NULL, NULL, NULL, NULL,
   NOW(), NOW()
);
