CREATE TABLE student_guardian
(
    id            SERIAL PRIMARY KEY,
    student_id    INTEGER NOT NULL REFERENCES student (id) ON DELETE CASCADE,
    guardian_id   INTEGER NOT NULL REFERENCES "user" (id) ON DELETE CASCADE,
    guardian_type INTEGER NOT NULL,
    is_primary    BOOLEAN,
    created_at    TIMESTAMP NOT NULL,
    updated_at    TIMESTAMP,
    UNIQUE (student_id, guardian_id)
);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE student_guardian IS '園児と保護者の関係を管理する中間テーブル';
COMMENT ON COLUMN student_guardian.id IS '中間テーブルID（主キー）';
COMMENT ON COLUMN student_guardian.student_id IS '園児ID（外部キー）';
COMMENT ON COLUMN student_guardian.guardian_id IS '保護者ID（外部キー、user.id）';
COMMENT ON COLUMN student_guardian.guardian_type IS '保護者の種類（1=父親、2=母親、3=祖母、4=祖父）';
COMMENT ON COLUMN student_guardian.is_primary IS '主保護者フラグ（TRUE=主保護者、FALSE=副保護者）';

INSERT INTO student_guardian (student_id, guardian_id, guardian_type, is_primary, created_at, updated_at)
VALUES
-- Student 1-80 に Guardian 1001-1080 を1対1で紐づけ（主保護者）
(1, 1001, 2, TRUE, now(), now()),   -- 母親（主）
(2, 1002, 1, TRUE, now(), now()),   -- 父親（主）
(3, 1003, 2, TRUE, now(), now()),   -- 母親（主）
(4, 1004, 1, TRUE, now(), now()),   -- 父親（主）
(5, 1005, 2, TRUE, now(), now()),   -- 母親（主）
(6, 1006, 1, TRUE, now(), now()),   -- 父親（主）
(7, 1007, 2, TRUE, now(), now()),   -- 母親（主）
(8, 1008, 1, TRUE, now(), now()),   -- 父親（主）
(9, 1009, 2, TRUE, now(), now()),   -- 母親（主）
(10, 1010, 1, TRUE, now(), now()), -- 父親（主）
(11, 1011, 2, TRUE, now(), now()), -- 母親（主）
(12, 1012, 1, TRUE, now(), now()), -- 父親（主）
(13, 1013, 2, TRUE, now(), now()), -- 母親（主）
(14, 1014, 1, TRUE, now(), now()), -- 父親（主）
(15, 1015, 2, TRUE, now(), now()), -- 母親（主）
(16, 1016, 1, TRUE, now(), now()), -- 父親（主）
(17, 1017, 2, TRUE, now(), now()), -- 母親（主）
(18, 1018, 1, TRUE, now(), now()), -- 父親（主）
(19, 1019, 2, TRUE, now(), now()), -- 母親（主）
(20, 1020, 1, TRUE, now(), now()), -- 父親（主）
(21, 1021, 2, TRUE, now(), now()), -- 母親（主）
(22, 1022, 1, TRUE, now(), now()), -- 父親（主）
(23, 1023, 2, TRUE, now(), now()), -- 母親（主）
(24, 1024, 1, TRUE, now(), now()), -- 父親（主）
(25, 1025, 2, TRUE, now(), now()), -- 母親（主）
(26, 1026, 1, TRUE, now(), now()), -- 父親（主）
(27, 1027, 2, TRUE, now(), now()), -- 母親（主）
(28, 1028, 1, TRUE, now(), now()), -- 父親（主）
(29, 1029, 2, TRUE, now(), now()), -- 母親（主）
(30, 1030, 1, TRUE, now(), now()), -- 父親（主）
(31, 1031, 2, TRUE, now(), now()), -- 母親（主）
(32, 1032, 1, TRUE, now(), now()), -- 父親（主）
(33, 1033, 2, TRUE, now(), now()), -- 母親（主）
(34, 1034, 1, TRUE, now(), now()), -- 父親（主）
(35, 1035, 2, TRUE, now(), now()), -- 母親（主）
(36, 1036, 1, TRUE, now(), now()), -- 父親（主）
(37, 1037, 2, TRUE, now(), now()), -- 母親（主）
(38, 1038, 1, TRUE, now(), now()), -- 父親（主）
(39, 1039, 2, TRUE, now(), now()), -- 母親（主）
(40, 1040, 1, TRUE, now(), now()), -- 父親（主）
(41, 1041, 2, TRUE, now(), now()), -- 母親（主）
(42, 1042, 1, TRUE, now(), now()), -- 父親（主）
(43, 1043, 2, TRUE, now(), now()), -- 母親（主）
(44, 1044, 1, TRUE, now(), now()), -- 父親（主）
(45, 1045, 2, TRUE, now(), now()), -- 母親（主）
(46, 1046, 1, TRUE, now(), now()), -- 父親（主）
(47, 1047, 2, TRUE, now(), now()), -- 母親（主）
(48, 1048, 1, TRUE, now(), now()), -- 父親（主）
(49, 1049, 2, TRUE, now(), now()), -- 母親（主）
(50, 1050, 1, TRUE, now(), now()), -- 父親（主）
(51, 1051, 2, TRUE, now(), now()), -- 母親（主）
(52, 1052, 1, TRUE, now(), now()), -- 父親（主）
(53, 1053, 2, TRUE, now(), now()), -- 母親（主）
(54, 1054, 1, TRUE, now(), now()), -- 父親（主）
(55, 1055, 2, TRUE, now(), now()), -- 母親（主）
(56, 1056, 1, TRUE, now(), now()), -- 父親（主）
(57, 1057, 2, TRUE, now(), now()), -- 母親（主）
(58, 1058, 1, TRUE, now(), now()), -- 父親（主）
(59, 1059, 2, TRUE, now(), now()), -- 母親（主）
(60, 1060, 1, TRUE, now(), now()), -- 父親（主）
(61, 1061, 2, TRUE, now(), now()), -- 母親（主）
(62, 1062, 1, TRUE, now(), now()), -- 父親（主）
(63, 1063, 2, TRUE, now(), now()), -- 母親（主）
(64, 1064, 1, TRUE, now(), now()), -- 父親（主）
(65, 1065, 2, TRUE, now(), now()), -- 母親（主）
(66, 1066, 1, TRUE, now(), now()), -- 父親（主）
(67, 1067, 2, TRUE, now(), now()), -- 母親（主）
(68, 1068, 1, TRUE, now(), now()), -- 父親（主）
(69, 1069, 2, TRUE, now(), now()), -- 母親（主）
(70, 1070, 1, TRUE, now(), now()), -- 父親（主）
(71, 1071, 2, TRUE, now(), now()), -- 母親（主）
(72, 1072, 1, TRUE, now(), now()), -- 父親（主）
(73, 1073, 2, TRUE, now(), now()), -- 母親（主）
(74, 1074, 1, TRUE, now(), now()), -- 父親（主）
(75, 1075, 2, TRUE, now(), now()), -- 母親（主）
(76, 1076, 1, TRUE, now(), now()), -- 父親（主）
(77, 1077, 2, TRUE, now(), now()), -- 母親（主）
(78, 1078, 1, TRUE, now(), now()), -- 父親（主）
(79, 1079, 2, TRUE, now(), now()), -- 母親（主）
(80, 1080, 1, TRUE, now(), now()), -- 父親（主）

