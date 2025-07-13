CREATE TABLE guardian
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(50)  NOT NULL,
    email         VARCHAR(255) NOT NULL,
    telephone     VARCHAR(15)  NOT NULL,
    created_at    TIMESTAMP,
    updated_at    TIMESTAMP
);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE guardian IS '保育園の保護者情報を管理するテーブル';
COMMENT ON COLUMN guardian.id IS '保護者ID（主キー）';
COMMENT ON COLUMN guardian.name IS '保護者名';
COMMENT ON COLUMN guardian.email IS 'メールアドレス';
COMMENT ON COLUMN guardian.telephone IS '電話番号';
COMMENT ON COLUMN guardian.created_at IS '作成日時';
COMMENT ON COLUMN guardian.updated_at IS '更新日時';

INSERT INTO guardian (name, email, telephone, created_at, updated_at)
VALUES
-- Guardian 1-80: Student 1-80と1対1で紐づく保護者
('佐藤真由美', 'mayumi.sato@example.com', '090-1234-0001', now(), now()),        -- Student 1: 佐藤太郎
('鈴木大輔', 'daisuke.suzuki@example.com', '080-4321-0002', now(), now()),       -- Student 2: 鈴木花子
('田中里奈', 'rina.tanaka@example.com', '070-5678-0003', now(), now()),          -- Student 3: 田中一郎
('山田健', 'ken.yamada@example.com', '090-8765-0004', now(), now()),             -- Student 4: 山田花子
('伊藤真央', 'mao.ito@example.com', '080-1357-0005', now(), now()),              -- Student 5: 伊藤次郎
('渡辺悠人', 'yuto.watanabe@example.com', '070-2468-0006', now(), now()),        -- Student 6: 渡辺美咲
('中村さくら', 'sakura.nakamura@example.com', '090-3691-0007', now(), now()),    -- Student 7: 中村健太
('小林花音', 'kanon.kobayashi@example.com', '080-9876-0008', now(), now()),      -- Student 8: 小林愛子
('加藤翔太', 'shota.kato@example.com', '070-1111-0009', now(), now()),           -- Student 9: 加藤大輔
('斎藤美咲', 'misaki.saito@example.com', '090-2222-0010', now(), now()),         -- Student 10: 斎藤真央
('高橋琉生', 'ryu.takahashi@example.com', '080-3333-0011', now(), now()),        -- Student 11: 高橋翔太
('松本彩香', 'ayaka.matsumoto@example.com', '070-4444-0012', now(), now()),      -- Student 12: 松本さくら
('木村蓮', 'ren.kimura@example.com', '090-5555-0013', now(), now()),             -- Student 13: 木村陸
('林陽菜', 'hina.hayashi@example.com', '080-6666-0014', now(), now()),           -- Student 14: 林美羽
('清水拓海', 'takumi.shimizu@example.com', '070-7777-0015', now(), now()),       -- Student 15: 清水颯
('森田結愛', 'yua.morita@example.com', '090-8888-0016', now(), now()),           -- Student 16: 森田心愛
('井上颯', 'hayate.inoue@example.com', '080-9999-0017', now(), now()),           -- Student 17: 井上蓮
('橋本心春', 'koharu.hashimoto@example.com', '070-1234-0018', now(), now()),     -- Student 18: 橋本愛菜
('石川悠真', 'yuma.ishikawa@example.com', '090-2345-0019', now(), now()),        -- Student 19: 石川大翔
('前田愛梨', 'airi.maeda@example.com', '080-3456-0020', now(), now()),           -- Student 20: 前田結衣
('藤田陸', 'riku.fujita@example.com', '070-4567-0021', now(), now()),            -- Student 21: 藤田海斗
('岡本咲良', 'sakura.okamoto@example.com', '090-5678-0022', now(), now()),       -- Student 22: 岡本咲良
('長谷川凛', 'rin.hasegawa@example.com', '080-6789-0023', now(), now()),         -- Student 23: 長谷川陽翔
('村上優斗', 'yuto.murakami@example.com', '070-7890-0024', now(), now()),        -- Student 24: 村上美月
('近藤愛美', 'manami.kondo@example.com', '090-8901-0025', now(), now()),         -- Student 25: 近藤樹
('坂本大翔', 'hiroto.sakamoto@example.com', '080-9012-0026', now(), now()),      -- Student 26: 坂本花音
('遠藤莉子', 'riko.endo@example.com', '070-0123-0027', now(), now()),            -- Student 27: 遠藤琉生
('青木海斗', 'kaito.aoki@example.com', '090-1234-0028', now(), now()),           -- Student 28: 青木愛莉
('西村結菜', 'yuna.nishimura@example.com', '080-2345-0029', now(), now()),       -- Student 29: 西村蒼空
('福田瑛太', 'eita.fukuda@example.com', '070-3456-0030', now(), now()),          -- Student 30: 福田心春
('太田美羽', 'miu.ota@example.com', '090-4567-0031', now(), now()),              -- Student 31: 太田陸斗
('上田律', 'ritsu.ueda@example.com', '080-5678-0032', now(), now()),             -- Student 32: 上田美桜
('原田詩織', 'shiori.harada@example.com', '070-6789-0033', now(), now()),        -- Student 33: 原田颯真
('新井健人', 'kento.arai@example.com', '090-7890-0034', now(), now()),           -- Student 34: 新井愛花
('武田花', 'hana.takeda@example.com', '080-8901-0035', now(), now()),            -- Student 35: 武田蒼介
('宮崎蒼', 'aoi.miyazaki@example.com', '070-9012-0036', now(), now()),           -- Student 36: 宮崎桜花
('中島奈々', 'nana.nakajima@example.com', '090-0123-0037', now(), now()),        -- Student 37: 中島陸人
('小野寺涼介', 'ryosuke.onodera@example.com', '080-1234-0038', now(), now()),    -- Student 38: 小野寺美音
('金子萌', 'moe.kaneko@example.com', '070-2345-0039', now(), now()),             -- Student 39: 金子翔
('高木隼人', 'hayato.takagi@example.com', '090-3456-0040', now(), now()),        -- Student 40: 高木咲希
('平野美月', 'mizuki.hirano@example.com', '080-4567-0041', now(), now()),        -- Student 41: 平野蒼太
('三浦翼', 'tsubasa.miura@example.com', '070-5678-0042', now(), now()),          -- Student 42: 三浦心菜
('今井桜', 'sakura.imai@example.com', '090-6789-0043', now(), now()),            -- Student 43: 今井颯人
('大野輝', 'akira.ono@example.com', '080-7890-0044', now(), now()),              -- Student 44: 大野美愛
('岩田咲', 'saki.iwata@example.com', '070-8901-0045', now(), now()),             -- Student 45: 岩田陸翔
('杉山蓮斗', 'rento.sugiyama@example.com', '090-9012-0046', now(), now()),       -- Student 46: 杉山愛梨
('星野美桜', 'mio.hoshino@example.com', '080-0123-0047', now(), now()),          -- Student 47: 星野蒼
('野口陽翔', 'haruto.noguchi@example.com', '070-1234-0048', now(), now()),       -- Student 48: 野口心花
('大塚心音', 'kokone.otsuka@example.com', '090-2345-0049', now(), now()),        -- Student 49: 大塚勇斗
('千葉颯真', 'soma.chiba@example.com', '080-3456-0050', now(), now()),           -- Student 50: 千葉美羽
('横山愛莉', 'airi.yokoyama@example.com', '070-4567-0051', now(), now()),        -- Student 51: 横山颯真
('菅原煌', 'akira.sugawara@example.com', '090-5678-0052', now(), now()),         -- Student 52: 菅原愛菜
('古川結衣', 'yui.furukawa@example.com', '080-6789-0053', now(), now()),         -- Student 53: 古川陸
('相田蒼空', 'sora.aida@example.com', '070-7890-0054', now(), now()),            -- Student 54: 相田心音
('島田美咲', 'misaki.shimada@example.com', '090-8901-0055', now(), now()),       -- Student 55: 島田蒼斗
('安田勇気', 'yuki.yasuda@example.com', '080-9012-0056', now(), now()),          -- Student 56: 安田美桜
('川口花音', 'kanon.kawaguchi@example.com', '070-0123-0057', now(), now()),      -- Student 57: 川口颯
('松井大地', 'daichi.matsui@example.com', '090-1234-0058', now(), now()),        -- Student 58: 松井愛花
('竹内愛', 'ai.takeuchi@example.com', '080-2345-0059', now(), now()),            -- Student 59: 竹内陸人
('服部陸人', 'rikuto.hattori@example.com', '070-3456-0060', now(), now()),       -- Student 60: 服部心愛
('内田美優', 'miyu.uchida@example.com', '090-4567-0061', now(), now()),          -- Student 61: 内田蒼太
('丸山蒼太', 'sota.maruyama@example.com', '080-5678-0062', now(), now()),        -- Student 62: 丸山美音
('山崎真奈', 'mana.yamazaki@example.com', '070-6789-0063', now(), now()),        -- Student 63: 山崎颯斗
('酒井颯人', 'hayato.sakai@example.com', '090-7890-0064', now(), now()),         -- Student 64: 酒井愛莉
('柴田心', 'kokoro.shibata@example.com', '080-8901-0065', now(), now()),         -- Student 65: 柴田陸翔
('宮本陸斗', 'rikuto.miyamoto@example.com', '070-9012-0066', now(), now()),      -- Student 66: 宮本心花
('小島美羽', 'miu.kojima@example.com', '090-0123-0067', now(), now()),           -- Student 67: 小島蒼
('河野悠', 'yu.kono@example.com', '080-1234-0068', now(), now()),                -- Student 68: 河野美愛
('森下咲希', 'saki.morishita@example.com', '070-2345-0069', now(), now()),       -- Student 69: 森下颯人
('黒田樹', 'itsuki.kuroda@example.com', '090-3456-0070', now(), now()),          -- Student 70: 黒田愛菜
('増田美桜', 'mio.masuda@example.com', '080-4567-0071', now(), now()),           -- Student 71: 増田陸斗
('片山蓮', 'ren.katayama@example.com', '070-5678-0072', now(), now()),           -- Student 72: 片山心音
('秋山愛花', 'aika.akiyama@example.com', '090-6789-0073', now(), now()),         -- Student 73: 秋山蒼太
('横田陸', 'riku.yokota@example.com', '080-7890-0074', now(), now()),            -- Student 74: 横田美羽
('草野美音', 'mion.kusano@example.com', '070-8901-0075', now(), now()),          -- Student 75: 草野颯真
('菊地颯', 'hayate.kikuchi@example.com', '090-9012-0076', now(), now()),         -- Student 76: 菊地愛花
('石田花', 'hana.ishida@example.com', '080-0123-0077', now(), now()),            -- Student 77: 石田陸人
('野村蒼介', 'sosuke.nomura@example.com', '070-1234-0078', now(), now()),        -- Student 78: 野村心愛
('山本美愛', 'mia.yamamoto@example.com', '090-2345-0079', now(), now()),         -- Student 79: 山本蒼斗
('田村翔', 'sho.tamura@example.com', '080-3456-0080', now(), now()),             -- Student 80: 田村美音

