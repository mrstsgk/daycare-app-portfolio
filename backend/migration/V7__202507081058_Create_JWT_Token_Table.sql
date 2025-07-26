-- JWTトークンテーブル
CREATE TABLE jwt_token
(
    id           SERIAL PRIMARY KEY,
    token_hash   VARCHAR(255) NOT NULL UNIQUE,
    user_id      INTEGER NOT NULL,
    user_type    VARCHAR(20) NOT NULL CHECK (user_type IN ('employee', 'guardian')),
    expires_at   TIMESTAMP NOT NULL,
    created_at   TIMESTAMP,
    is_revoked   BOOLEAN DEFAULT FALSE
);

-- インデックスを作成
CREATE INDEX jwt_token_user_id_idx ON jwt_token (user_id);
CREATE INDEX jwt_token_user_type_idx ON jwt_token (user_type);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE jwt_token IS 'JWTトークンの管理テーブル';
COMMENT ON COLUMN jwt_token.id IS 'トークンID（主キー）';
COMMENT ON COLUMN jwt_token.token_hash IS 'JWTトークンのハッシュ値（ユニーク）';
COMMENT ON COLUMN jwt_token.user_id IS 'ユーザーID（employee.idまたはguardian.id）';
COMMENT ON COLUMN jwt_token.user_type IS 'ユーザータイプ（employee=職員、guardian=保護者）';
COMMENT ON COLUMN jwt_token.expires_at IS 'トークンの有効期限';
COMMENT ON COLUMN jwt_token.created_at IS '作成日時';
COMMENT ON COLUMN jwt_token.is_revoked IS '無効化フラグ（TRUE=無効化済み、FALSE=有効）'; 