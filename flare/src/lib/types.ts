export type User = {
    id: number;
    name: string;
    email: string;
    created_at: string;
    updated_at: string;
    google_id?: string | null;
    google_access_token?: string | null;
    google_refresh_token?: string | null;
    github_id?: string | null;
    github_access_token?: string | null;
    github_refresh_token?: string | null;
};

export type Course = {
    id: number;
    name: string;
    description: string;
    slug: string;
    locale: number;
    course_thumbnail?: string | null;
    meta_name?: string | null;
    meta_description?: string | null;
    meta_keywords?: string | null;
    meta_image?: string | null;
    meta_url?: string | null;
    price: string;
    page_layout: string;
    created_at: string;
    updated_at: string;

    chapters: Chapter[]
};

export type CourseCategory = {
    course_id: number;
    category_id: number;
};

export type CourseTag = {
    course_id: number;
    tag_id: number;
};

export type Chapter = {
    id: number;
    course_id: number;
    name: string;
    description?: string | null;
    created_at: string;
    updated_at: string;

    lessons: Lesson[];
};

export type Lesson = {
    id: number;
    course_id: number;
    chapter_id?: number | null;
    title: string;
    thumbnail?: string | null;
    media_content?: string | null;
    content: string;
    created_at: string;
    updated_at: string;
    meta_name?: string | null;
    meta_description?: string | null;
    meta_keywords?: string | null;
    meta_image?: string | null;
    page_layout: string;
    read_time?: string | null;
    watch_time?: string | null;
    abs_url?: string | null;
};

export type LessonTag = {
    lesson_id: number;
    tag_id: number;
};

export type Comment = {
    id: number;
    user_id: number;
    lesson_id: number;
    content: string;
    created_at: string;
    updated_at: string;
};

export type Question = {
    id: number;
    user_id: number;
    lesson_id: number;
    content: string;
    created_at: string;
    updated_at: string;
};

export type Answer = {
    id: number;
    user_id: number;
    lesson_id: number;
    content: string;
    created_at: string;
    updated_at: string;
};
