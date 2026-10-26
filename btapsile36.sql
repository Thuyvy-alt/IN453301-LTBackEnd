BEGIN;

-- Khoá hàng khoá học để tránh 2 người cùng giành chỗ cuối
SELECT id, capacity FROM courses
WHERE title = 'Cơ sở dữ liệu' FOR UPDATE;

-- Còn chỗ (0/40) nên thêm Lê Chi vào khoá
INSERT INTO enrollments (member_id, course_id)
SELECT m.id, c.id
FROM members m, courses c
WHERE m.full_name = 'Lê Chi'
  AND c.title = 'Cơ sở dữ liệu';

COMMIT;
-- Câu 1 --
SELECT m.full_name, c.title
FROM enrollments e
JOIN members m ON m.id = e.member_id
JOIN courses c ON c.id = e.course_id
WHERE m.full_name = 'Lê Chi';

-- Câu 2 --
BEGIN;
-- Khoá hàng khoá học để tránh 2 người cùng giành chỗ cuối
SELECT id, capacity FROM courses
WHERE title = 'Cơ sở dữ liệu' FOR UPDATE;
-- Còn chỗ (0/40) nên thêm Lê Chi vào khoá
INSERT INTO enrollments (member_id, course_id)
SELECT m.id, c.id
FROM members m, courses c
WHERE m.full_name = 'Lê Chi'
AND c.title = 'Cơ sở dữ liệu';
COMMIT;

-- Câu 3 --
SELECT c.id AS course_id, m.full_name, c.title
FROM enrollments e
JOIN members m ON m.id = e.member_id
JOIN courses c ON c.id = e.course_id
WHERE m.full_name = 'Lê Chi';