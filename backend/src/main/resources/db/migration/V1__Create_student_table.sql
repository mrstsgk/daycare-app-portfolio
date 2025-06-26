-- TODO : 性別のカラムを追加する
-- TODO : class情報を別テーブルに分ける
-- TODO : ageカラムを生年月日に変更する
-- TODO : familyテーブルを作成する
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    class_name VARCHAR(50) NOT NULL
);

INSERT INTO student (name, age, class_name) VALUES
('佐藤太郎', 5, 'ひまわり組'),
('鈴木花子', 4, 'さくら組'),
('田中誠', 5, 'ひまわり組'),
('山田優', 3, 'もも組'),
('伊藤健太', 4, 'さくら組'),
('渡辺美咲', 5, 'ひまわり組');