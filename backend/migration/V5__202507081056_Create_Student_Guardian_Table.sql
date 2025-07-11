-- 園児と保護者の関係を管理する中間テーブル
CREATE TABLE student_guardian
(
    id            SERIAL PRIMARY KEY,
    student_id    INTEGER NOT NULL REFERENCES student (id) ON DELETE CASCADE,
    guardian_id   INTEGER NOT NULL REFERENCES guardian (id) ON DELETE CASCADE,
    guardian_type INTEGER NOT NULL,
    is_primary    BOOLEAN DEFAULT FALSE,
    created_at    TIMESTAMP,
    updated_at    TIMESTAMP,
    UNIQUE (student_id, guardian_id)
);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE student_guardian IS '園児と保護者の関係を管理する中間テーブル';
COMMENT ON COLUMN student_guardian.id IS '中間テーブルID（主キー）';
COMMENT ON COLUMN student_guardian.student_id IS '園児ID（外部キー）';
COMMENT ON COLUMN student_guardian.guardian_id IS '保護者ID（外部キー）';
COMMENT ON COLUMN student_guardian.guardian_type IS '保護者の種類（1=父親、2=母親、3=祖母、4=祖父）';
COMMENT ON COLUMN student_guardian.is_primary IS '主保護者フラグ（TRUE=主保護者、FALSE=副保護者）';

INSERT INTO student_guardian (student_id, guardian_id, guardian_type, is_primary, created_at, updated_at)
VALUES
-- Student 1-80 に Guardian 1-80 を1対1で紐づけ（主保護者）
(1, 1, 2, TRUE, now(), now()),   -- 母親（主）
(2, 2, 1, TRUE, now(), now()),   -- 父親（主）
(3, 3, 2, TRUE, now(), now()),   -- 母親（主）
(4, 4, 1, TRUE, now(), now()),   -- 父親（主）
(5, 5, 2, TRUE, now(), now()),   -- 母親（主）
(6, 6, 1, TRUE, now(), now()),   -- 父親（主）
(7, 7, 2, TRUE, now(), now()),   -- 母親（主）
(8, 8, 1, TRUE, now(), now()),   -- 父親（主）
(9, 9, 2, TRUE, now(), now()),   -- 母親（主）
(10, 10, 1, TRUE, now(), now()), -- 父親（主）
(11, 11, 2, TRUE, now(), now()), -- 母親（主）
(12, 12, 1, TRUE, now(), now()), -- 父親（主）
(13, 13, 2, TRUE, now(), now()), -- 母親（主）
(14, 14, 1, TRUE, now(), now()), -- 父親（主）
(15, 15, 2, TRUE, now(), now()), -- 母親（主）
(16, 16, 1, TRUE, now(), now()), -- 父親（主）
(17, 17, 2, TRUE, now(), now()), -- 母親（主）
(18, 18, 1, TRUE, now(), now()), -- 父親（主）
(19, 19, 2, TRUE, now(), now()), -- 母親（主）
(20, 20, 1, TRUE, now(), now()), -- 父親（主）
(21, 21, 2, TRUE, now(), now()), -- 母親（主）
(22, 22, 1, TRUE, now(), now()), -- 父親（主）
(23, 23, 2, TRUE, now(), now()), -- 母親（主）
(24, 24, 1, TRUE, now(), now()), -- 父親（主）
(25, 25, 2, TRUE, now(), now()), -- 母親（主）
(26, 26, 1, TRUE, now(), now()), -- 父親（主）
(27, 27, 2, TRUE, now(), now()), -- 母親（主）
(28, 28, 1, TRUE, now(), now()), -- 父親（主）
(29, 29, 2, TRUE, now(), now()), -- 母親（主）
(30, 30, 1, TRUE, now(), now()), -- 父親（主）
(31, 31, 2, TRUE, now(), now()), -- 母親（主）
(32, 32, 1, TRUE, now(), now()), -- 父親（主）
(33, 33, 2, TRUE, now(), now()), -- 母親（主）
(34, 34, 1, TRUE, now(), now()), -- 父親（主）
(35, 35, 2, TRUE, now(), now()), -- 母親（主）
(36, 36, 1, TRUE, now(), now()), -- 父親（主）
(37, 37, 2, TRUE, now(), now()), -- 母親（主）
(38, 38, 1, TRUE, now(), now()), -- 父親（主）
(39, 39, 2, TRUE, now(), now()), -- 母親（主）
(40, 40, 1, TRUE, now(), now()), -- 父親（主）
(41, 41, 2, TRUE, now(), now()), -- 母親（主）
(42, 42, 1, TRUE, now(), now()), -- 父親（主）
(43, 43, 2, TRUE, now(), now()), -- 母親（主）
(44, 44, 1, TRUE, now(), now()), -- 父親（主）
(45, 45, 2, TRUE, now(), now()), -- 母親（主）
(46, 46, 1, TRUE, now(), now()), -- 父親（主）
(47, 47, 2, TRUE, now(), now()), -- 母親（主）
(48, 48, 1, TRUE, now(), now()), -- 父親（主）
(49, 49, 2, TRUE, now(), now()), -- 母親（主）
(50, 50, 1, TRUE, now(), now()), -- 父親（主）
(51, 51, 2, TRUE, now(), now()), -- 母親（主）
(52, 52, 1, TRUE, now(), now()), -- 父親（主）
(53, 53, 2, TRUE, now(), now()), -- 母親（主）
(54, 54, 1, TRUE, now(), now()), -- 父親（主）
(55, 55, 2, TRUE, now(), now()), -- 母親（主）
(56, 56, 1, TRUE, now(), now()), -- 父親（主）
(57, 57, 2, TRUE, now(), now()), -- 母親（主）
(58, 58, 1, TRUE, now(), now()), -- 父親（主）
(59, 59, 2, TRUE, now(), now()), -- 母親（主）
(60, 60, 1, TRUE, now(), now()), -- 父親（主）
(61, 61, 2, TRUE, now(), now()), -- 母親（主）
(62, 62, 1, TRUE, now(), now()), -- 父親（主）
(63, 63, 2, TRUE, now(), now()), -- 母親（主）
(64, 64, 1, TRUE, now(), now()), -- 父親（主）
(65, 65, 2, TRUE, now(), now()), -- 母親（主）
(66, 66, 1, TRUE, now(), now()), -- 父親（主）
(67, 67, 2, TRUE, now(), now()), -- 母親（主）
(68, 68, 1, TRUE, now(), now()), -- 父親（主）
(69, 69, 2, TRUE, now(), now()), -- 母親（主）
(70, 70, 1, TRUE, now(), now()), -- 父親（主）
(71, 71, 2, TRUE, now(), now()), -- 母親（主）
(72, 72, 1, TRUE, now(), now()), -- 父親（主）
(73, 73, 2, TRUE, now(), now()), -- 母親（主）
(74, 74, 1, TRUE, now(), now()), -- 父親（主）
(75, 75, 2, TRUE, now(), now()), -- 母親（主）
(76, 76, 1, TRUE, now(), now()), -- 父親（主）
(77, 77, 2, TRUE, now(), now()), -- 母親（主）
(78, 78, 1, TRUE, now(), now()), -- 父親（主）
(79, 79, 2, TRUE, now(), now()), -- 母親（主）
(80, 80, 1, TRUE, now(), now()), -- 父親（主）

