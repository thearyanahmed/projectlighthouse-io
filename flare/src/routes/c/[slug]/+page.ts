import { fakeCourse } from '$lib/fake';
import type { Lesson } from '$lib/types';
import type { PageLoad } from './$types';

export const load: PageLoad = async ({ fetch, params }) => {

    const res = await fetch(`http://127.0.0.1:8000/healthz`);
    if (!res.ok) {
        throw new Error('Failed to fetch health information');
    }
    const health = await res.json();

    const course = fakeCourse();

    const lesson: Lesson = await new Promise((resolve) => setTimeout(() => resolve(course.chapters[0].lessons[0]), 500));

    return {
        lesson,
        health,
    };
};
