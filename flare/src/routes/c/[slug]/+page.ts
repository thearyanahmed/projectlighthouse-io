import { get_healthz, retrieve_course_by_slug } from '$lib/api';
import type { PageLoad } from './$types';

export const load: PageLoad = async ({ fetch, params }) => {
    // const { data: course, error } = await retrieve_course_by_slug('cli-apps-go-not-found');

    // if (error) {
    //     return { lesson: null, health, course: null, error };
    // }

    return {

    };
};
