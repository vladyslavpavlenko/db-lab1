-- Issue Award For Completing 5 Courses --

CREATE TRIGGER trigger_five_courses_completed
AFTER UPDATE OF progress ON enrollments
FOR EACH ROW
WHEN (NEW.progress = 100)
EXECUTE FUNCTION issue_five_courses_completed_award();