import { retrieve_course_by_slug } from '$lib/api';
import type { ViewCourseResponse } from '$lib/api_response_types';

export const load = async ({ params }) => {
    const result = await retrieve_course_by_slug(params.slug);

    if (result.error) {
        return { course: null, error: result.error };
    }

    return { course: result.data as ViewCourseResponse, error: null };
};
