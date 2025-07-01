# 登園管理アプリ

シンプルな登園管理アプリのポートフォリオプロジェクトです。

## 技術構成

- フロントエンド: React.js + TypeScript
- バックエンド: Spring Boot + Kotlin
- データベース: PostgreSQL
- コンテナ化: Docker
- API仕様: OpenAPI 3.0
- データベースアクセス: JOOQ

## アーキテクチャ

### バックエンド構成

本プロジェクトは、クリーンアーキテクチャに基づいた多層構造を採用しています：

```
backend/
├── domain/          # ドメイン層（ビジネスロジック）
├── usecase/         # ユースケース層（アプリケーションロジック）
├── infrastructure/  # インフラストラクチャ層（データベースアクセス）
├── presentation/    # プレゼンテーション層（API エンドポイント）
└── src/main/        # メインアプリケーション
```

### OpenAPI仕様

- **仕様ファイル**: `backend/openapi/api.yaml`
- **自動生成**: OpenAPI Generatorを使用してKotlinのモデルクラスを自動生成
- **生成先**: `backend/presentation/src/main/kotlin/com/example/daycare/presentation/model/`
- **API仕様確認**: http://localhost:8080/swagger-ui.html （アプリケーション起動後）

#### OpenAPI生成コマンド

```bash
cd backend
./gradlew openApiGenerate
```

### JOOQ（データベースアクセス）

JOOQを使用してタイプセーフなデータベースアクセスを実現しています。

- **生成設定**: `backend/infrastructure/build.gradle.kts`
- **生成先**: `backend/infrastructure/build/generated-src/jooq/main/`
- **データベーススキーマ**: Flywayマイグレーションから自動生成

#### JOOQ生成コマンド

```bash
# データベースを起動
docker-compose up -d db

# JOOQクラス生成
cd backend
./gradlew generateJooq
```

**注意**: JOOQコード生成にはPostgreSQLデータベースが起動している必要があります。

### データベースマイグレーション

- **ツール**: Flyway
- **マイグレーションファイル**: `backend/migration/`
- **自動実行**: アプリケーション起動時に自動実行

## 機能

- 生徒一覧の表示
- (今後の予定) 生徒の登園・降園管理
- (今後の予定) 生徒の出欠管理
- (今後の予定) お知らせ管理

## 起動方法

以下のコマンドでアプリケーションを起動できます。

```bash
docker-compose up -d --build
```

### 個別起動

```bash
# データベースのみ起動
docker-compose up -d db

# バックエンドのみ再ビルド
docker-compose up -d --build backend

# フロントエンドのみ再ビルド
docker-compose up -d --build frontend
```

- フロントエンド: http://localhost:3000
- バックエンドAPI: http://localhost:8080/api/students
- OpenAPI仕様書: http://localhost:8080/swagger-ui.html
- データベース: localhost:5432 (daycare/daycareuser/daycarepass)

## 開発時の注意事項

### OpenAPI仕様の更新

1. `backend/openapi/api.yaml`を編集
2. OpenAPIモデルクラスを再生成: `./gradlew openApiGenerate`
3. 必要に応じてコントローラーを更新

### データベーススキーマの変更

1. 新しいマイグレーションファイルを`backend/migration/`に作成
2. JOOQクラスを再生成: `./gradlew generateJooq`
3. リポジトリ実装を更新

---
Colima推奨。IntelliJ IDEAで開発推奨。

## ドキュメント

[wiki](https://github.com/mrstsgk/daycare-app-portfolio/wiki)
