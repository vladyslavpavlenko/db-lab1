-- Issue Award For Becoming Instructor --

CREATE TRIGGER trigger_instructor_achievement
AFTER INSERT OR UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION issue_instructor_achievement_award();