-- ユーザーパスワードテーブル
CREATE TABLE user_password
(
    id           SERIAL PRIMARY KEY,
    user_id      INTEGER NOT NULL,
    user_type    VARCHAR(20) NOT NULL CHECK (user_type IN ('employee', 'guardian')),
    password_hash VARCHAR(255) NOT NULL,
    failed_login_attempts INTEGER NOT NULL,
    locked_until TIMESTAMP,
    created_at   TIMESTAMP NOT NULL,
    updated_at   TIMESTAMP,
    UNIQUE(user_id, user_type)
);

-- インデックスを作成
CREATE INDEX user_password_user_id_idx ON user_password (user_id);
CREATE INDEX user_password_user_type_idx ON user_password (user_type);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE user_password IS 'ユーザー（職員・保護者）のパスワード情報を管理するテーブル';
COMMENT ON COLUMN user_password.id IS 'パスワードID（主キー）';
COMMENT ON COLUMN user_password.user_id IS 'ユーザーID（employee.idまたはguardian.id）';
COMMENT ON COLUMN user_password.user_type IS 'ユーザータイプ（employee=職員、guardian=保護者）';
COMMENT ON COLUMN user_password.password_hash IS 'ハッシュ化されたパスワード';
COMMENT ON COLUMN user_password.failed_login_attempts IS 'パスワード間違い回数（連続ログイン失敗回数）';
COMMENT ON COLUMN user_password.locked_until IS 'アカウントロック解除時刻（NULLの場合はロックされていない）';
COMMENT ON COLUMN user_password.created_at IS '作成日時';
COMMENT ON COLUMN user_password.updated_at IS '更新日時';

-- サンプルデータ（パスワードは全て'password123'のハッシュ値）
INSERT INTO user_password (user_id, user_type, password_hash, failed_login_attempts, locked_until, created_at, updated_at)
VALUES
-- 職員のパスワード
(1, 'employee', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- admin@example.com
(2, 'employee', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- sasaki@example.com
(3, 'employee', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- nakata@example.com
(4, 'employee', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- tayama@example.com
(5, 'employee', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- date@example.com
(6, 'employee', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- watabe@example.com
(7, 'employee', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- nakai@example.com

-- 保護者のパスワード（最初の20名のみ）
(1, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- mayumi.sato@example.com
(2, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- daisuke.suzuki@example.com
(3, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- rina.tanaka@example.com
(4, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- ken.yamada@example.com
(5, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- mao.ito@example.com
(6, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- yuto.watanabe@example.com
(7, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- sakura.nakamura@example.com
(8, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- kanon.kobayashi@example.com
(9, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- shota.kato@example.com
(10, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- misaki.saito@example.com
(11, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- ryu.takahashi@example.com
(12, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- ayaka.matsumoto@example.com
(13, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- ren.kimura@example.com
(14, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- hina.hayashi@example.com
(15, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- takumi.shimizu@example.com
(16, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- yua.morita@example.com
(17, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- hayate.inoue@example.com
(18, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- koharu.hashimoto@example.com
(19, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()), -- yuma.ishikawa@example.com
(20, 'guardian', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 0, null, now(), now()); -- airi.maeda@example.com