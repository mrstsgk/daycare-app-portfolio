# 登園管理アプリ

シンプルな登園管理アプリのポートフォリオプロジェクトです。

## 技術構成

- フロントエンド: React.js + TypeScript
- バックエンド: Spring Boot + Kotlin
- データベース: PostgreSQL
- コンテナ化: Docker

## 機能

- 生徒一覧の表示
- (今後の予定) 生徒の登園・降園管理
- (今後の予定) 生徒の出欠管理
- (今後の予定) お知らせ管理

## 起動方法

以下のコマンドでアプリケーションを起動できます。

```
docker-compose up -d
```

- フロントエンド: http://localhost:3000
- API: http://localhost:8080/api/students

---
Colima推奨。IntelliJ IDEAで開発推奨。 