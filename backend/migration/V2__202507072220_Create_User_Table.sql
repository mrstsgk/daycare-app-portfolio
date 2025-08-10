-- EmployeeテーブルとGuardianテーブルを統合したUserテーブルを作成
CREATE TABLE "user"
(
    id          SERIAL PRIMARY KEY,
    firebase_uid    VARCHAR(255) UNIQUE,
    name        VARCHAR(50) NOT NULL,
    email       VARCHAR(255) NOT NULL UNIQUE,
    telephone   VARCHAR(15) NOT NULL,
    user_type   VARCHAR(20) NOT NULL CHECK (user_type IN ('employee', 'guardian')),
    class_room_id INTEGER REFERENCES class_room(id),
    created_at  TIMESTAMP NOT NULL,
    updated_at  TIMESTAMP
);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE "user" IS 'ユーザー（職員・保護者）の基本情報を管理するテーブル';
COMMENT ON COLUMN "user".id IS 'ユーザーID（主キー）';
COMMENT ON COLUMN "user".firebase_uid IS 'FirebaseのユーザーID（ユニーク）';
COMMENT ON COLUMN "user".name IS 'ユーザー名';
COMMENT ON COLUMN "user".email IS 'メールアドレス（ユニーク）';
COMMENT ON COLUMN "user".telephone IS '電話番号';
COMMENT ON COLUMN "user".user_type IS 'ユーザータイプ（employee=職員、guardian=保護者）';
COMMENT ON COLUMN "user".class_room_id IS '担当クラスID（職員のみ、外部キー、NULLの場合は特定のクラスに所属しない）';
COMMENT ON COLUMN "user".created_at IS '作成日時';
COMMENT ON COLUMN "user".updated_at IS '更新日時';

-- 元のV2（Employee）のデータをUserテーブルに移行（管理者データは除外）
INSERT INTO "user" (id, firebase_uid, name, email, telephone, user_type, class_room_id, created_at, updated_at)
VALUES
(1, '${admin.firebase_uid}', '佐々木花子', 'sasaki@example.com', '111-1111-1111', 'employee', 1, now(), now()),
(2, NULL, '中田誠', 'nakata@example.com', '222-2222-2222', 'employee', 2, now(), now()),
(3, NULL, '田山優', 'tayama@example.com', '333-3333-3333', 'employee', 3, now(), now()),
(4, NULL, '伊達健太', 'date@example.com', '444-4444-4444', 'employee', 4, now(), now()),
(5, NULL, '渡部美咲', 'watabe@example.com', '555-5555-5555', 'employee', 5, now(), now()),
(6, NULL, '中井一郎', 'nakai@example.com', '666-6666-6666', 'employee', 6, now(), now());

