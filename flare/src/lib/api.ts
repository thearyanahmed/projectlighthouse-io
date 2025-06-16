import type { ViewCourseResponse, ViewLessonResponse } from "./api_response_types";
import type { Healthz } from "./types";

const BASE_URL = import.meta.env.VITE_API_BASE_URL
type ApiResult<T> = { data: T; error: null } | { data: null; error: Error };

export async function get<T>(path: string, fetch: Fetch): Promise<ApiResult<T>> {
    const fullpath = `${BASE_URL}/${path}`;

    try {
        const res = await fetch(fullpath);

        let body;

        if (!res.ok) {
            body = await res.text();

            let error = null;

            error = new Error(body || res.statusText)

            return {
                data: null,
                error,
            };
        }

        if (res.status >= 400) {
            body = await res.text();
            return {
                data: null,
                error: new Error(body || res.statusText),
            };
        }

        const data = (await res.json()) as T;

        return { data, error: null };
    } catch (err) {
        return {
            data: null,
            error: err as Error || new Error("Unknown fetch error"),
        };
    }
}

export async function get_healthz(fetch: Fetch): Promise<ApiResult<Healthz>> {
    return get<Healthz>('healthz', fetch);
}

export async function retrieve_course_by_slug(slug: string, fetch: Fetch): Promise<ApiResult<ViewCourseResponse>> {
    return get<ViewCourseResponse>('courses/' + slug, fetch);
}

type Fetch = (input: RequestInfo | URL, init?: RequestInit) => Promise<Response>;

export async function retrieve_lesson_by_id(id: number, fetch: Fetch): Promise<ApiResult<ViewLessonResponse>> {
    return get<ViewLessonResponse>('lessons/' + id, fetch);
}
