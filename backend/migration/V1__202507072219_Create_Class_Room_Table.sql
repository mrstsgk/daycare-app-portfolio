-- クラスを定義するテーブルを作成
CREATE TABLE class_room
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    grade      INTEGER NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE class_room IS '保育園のクラス情報を管理するテーブル';
COMMENT ON COLUMN class_room.id IS 'クラスID（主キー）';
COMMENT ON COLUMN class_room.name IS 'クラス名（例：すみれ組、さくら組）';
COMMENT ON COLUMN class_room.grade IS '学年（0=0歳児、1=1歳児、2=2歳児、3=3歳児、4=4歳児、5=5歳児）';
COMMENT ON COLUMN class_room.created_at IS '作成日時';
COMMENT ON COLUMN class_room.updated_at IS '更新日時';

-- 法要件によりクラスの人数が決まっている
INSERT INTO class_room (name, grade, created_at, updated_at) VALUES
('すみれ組', 0, now(), now()), -- 3
('さくら組', 1, now(), now()), -- 6
('ひまわり組', 2, now(), now()), -- 6
('もも組', 3, now(), now()), -- 15
('たんぽぽ組', 4, now(), now()), -- 25
('うめ組', 5, now(), now()); --25