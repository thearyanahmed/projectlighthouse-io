import { fakeCourse } from '$lib/fake';
import type { Course } from '$lib/types';
import type { LayoutServerLoad } from './$types';

export const load: LayoutServerLoad = async () => {

    const course: Course = await new Promise((resolve) => setTimeout(() => resolve(fakeCourse()), 500));

    return {
        course,
    };
};
