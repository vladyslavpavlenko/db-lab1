-- Function to Calculate Total Earnings of an Instructor --

CREATE OR REPLACE FUNCTION calculate_instructor_earnings(i_id INT)
RETURNS NUMERIC
AS $$
DECLARE
    total_earnings NUMERIC := 0;
BEGIN
    SELECT COALESCE(SUM(price * (SELECT COUNT(*) FROM enrollments WHERE course_id = courses.id)), 0)
    INTO total_earnings
    FROM courses
    WHERE instructor_id = i_id;

    RETURN total_earnings;
END;
$$ LANGUAGE plpgsql;