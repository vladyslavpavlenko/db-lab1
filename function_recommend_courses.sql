-- Function to Recommend Courses Based on Completed Levels --

CREATE OR REPLACE FUNCTION recommend_courses(u_id INT)
RETURNS TABLE (course_title VARCHAR)
AS $$
BEGIN
    RETURN QUERY
    SELECT title
    FROM courses
    WHERE level_id = (
        SELECT MIN(level_id) + 1
        FROM enrollments e
        JOIN courses c ON e.course_id = c.id
        WHERE e.user_id = u_id AND e.progress = 100
    )
    AND id NOT IN (
        SELECT course_id
        FROM enrollments
        WHERE user_id = u_id
    );
END;
$$ LANGUAGE plpgsql;