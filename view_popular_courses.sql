-- Popular Courses Overview View --

CREATE OR REPLACE VIEW popular_courses AS
SELECT
    c.id AS course_id,
    c.title AS course_title,
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name,
    COUNT(e.user_id) AS total_enrollments,
    AVG(cr.rating) AS average_rating,
    c.created_at AS course_created_at,
    c.price AS course_price
FROM
    courses c
LEFT JOIN users i ON c.instructor_id = i.id
LEFT JOIN enrollments e ON c.id = e.course_id
LEFT JOIN course_reviews cr ON c.id = cr.course_id
GROUP BY
    c.id,
    c.title,
    i.first_name,
    i.last_name,
    c.created_at,
    c.price
ORDER BY
    total_enrollments DESC,
    average_rating DESC;