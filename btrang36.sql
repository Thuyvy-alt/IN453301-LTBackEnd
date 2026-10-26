CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE enrollments (
    member_id INT REFERENCES members(id),
    course_id INT REFERENCES courses(id),
    PRIMARY KEY (member_id, course_id)
);

INSERT INTO members (full_name) VALUES
    ('Nguyễn An'), ('Trần Bình'), ('Lê Chi');

INSERT INTO courses (title, capacity) VALUES
    ('Lập trình Back End', 40),
    ('Mạng máy tính', 40),
    ('Cơ sở dữ liệu', 40);

INSERT INTO enrollments (member_id, course_id) VALUES
    (1, 1), (1, 2),
    (2, 1),
    (3, 2);