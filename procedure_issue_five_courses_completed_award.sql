CREATE OR REPLACE FUNCTION issue_five_courses_completed_award()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM enrollments WHERE user_id = NEW.user_id AND progress = 100) = 5 THEN
        INSERT INTO user_awards (user_id, award_id, issued_at)
        VALUES (NEW.user_id, 2, CURRENT_TIMESTAMP);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;