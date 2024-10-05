CREATE OR REPLACE FUNCTION issue_instructor_achievement_award()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.user_type_id = 2 THEN
        INSERT INTO user_awards (user_id, award_id, issued_at)
        VALUES (NEW.id, 3, CURRENT_TIMESTAMP);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;