-- 元のV3（Guardian）のデータをUserテーブルに移行（IDを1000から開始して競合を回避）
INSERT INTO "user" (id, firebase_uid, name, email, telephone, user_type, class_room_id, created_at, updated_at)
VALUES
-- Guardian 1-80: Student 1-80と1対1で紐づく保護者
(1001, NULL, '佐藤真由美', 'mayumi.sato@example.com', '090-1234-0001', 'guardian', NULL, now(), now()),        -- Student 1: 佐藤太郎
(1002, NULL, '鈴木大輔', 'daisuke.suzuki@example.com', '080-4321-0002', 'guardian', NULL, now(), now()),       -- Student 2: 鈴木花子
(1003, NULL, '田中里奈', 'rina.tanaka@example.com', '070-5678-0003', 'guardian', NULL, now(), now()),          -- Student 3: 田中一郎
(1004, NULL, '山田健', 'ken.yamada@example.com', '090-8765-0004', 'guardian', NULL, now(), now()),             -- Student 4: 山田花子
(1005, NULL, '伊藤真央', 'mao.ito@example.com', '080-1357-0005', 'guardian', NULL, now(), now()),              -- Student 5: 伊藤次郎
(1006, NULL, '渡辺悠人', 'yuto.watanabe@example.com', '070-2468-0006', 'guardian', NULL, now(), now()),        -- Student 6: 渡辺美咲
(1007, NULL, '中村さくら', 'sakura.nakamura@example.com', '090-3691-0007', 'guardian', NULL, now(), now()),    -- Student 7: 中村健太
(1008, NULL, '小林花音', 'kanon.kobayashi@example.com', '080-9876-0008', 'guardian', NULL, now(), now()),      -- Student 8: 小林愛子
(1009, NULL, '加藤翔太', 'shota.kato@example.com', '070-1111-0009', 'guardian', NULL, now(), now()),           -- Student 9: 加藤大輔
(1010, NULL, '斎藤美咲', 'misaki.saito@example.com', '090-2222-0010', 'guardian', NULL, now(), now()),         -- Student 10: 斎藤真央
(1011, NULL, '高橋琉生', 'ryu.takahashi@example.com', '080-3333-0011', 'guardian', NULL, now(), now()),        -- Student 11: 高橋翔太
(1012, NULL, '松本彩香', 'ayaka.matsumoto@example.com', '070-4444-0012', 'guardian', NULL, now(), now()),      -- Student 12: 松本さくら
(1013, NULL, '木村蓮', 'ren.kimura@example.com', '090-5555-0013', 'guardian', NULL, now(), now()),             -- Student 13: 木村陸
(1014, NULL, '林陽菜', 'hina.hayashi@example.com', '080-6666-0014', 'guardian', NULL, now(), now()),           -- Student 14: 林美羽
(1015, NULL, '清水拓海', 'takumi.shimizu@example.com', '070-7777-0015', 'guardian', NULL, now(), now()),       -- Student 15: 清水颯
(1016, NULL, '森田結愛', 'yua.morita@example.com', '090-8888-0016', 'guardian', NULL, now(), now()),           -- Student 16: 森田心愛
(1017, NULL, '井上颯', 'hayate.inoue@example.com', '080-9999-0017', 'guardian', NULL, now(), now()),           -- Student 17: 井上蓮
(1018, NULL, '橋本心春', 'koharu.hashimoto@example.com', '070-1234-0018', 'guardian', NULL, now(), now()),     -- Student 18: 橋本愛菜
(1019, NULL, '石川悠真', 'yuma.ishikawa@example.com', '090-2345-0019', 'guardian', NULL, now(), now()),        -- Student 19: 石川大翔
(1020, NULL, '前田愛梨', 'airi.maeda@example.com', '080-3456-0020', 'guardian', NULL, now(), now()),           -- Student 20: 前田結衣
(1021, NULL, '藤田陸', 'riku.fujita@example.com', '070-4567-0021', 'guardian', NULL, now(), now()),            -- Student 21: 藤田海斗
(1022, NULL, '岡本咲良', 'sakura.okamoto@example.com', '090-5678-0022', 'guardian', NULL, now(), now()),       -- Student 22: 岡本咲良
(1023, NULL, '長谷川凛', 'rin.hasegawa@example.com', '080-6789-0023', 'guardian', NULL, now(), now()),         -- Student 23: 長谷川陽翔
(1024, NULL, '村上優斗', 'yuto.murakami@example.com', '070-7890-0024', 'guardian', NULL, now(), now()),        -- Student 24: 村上美月
(1025, NULL, '近藤愛美', 'manami.kondo@example.com', '090-8901-0025', 'guardian', NULL, now(), now()),         -- Student 25: 近藤樹
(1026, NULL, '坂本大翔', 'hiroto.sakamoto@example.com', '080-9012-0026', 'guardian', NULL, now(), now()),      -- Student 26: 坂本花音
(1027, NULL, '遠藤莉子', 'riko.endo@example.com', '070-0123-0027', 'guardian', NULL, now(), now()),            -- Student 27: 遠藤琉生
(1028, NULL, '青木海斗', 'kaito.aoki@example.com', '090-1234-0028', 'guardian', NULL, now(), now()),           -- Student 28: 青木愛莉
(1029, NULL, '西村結菜', 'yuna.nishimura@example.com', '080-2345-0029', 'guardian', NULL, now(), now()),       -- Student 29: 西村蒼空
(1030, NULL, '福田瑛太', 'eita.fukuda@example.com', '070-3456-0030', 'guardian', NULL, now(), now()),          -- Student 30: 福田心春
(1031, NULL, '太田美羽', 'miu.ota@example.com', '090-4567-0031', 'guardian', NULL, now(), now()),              -- Student 31: 太田陸斗
(1032, NULL, '上田律', 'ritsu.ueda@example.com', '080-5678-0032', 'guardian', NULL, now(), now()),             -- Student 32: 上田美桜
(1033, NULL, '原田詩織', 'shiori.harada@example.com', '070-6789-0033', 'guardian', NULL, now(), now()),        -- Student 33: 原田颯真
(1034, NULL, '新井健人', 'kento.arai@example.com', '090-7890-0034', 'guardian', NULL, now(), now()),           -- Student 34: 新井愛花
(1035, NULL, '武田花', 'hana.takeda@example.com', '080-8901-0035', 'guardian', NULL, now(), now()),            -- Student 35: 武田蒼介
(1036, NULL, '宮崎蒼', 'aoi.miyazaki@example.com', '070-9012-0036', 'guardian', NULL, now(), now()),           -- Student 36: 宮崎桜花
(1037, NULL, '中島奈々', 'nana.nakajima@example.com', '090-0123-0037', 'guardian', NULL, now(), now()),        -- Student 37: 中島陸人
(1038, NULL, '小野寺涼介', 'ryosuke.onodera@example.com', '080-1234-0038', 'guardian', NULL, now(), now()),    -- Student 38: 小野寺美音
(1039, NULL, '金子萌', 'moe.kaneko@example.com', '070-2345-0039', 'guardian', NULL, now(), now()),             -- Student 39: 金子翔
(1040, NULL, '高木隼人', 'hayato.takagi@example.com', '090-3456-0040', 'guardian', NULL, now(), now()),        -- Student 40: 高木咲希
(1041, NULL, '平野美月', 'mizuki.hirano@example.com', '080-4567-0041', 'guardian', NULL, now(), now()),        -- Student 41: 平野蒼太
(1042, NULL, '三浦翼', 'tsubasa.miura@example.com', '070-5678-0042', 'guardian', NULL, now(), now()),          -- Student 42: 三浦心菜
(1043, NULL, '今井桜', 'sakura.imai@example.com', '090-6789-0043', 'guardian', NULL, now(), now()),            -- Student 43: 今井颯人
(1044, NULL, '大野輝', 'akira.ono@example.com', '080-7890-0044', 'guardian', NULL, now(), now()),              -- Student 44: 大野美愛
(1045, NULL, '岩田咲', 'saki.iwata@example.com', '070-8901-0045', 'guardian', NULL, now(), now()),             -- Student 45: 岩田陸翔
(1046, NULL, '杉山蓮斗', 'rento.sugiyama@example.com', '090-9012-0046', 'guardian', NULL, now(), now()),       -- Student 46: 杉山愛梨
(1047, NULL, '星野美桜', 'mio.hoshino@example.com', '080-0123-0047', 'guardian', NULL, now(), now()),          -- Student 47: 星野蒼
(1048, NULL, '野口陽翔', 'haruto.noguchi@example.com', '070-1234-0048', 'guardian', NULL, now(), now()),       -- Student 48: 野口心花
(1049, NULL, '大塚心音', 'kokone.otsuka@example.com', '090-2345-0049', 'guardian', NULL, now(), now()),        -- Student 49: 大塚勇斗
(1050, NULL, '千葉颯真', 'soma.chiba@example.com', '080-3456-0050', 'guardian', NULL, now(), now()),           -- Student 50: 千葉美羽
(1051, NULL, '横山愛莉', 'airi.yokoyama@example.com', '070-4567-0051', 'guardian', NULL, now(), now()),        -- Student 51: 横山颯真
(1052, NULL, '菅原煌', 'akira.sugawara@example.com', '090-5678-0052', 'guardian', NULL, now(), now()),         -- Student 52: 菅原愛菜
(1053, NULL, '古川結衣', 'yui.furukawa@example.com', '080-6789-0053', 'guardian', NULL, now(), now()),         -- Student 53: 古川陸
(1054, NULL, '相田蒼空', 'sora.aida@example.com', '070-7890-0054', 'guardian', NULL, now(), now()),            -- Student 54: 相田心音
(1055, NULL, '島田美咲', 'misaki.shimada@example.com', '090-8901-0055', 'guardian', NULL, now(), now()),       -- Student 55: 島田蒼斗
(1056, NULL, '安田勇気', 'yuki.yasuda@example.com', '080-9012-0056', 'guardian', NULL, now(), now()),          -- Student 56: 安田美桜
(1057, NULL, '川口花音', 'kanon.kawaguchi@example.com', '070-0123-0057', 'guardian', NULL, now(), now()),      -- Student 57: 川口颯
(1058, NULL, '松井大地', 'daichi.matsui@example.com', '090-1234-0058', 'guardian', NULL, now(), now()),        -- Student 58: 松井愛花
(1059, NULL, '竹内愛', 'ai.takeuchi@example.com', '080-2345-0059', 'guardian', NULL, now(), now()),            -- Student 59: 竹内陸人
(1060, NULL, '服部陸人', 'rikuto.hattori@example.com', '070-3456-0060', 'guardian', NULL, now(), now()),       -- Student 60: 服部心愛
(1061, NULL, '内田美優', 'miyu.uchida@example.com', '090-4567-0061', 'guardian', NULL, now(), now()),          -- Student 61: 内田蒼太
(1062, NULL, '丸山蒼太', 'sota.maruyama@example.com', '080-5678-0062', 'guardian', NULL, now(), now()),        -- Student 62: 丸山美音
(1063, NULL, '山崎真奈', 'mana.yamazaki@example.com', '070-6789-0063', 'guardian', NULL, now(), now()),        -- Student 63: 山崎颯斗
(1064, NULL, '酒井颯人', 'hayato.sakai@example.com', '090-7890-0064', 'guardian', NULL, now(), now()),         -- Student 64: 酒井愛莉
(1065, NULL, '柴田心', 'kokoro.shibata@example.com', '080-8901-0065', 'guardian', NULL, now(), now()),         -- Student 65: 柴田陸翔
(1066, NULL, '宮本陸斗', 'rikuto.miyamoto@example.com', '070-9012-0066', 'guardian', NULL, now(), now()),      -- Student 66: 宮本心花
(1067, NULL, '小島美羽', 'miu.kojima@example.com', '090-0123-0067', 'guardian', NULL, now(), now()),           -- Student 67: 小島蒼
(1068, NULL, '河野悠', 'yu.kono@example.com', '080-1234-0068', 'guardian', NULL, now(), now()),                -- Student 68: 河野美愛
(1069, NULL, '森下咲希', 'saki.morishita@example.com', '070-2345-0069', 'guardian', NULL, now(), now()),       -- Student 69: 森下颯人
(1070, NULL, '黒田樹', 'itsuki.kuroda@example.com', '090-3456-0070', 'guardian', NULL, now(), now()),          -- Student 70: 黒田愛菜
(1071, NULL, '増田美桜', 'mio.masuda@example.com', '080-4567-0071', 'guardian', NULL, now(), now()),           -- Student 71: 増田陸斗
(1072, NULL, '片山蓮', 'ren.katayama@example.com', '070-5678-0072', 'guardian', NULL, now(), now()),           -- Student 72: 片山心音
(1073, NULL, '秋山愛花', 'aika.akiyama@example.com', '090-6789-0073', 'guardian', NULL, now(), now()),         -- Student 73: 秋山蒼太
(1074, NULL, '横田陸', 'riku.yokota@example.com', '080-7890-0074', 'guardian', NULL, now(), now()),            -- Student 74: 横田美羽
(1075, NULL, '草野美音', 'mion.kusano@example.com', '070-8901-0075', 'guardian', NULL, now(), now()),          -- Student 75: 草野颯真
(1076, NULL, '菊地颯', 'hayate.kikuchi@example.com', '090-9012-0076', 'guardian', NULL, now(), now()),         -- Student 76: 菊地愛花
(1077, NULL, '石田花', 'hana.ishida@example.com', '080-0123-0077', 'guardian', NULL, now(), now()),            -- Student 77: 石田陸人
(1078, NULL, '野村蒼介', 'sosuke.nomura@example.com', '070-1234-0078', 'guardian', NULL, now(), now()),        -- Student 78: 野村心愛
(1079, NULL, '山本美愛', 'mia.yamamoto@example.com', '090-2345-0079', 'guardian', NULL, now(), now()),         -- Student 79: 山本蒼斗
(1080, NULL, '田村翔', 'sho.tamura@example.com', '080-3456-0080', 'guardian', NULL, now(), now()),             -- Student 80: 田村美音

