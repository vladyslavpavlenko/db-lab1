-- Insert Mock Data --

-- Mock User Types --
INSERT INTO user_types (title, created_at, updated_at)
VALUES
    ('Student', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Instructor', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Admin', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Users --
INSERT INTO users (profile_pic, first_name, last_name, email, password, user_type_id, created_at, updated_at)
VALUES
    ('user1.jpg', 'Alice', 'Johnson', 'alice@example.com', 'df9d3a07b97f4d623dd92ebeb780f3f6', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('user2.jpg', 'Bob', 'Smith', 'bob@example.com', 'fad0efc71ac49f1c88cec0cf91483e6c', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('user3.jpg', 'Charlie', 'Brown', 'charlie@example.com', 'ee7e044c2132474584b4975d3a77ac87', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('user4.jpg', 'Diana', 'Prince', 'diana@example.com', '6a803558a9e4ee8f2153c52af3f41456', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('user5.jpg', 'David', 'Sander', 'sander@plaja.com', '7f6f1c91da23666669ca81396fd3e0f1', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Course Statuses --
INSERT INTO course_statuses (title, created_at, updated_at)
VALUES
    ('Draft', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Published', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Submitted', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Suspended', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    -- Soft Delete --
    ('Unlisted', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Course Levels --
INSERT INTO course_levels (title, created_at, updated_at)
VALUES
    ('Beginner', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Intermediate', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Advanced', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Courses --
INSERT INTO courses (thumbnail, instructor_id, title, description, short_description, status_id, level_id, length, price, has_certificate, created_at, updated_at)
VALUES
    ('c++.jpg', 3, 'C++ Programming', 'Learn the basics of C++ programming', 'Introductory C++ course', 2, 1, 30, 100, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('go.jpg', 4, 'Go Language Fundamentals', 'Master the fundamentals of Go language', 'Learn Go basics', 2, 1, 25, 150, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('python.jpg', 3, 'Python for Beginners', 'Start your Python journey', 'Basic Python skills', 2, 1, 40, 120, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('rust.jpg', 4, 'Advanced Rust Programming', 'Deep dive into Rust programming', 'Advanced topics in Rust', 4, 3, 50, 200, FALSE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Course Certificates --
INSERT INTO course_certificates (user_id, course_id, created_at, updated_at)
VALUES
    (1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Enrollment Statuses --
INSERT INTO enrollment_statuses (title, created_at, updated_at)
VALUES
    ('Active', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Completed', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Course Exercise Types --
INSERT INTO course_exercise_types (title, created_at, updated_at)
VALUES
    ('Article', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Lecture', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Course Exercises --
INSERT INTO course_exercises (course_id, title, type_id, content, length, created_at, updated_at)
VALUES
    (1, 'C++ Basics', 2, 'content...', 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'Types in Go', 2, 'content...', 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'Python Mini Project', 1, 'content...', 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 'Rust Advanced Quiz', 2, 'content...', 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Enrollments --
INSERT INTO enrollments (user_id, course_id, progress, status_id, last_exercise_id, created_at, updated_at)
VALUES
    (1, 1, 50, 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 3, 100, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 2, 30, 1, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 2, 100, 2, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Course Categories --
INSERT INTO course_categories (title, created_at, updated_at)
VALUES
    ('Programming Languages', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Web Development', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Data Science', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Course Categories >-< Courses --
INSERT INTO course_categories_junction (course_id, category_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1);

-- Mock Course Reviews --
INSERT INTO course_reviews (user_id, course_id, rating, review, created_at, updated_at)
VALUES
    (1, 1, 4, 'Great introduction to C++!', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 3, 5, 'Loved this Python course. Very informative.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (1, 2, 3, 'Good, but could use more examples.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mock Awards --
INSERT INTO awards (title, description, created_at)
VALUES
    ('First Course Enrollment', 'Awarded for enrolling in the first course', CURRENT_TIMESTAMP),
    ('Five Courses Completed', 'Awarded for completing five courses', CURRENT_TIMESTAMP),
    ('Instructor Achievement', 'Awarded for becoming an instructor', CURRENT_TIMESTAMP);
-- Mock User Awards --
INSERT INTO user_awards (user_id, award_id, issued_at)
VALUES
    (1, 1, CURRENT_TIMESTAMP),
    (2, 1, CURRENT_TIMESTAMP),
    (3, 3, CURRENT_TIMESTAMP);

-- Mock Disputes --
INSERT INTO disputes (course_id, admin_id, comment, created_at, updated_at)
VALUES
	(4, 5, 'Course contains uncredited material that might be plagiarized. Please review the content.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);