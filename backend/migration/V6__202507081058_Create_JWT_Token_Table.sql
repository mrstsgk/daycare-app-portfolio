-- JWTトークンテーブル
CREATE TABLE jwt_token
(
    id           SERIAL PRIMARY KEY,
    token_hash   VARCHAR(255) NOT NULL UNIQUE,
    user_id      INTEGER NOT NULL,
    expires_at   TIMESTAMP NOT NULL,
    created_at   TIMESTAMP NOT NULL,
    is_revoked   BOOLEAN DEFAULT FALSE
);

-- テーブルとカラムにコメントを追加
COMMENT ON TABLE jwt_token IS 'JWTトークンの管理テーブル';
COMMENT ON COLUMN jwt_token.id IS 'トークンID（主キー）';
COMMENT ON COLUMN jwt_token.token_hash IS 'JWTトークンのハッシュ値（ユニーク）';
COMMENT ON COLUMN jwt_token.user_id IS 'ユーザーID（employee.idまたはguardian.id）';
COMMENT ON COLUMN jwt_token.expires_at IS 'トークンの有効期限';
COMMENT ON COLUMN jwt_token.created_at IS '作成日時';
COMMENT ON COLUMN jwt_token.is_revoked IS '無効化フラグ（TRUE=無効化済み、FALSE=有効）'; 