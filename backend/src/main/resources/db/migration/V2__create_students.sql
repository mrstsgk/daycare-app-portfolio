CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER NOT NULL,
    class_name VARCHAR(50) NOT NULL
);

INSERT INTO students (name, age, class_name) VALUES
('佐藤太郎', 5, 'ひまわり組'),
('鈴木花子', 4, 'さくら組'),
('田中誠', 5, 'ひまわり組'),
('山田優', 3, 'もも組'),
('伊藤健太', 4, 'さくら組'); 