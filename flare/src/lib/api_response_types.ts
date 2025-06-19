export type ViewCourseResponse = {
    id: number;
    name: string;
    slug: string;
    description: string;
    thumbnail: string | null;

    seo_title: string | null;
    seo_description: string | null;
    seo_keywords: string | null;
    seo_image: string | null;

    published_at: string | null; // ISO date string
    created_at: string | null;   // ISO date string
    updated_at: string | null;   // ISO date string

    lessons: ViewLessonResponse[];

};

export type ViewLessonResponse = {
    id: number;
    course_id: number;
    module_id: number;
    name: string;
    media_url: string | null;
    content: string | null;

    created_at: string | null;   // ISO date string
    updated_at: string | null;   // ISO date string
    deleted_at: string | null;   // ISO date string

    meta_name: string | null;
    meta_description: string | null;
    meta_keywords: string | null;
    meta_image: string | null;

    page_layout: number;

    read_time: string | null;
    watch_time: string | null;
};
