-- ユーザーパスワードテーブル
CREATE TABLE password
(
    id           SERIAL PRIMARY KEY,
    user_id      INTEGER NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    failed_login_attempts INTEGER NOT NULL,
    locked_until TIMESTAMP,
    created_at   TIMESTAMP NOT NULL,
    updated_at   TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE password IS 'ユーザー（職員・保護者）のパスワード情報を管理するテーブル';
COMMENT ON COLUMN password.id IS 'パスワードID（主キー）';
COMMENT ON COLUMN password.user_id IS 'ユーザーID（user.id）';
COMMENT ON COLUMN password.password_hash IS 'ハッシュ化されたパスワード';
COMMENT ON COLUMN password.failed_login_attempts IS 'パスワード間違い回数（連続ログイン失敗回数）';
COMMENT ON COLUMN password.locked_until IS 'アカウントロック解除時刻（NULLの場合はロックされていない）';
COMMENT ON COLUMN password.created_at IS '作成日時';
COMMENT ON COLUMN password.updated_at IS '更新日時';

-- サンプルデータ（パスワードは全て'password123'のハッシュ値）
INSERT INTO password (user_id, password_hash, failed_login_attempts, locked_until, created_at, updated_at)
VALUES
-- 職員のパスワード（UserテーブルのID 1-7）
(1, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- sasaki@example.com
(2, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- nakata@example.com
(3, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- tayama@example.com
(4, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- date@example.com
(5, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- watabe@example.com
(6, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- nakai@example.com

-- 保護者のパスワード（UserテーブルのID 1001-1020）
(1001, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- mayumi.sato@example.com
(1002, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- daisuke.suzuki@example.com
(1003, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- rina.tanaka@example.com
(1004, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- ken.yamada@example.com
(1005, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- mao.ito@example.com
(1006, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- yuto.watanabe@example.com
(1007, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- sakura.nakamura@example.com
(1008, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- kanon.kobayashi@example.com
(1009, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- shota.kato@example.com
(1010, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- misaki.saito@example.com
(1011, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- ryu.takahashi@example.com
(1012, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- ayaka.matsumoto@example.com
(1013, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- ren.kimura@example.com
(1014, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- hina.hayashi@example.com
(1015, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- takumi.shimizu@example.com
(1016, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- yua.morita@example.com
(1017, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- hayate.inoue@example.com
(1018, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- koharu.hashimoto@example.com
(1019, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- yuma.ishikawa@example.com
(1020, '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()); -- airi.maeda@example.com