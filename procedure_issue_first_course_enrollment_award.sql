CREATE OR REPLACE FUNCTION issue_first_course_enrollment_award()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM enrollments WHERE user_id = NEW.user_id) = 0 THEN
        INSERT INTO user_awards (user_id, award_id, issued_at)
        VALUES (NEW.user_id, 1, CURRENT_TIMESTAMP);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;