-- 余った Guardian 1081-1100 を Student 1-20 に追加で紐づけ（副保護者）
(1, 1081, 1, FALSE, now(), now()),  -- 父親（副）
(2, 1082, 2, FALSE, now(), now()),  -- 母親（副）
(3, 1083, 1, FALSE, now(), now()),  -- 父親（副）
(4, 1084, 2, FALSE, now(), now()),  -- 母親（副）
(5, 1085, 1, FALSE, now(), now()),  -- 父親（副）
(6, 1086, 2, FALSE, now(), now()),  -- 母親（副）
(7, 1087, 1, FALSE, now(), now()),  -- 父親（副）
(8, 1088, 2, FALSE, now(), now()),  -- 母親（副）
(9, 1089, 1, FALSE, now(), now()),  -- 父親（副）
(10, 1090, 2, FALSE, now(), now()), -- 母親（副）
(11, 1091, 1, FALSE, now(), now()), -- 父親（副）
(12, 1092, 2, FALSE, now(), now()), -- 母親（副）
(13, 1093, 1, FALSE, now(), now()), -- 父親（副）
(14, 1094, 2, FALSE, now(), now()), -- 母親（副）
(15, 1095, 1, FALSE, now(), now()), -- 父親（副）
(16, 1096, 2, FALSE, now(), now()), -- 母親（副）
(17, 1097, 1, FALSE, now(), now()), -- 父親（副）
(18, 1098, 2, FALSE, now(), now()), -- 母親（副）
(19, 1099, 1, FALSE, now(), now()), -- 父親（副）
(20, 1100, 2, FALSE, now(), now());-- 母親（副）
