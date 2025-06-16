import { retrieve_lesson_by_id } from '$lib/api';
import type { PageLoad } from './$types';

export const load: PageLoad = async ({ fetch, params }) => {
    const { lesson_id } = params;

    if (!lesson_id) {
        return { lesson: null, course: null, error: new Error('Lesson ID is required') };
    }

    const lessonIdNum = Number(lesson_id);
    if (isNaN(lessonIdNum)) {
        return { lesson: null, course: null, error: new Error('Lesson ID must be a valid number') };
    }

    const { data: lesson, error } = await retrieve_lesson_by_id(lessonIdNum, fetch);

    if (error) {
        return {
            lesson: lesson,
            error: null
        };
    };
};