-- Guardian 81-100: Student 1-20に追加で紐づく保護者（配偶者）
('佐藤愛菜', 'aina.sato@example.com', '070-4567-0081', now(), now()),            -- Student 1: 佐藤太郎の追加保護者
('鈴木陸翔', 'rikuto.suzuki@example.com', '090-5678-0082', now(), now()),        -- Student 2: 鈴木花子の追加保護者
('田中美桜', 'mio.tanaka@example.com', '080-6789-0083', now(), now()),           -- Student 3: 田中一郎の追加保護者
('山田颯真', 'soma.yamada@example.com', '070-7890-0084', now(), now()),          -- Student 4: 山田花子の追加保護者
('伊藤心', 'kokoro.ito@example.com', '090-8901-0085', now(), now()),             -- Student 5: 伊藤次郎の追加保護者
('渡辺陸斗', 'rikuto.watanabe@example.com', '080-9012-0086', now(), now()),      -- Student 6: 渡辺美咲の追加保護者
('中村愛梨', 'airi.nakamura@example.com', '070-0123-0087', now(), now()),        -- Student 7: 中村健太の追加保護者
('小林蒼', 'ao.kobayashi@example.com', '090-1234-0088', now(), now()),           -- Student 8: 小林愛子の追加保護者
('加藤美音', 'mion.kato@example.com', '080-2345-0089', now(), now()),            -- Student 9: 加藤大輔の追加保護者
('斎藤颯太', 'sota.saito@example.com', '070-3456-0090', now(), now()),           -- Student 10: 斎藤真央の追加保護者
('高橋心愛', 'kokoa.takahashi@example.com', '090-4567-0091', now(), now()),      -- Student 11: 高橋翔太の追加保護者
('松本陸', 'riku.matsumoto@example.com', '080-5678-0092', now(), now()),         -- Student 12: 松本さくらの追加保護者
('木村美咲', 'misaki.kimura@example.com', '070-6789-0093', now(), now()),        -- Student 13: 木村陸の追加保護者
('林翔真', 'shoma.hayashi@example.com', '090-7890-0094', now(), now()),          -- Student 14: 林美羽の追加保護者
('清水愛', 'ai.shimizu@example.com', '080-8901-0095', now(), now()),             -- Student 15: 清水颯の追加保護者
('森田蒼斗', 'aoto.morita@example.com', '070-9012-0096', now(), now()),          -- Student 16: 森田心愛の追加保護者
('井上美羽', 'miu.inoue@example.com', '090-0123-0097', now(), now()),            -- Student 17: 井上蓮の追加保護者
('橋本陸人', 'rikuto.hashimoto@example.com', '080-1234-0098', now(), now()),     -- Student 18: 橋本愛菜の追加保護者
('石川心花', 'kokoka.ishikawa@example.com', '070-2345-0099', now(), now()),      -- Student 19: 石川大翔の追加保護者
('前田颯', 'hayate.maeda@example.com', '090-3456-0100', now(), now());           -- Student 20: 前田結衣の追加保護者
