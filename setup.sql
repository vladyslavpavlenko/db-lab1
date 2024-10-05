-- Create Schema --

-- User Types --
CREATE TABLE user_types (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Users --
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    profile_pic VARCHAR,
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR UNIQUE,
    password VARCHAR,
    user_type_id INTEGER REFERENCES user_types(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Course Statuses --
CREATE TABLE course_statuses (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Course Levels --
CREATE TABLE course_levels (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Courses --
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    thumbnail VARCHAR,
    instructor_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    title VARCHAR,
    description VARCHAR,
    short_description VARCHAR,
    status_id INTEGER REFERENCES course_statuses(id),
    level_id INTEGER REFERENCES course_levels(id),
    length INTEGER,
    price INTEGER,
    has_certificate BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Course Certificates --
CREATE TABLE course_certificates (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    course_id INTEGER REFERENCES courses(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Enrollment Statuses --
CREATE TABLE enrollment_statuses (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Course Exercise Types --
CREATE TABLE course_exercise_types (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Course Exercises --
CREATE TABLE course_exercises (
    id SERIAL PRIMARY KEY,
    course_id INTEGER REFERENCES courses(id),
    title VARCHAR,
    type_id INTEGER REFERENCES course_exercise_types(id),
    content VARCHAR,
    length INTEGER,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Enrollments --
CREATE TABLE enrollments (
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES courses(id),
    progress INTEGER,
    status_id INTEGER REFERENCES enrollment_statuses(id) ON DELETE SET NULL,
    last_exercise_id INTEGER REFERENCES course_exercises(id) ON DELETE SET NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (user_id, course_id)
);

-- Course Categories --
CREATE TABLE course_categories (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Course Categories Junction Table --
CREATE TABLE course_categories_junction (
    course_id INTEGER REFERENCES courses(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES course_categories(id) ON DELETE CASCADE,
    PRIMARY KEY (course_id, category_id)
);

-- Course Reviews --
CREATE TABLE course_reviews (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES courses(id),
    rating INTEGER,
    review VARCHAR,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Awards --
CREATE TABLE awards (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    description VARCHAR,
    created_at TIMESTAMP
);

-- User Awards --
CREATE TABLE user_awards (
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    award_id INTEGER REFERENCES awards(id) ON DELETE CASCADE,
    issued_at TIMESTAMP,
    PRIMARY KEY (user_id, award_id)
);


-- Disputes --
CREATE TABLE disputes (
    id SERIAL PRIMARY KEY,
    course_id INTEGER REFERENCES courses(id),
    admin_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    comment VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);