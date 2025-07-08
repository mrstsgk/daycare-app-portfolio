CREATE TABLE employee
(
    id         SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    telephone   VARCHAR(15) NOT NULL,
    admin       BOOLEAN     NOT NULL,
    class_room_id INTEGER REFERENCES class_room(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE INDEX employee_class_room_id_idx ON employee (class_room_id);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE employee IS '保育園の職員情報を管理するテーブル';
COMMENT ON COLUMN employee.id IS '職員ID（主キー）';
COMMENT ON COLUMN employee.name IS '職員名';
COMMENT ON COLUMN employee.email IS 'メールアドレス';
COMMENT ON COLUMN employee.telephone IS '電話番号';
COMMENT ON COLUMN employee.admin IS '管理者フラグ（TRUE=管理者、FALSE=一般職員）';
COMMENT ON COLUMN employee.class_room_id IS '担当クラスID（外部キー、NULLの場合は特定のクラスに所属しない）';
COMMENT ON COLUMN employee.created_at IS '作成日時';
COMMENT ON COLUMN employee.updated_at IS '更新日時';

INSERT INTO employee (name, email, telephone, admin, class_room_id, created_at, updated_at)
VALUES
('佐藤太郎', 'admin@example.com', '000-0000-0000', TRUE, null, now(), now()),
('鈴木花子', 'hanako@example.com', '111-1111-1111', FALSE, 1, now(), now()),
('田中誠', 'tanaka@example.com', '222-2222-2222', FALSE, 2, now(), now()),
('山田優', 'yamada@example.com', '333-3333-3333', FALSE, 3, now(), now()),
('伊藤健太', 'itou@example.com', '444-4444-4444', FALSE, 4, now(), now()),
('渡辺美咲', 'watanabe@example.com', '555-5555-5555', FALSE, 5, now(), now()),
('中村一郎', 'nakamura@example.com', '666-6666-6666', FALSE, 6, now(), now());