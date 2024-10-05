-- Extended Enrollments View --
CREATE VIEW extended_enrollments AS
SELECT
    u.id AS user_id,
    u.first_name,
    u.last_name,
    c.id AS course_id,
    c.title AS course_title,
    e.progress,
    es.title AS status
FROM enrollments e
JOIN users u ON e.user_id = u.id
JOIN courses c ON e.course_id = c.id
JOIN enrollment_statuses es ON e.status_id = es.id;