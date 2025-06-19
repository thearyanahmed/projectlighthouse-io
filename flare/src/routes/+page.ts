import { retrieve_all_courses } from '$lib/api';
import type { ViewAllCoursesResponse, ViewSingleCourseResponse } from '$lib/api_response_types';

export const load = async ({ fetch }) => {
    const result = await retrieve_all_courses(fetch);

    if (result.error) {
        return { courses: [], error: result.error } as { courses: ViewSingleCourseResponse[]; error: unknown };
    }

    return { courses: result.data, error: null } as ViewAllCoursesResponse;
};
