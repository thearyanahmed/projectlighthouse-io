// import type { LayoutServerLoad } from './$types';
// import { retrieve_course_by_slug } from '$lib/api';
// import type { ViewCourseResponse } from '$lib/api_response_types';

// export const load: LayoutServerLoad = async ({ params }) => {
//     const result = await retrieve_course_by_slug('cli-apps-go');

//     if (result.error) {
//         return { course: null, error: result.error };
//     }

//     return { course: result.data as ViewCourseResponse, error: null };
// };