-- 余った Guardian 81-100 を Student 1-20 に追加で紐づけ（副保護者）
(1, 81, 1, FALSE, now(), now()),  -- 父親（副）
(2, 82, 2, FALSE, now(), now()),  -- 母親（副）
(3, 83, 1, FALSE, now(), now()),  -- 父親（副）
(4, 84, 2, FALSE, now(), now()),  -- 母親（副）
(5, 85, 1, FALSE, now(), now()),  -- 父親（副）
(6, 86, 2, FALSE, now(), now()),  -- 母親（副）
(7, 87, 1, FALSE, now(), now()),  -- 父親（副）
(8, 88, 2, FALSE, now(), now()),  -- 母親（副）
(9, 89, 1, FALSE, now(), now()),  -- 父親（副）
(10, 90, 2, FALSE, now(), now()), -- 母親（副）
(11, 91, 1, FALSE, now(), now()), -- 父親（副）
(12, 92, 2, FALSE, now(), now()), -- 母親（副）
(13, 93, 1, FALSE, now(), now()), -- 父親（副）
(14, 94, 2, FALSE, now(), now()), -- 母親（副）
(15, 95, 1, FALSE, now(), now()), -- 父親（副）
(16, 96, 2, FALSE, now(), now()), -- 母親（副）
(17, 97, 1, FALSE, now(), now()), -- 父親（副）
(18, 98, 2, FALSE, now(), now()), -- 母親（副）
(19, 99, 1, FALSE, now(), now()), -- 父親（副）
(20, 100, 2, FALSE, now(), now());-- 母親（副）
