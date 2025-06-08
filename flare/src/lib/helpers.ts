import type { ViewCourseResponse } from "./api_response_types";

export type CourseMetadataCount = {
    lessons: number;
    modules: number;
    total_duration: string;
}

export function course_metadata_count(course: ViewCourseResponse): CourseMetadataCount {
    const lessons = course.modules.reduce((acc, module) => acc + module.lessons.length, 0);
    const modules = course.modules.length;

    // Calculate total duration in a human-readable format
    const totalDuration = course.modules.reduce((acc, module) => {
        return acc + module.lessons.reduce((lessonAcc, lesson) => {
            const duration = parse_duration(lesson.watch_time || "0:00");
            return lessonAcc + duration;
        }, 0);
    }, 0);

    return {
        lessons,
        modules,
        total_duration: format_duration(totalDuration)
    };
}

function parse_duration(durationStr: string): number {
    // Expects format "mm:ss" or "h:mm:ss"
    const parts = durationStr.split(":").map(Number);
    if (parts.length === 2) {
        // mm:ss
        const [minutes, seconds] = parts;
        return minutes * 60 + seconds;
    } else if (parts.length === 3) {
        // h:mm:ss
        const [hours, minutes, seconds] = parts;
        return hours * 3600 + minutes * 60 + seconds;
    }
    return 0;
}

function format_duration(totalDuration: number): string {
    const hours = Math.floor(totalDuration / 3600);
    const minutes = Math.floor((totalDuration % 3600) / 60);
    const seconds = totalDuration % 60;

    const parts: string[] = [];
    if (hours > 0) {
        parts.push(`${hours}h`);
    }
    if (minutes > 0 || hours > 0) { // Show minutes if there are hours
        parts.push(`${minutes}m`);
    }
    parts.push(`${seconds}s`);

    return parts.join(" ");
}

