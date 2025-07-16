CREATE TABLE employee
(
    id          SERIAL PRIMARY KEY,
    code        VARCHAR(50) NOT NULL UNIQUE,
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
COMMENT ON COLUMN employee.code IS '職員コード（ユニーク）';
COMMENT ON COLUMN employee.name IS '職員名';
COMMENT ON COLUMN employee.email IS 'メールアドレス';
COMMENT ON COLUMN employee.telephone IS '電話番号';
COMMENT ON COLUMN employee.admin IS '管理者フラグ（TRUE=管理者、FALSE=一般職員）';
COMMENT ON COLUMN employee.class_room_id IS '担当クラスID（外部キー、NULLの場合は特定のクラスに所属しない）';
COMMENT ON COLUMN employee.created_at IS '作成日時';
COMMENT ON COLUMN employee.updated_at IS '更新日時';

INSERT INTO employee (code, name, email, telephone, admin, class_room_id, created_at, updated_at)
VALUES
('Kanri', '管理太郎', 'admin@example.com', '000-0000-0000', TRUE, null, now(), now()),
('Sasaki', '佐々木花子', 'sasaki@example.com', '111-1111-1111', FALSE, 1, now(), now()),
('Nakata', '中田誠', 'nakata@example.com', '222-2222-2222', FALSE, 2, now(), now()),
('Tayama', '田山優', 'tayama@example.com', '333-3333-3333', FALSE, 3, now(), now()),
('Date', '伊達健太', 'date@example.com', '444-4444-4444', FALSE, 4, now(), now()),
('Watabe', '渡部美咲', 'watabe@example.com', '555-5555-5555', FALSE, 5, now(), now()),
('Nakai', '中井一郎', 'nakai@example.com', '666-6666-6666', FALSE, 6, now(), now());