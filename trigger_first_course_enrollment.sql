-- Issue Award For The First Course Enrollment --

CREATE TRIGGER trigger_first_course_enrollment
AFTER INSERT ON enrollments
FOR EACH ROW
EXECUTE FUNCTION issue_first_course_enrollment_award();