-- Guardian 81-100: Student 1-20に追加で紐づく保護者（配偶者）
(1081, NULL, '佐藤愛菜', 'aina.sato@example.com', '070-4567-0081', 'guardian', NULL, now(), now()),            -- Student 1: 佐藤太郎の追加保護者
(1082, NULL, '鈴木陸翔', 'rikuto.suzuki@example.com', '090-5678-0082', 'guardian', NULL, now(), now()),        -- Student 2: 鈴木花子の追加保護者
(1083, NULL, '田中美桜', 'mio.tanaka@example.com', '080-6789-0083', 'guardian', NULL, now(), now()),           -- Student 3: 田中一郎の追加保護者
(1084, NULL, '山田颯真', 'soma.yamada@example.com', '070-7890-0084', 'guardian', NULL, now(), now()),          -- Student 4: 山田花子の追加保護者
(1085, NULL, '伊藤心', 'kokoro.ito@example.com', '090-8901-0085', 'guardian', NULL, now(), now()),             -- Student 5: 伊藤次郎の追加保護者
(1086, NULL, '渡辺陸斗', 'rikuto.watanabe@example.com', '080-9012-0086', 'guardian', NULL, now(), now()),      -- Student 6: 渡辺美咲の追加保護者
(1087, NULL, '中村愛梨', 'airi.nakamura@example.com', '070-0123-0087', 'guardian', NULL, now(), now()),        -- Student 7: 中村健太の追加保護者
(1088, NULL, '小林蒼', 'ao.kobayashi@example.com', '090-1234-0088', 'guardian', NULL, now(), now()),           -- Student 8: 小林愛子の追加保護者
(1089, NULL, '加藤美音', 'mion.kato@example.com', '080-2345-0089', 'guardian', NULL, now(), now()),            -- Student 9: 加藤大輔の追加保護者
(1090, NULL, '斎藤颯太', 'sota.saito@example.com', '070-3456-0090', 'guardian', NULL, now(), now()),           -- Student 10: 斎藤真央の追加保護者
(1091, NULL, '高橋心愛', 'kokoa.takahashi@example.com', '090-4567-0091', 'guardian', NULL, now(), now()),      -- Student 11: 高橋翔太の追加保護者
(1092, NULL, '松本陸', 'riku.matsumoto@example.com', '080-5678-0092', 'guardian', NULL, now(), now()),         -- Student 12: 松本さくらの追加保護者
(1093, NULL, '木村美咲', 'misaki.kimura@example.com', '070-6789-0093', 'guardian', NULL, now(), now()),        -- Student 13: 木村陸の追加保護者
(1094, NULL, '林翔真', 'shoma.hayashi@example.com', '090-7890-0094', 'guardian', NULL, now(), now()),          -- Student 14: 林美羽の追加保護者
(1095, NULL, '清水愛', 'ai.shimizu@example.com', '080-8901-0095', 'guardian', NULL, now(), now()),             -- Student 15: 清水颯の追加保護者
(1096, NULL, '森田蒼斗', 'aoto.morita@example.com', '070-9012-0096', 'guardian', NULL, now(), now()),          -- Student 16: 森田心愛の追加保護者
(1097, NULL, '井上美羽', 'miu.inoue@example.com', '090-0123-0097', 'guardian', NULL, now(), now()),            -- Student 17: 井上蓮の追加保護者
(1098, NULL, '橋本陸人', 'rikuto.hashimoto@example.com', '080-1234-0098', 'guardian', NULL, now(), now()),     -- Student 18: 橋本愛菜の追加保護者
(1099, NULL, '石川心花', 'kokoka.ishikawa@example.com', '070-2345-0099', 'guardian', NULL, now(), now()),      -- Student 19: 石川大翔の追加保護者
(1100, NULL, '前田颯', 'hayate.maeda@example.com', '090-3456-0100', 'guardian', NULL, now(), now());           -- Student 20: 前田結衣の追加保護者
