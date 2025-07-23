# 登園管理アプリ

シンプルな登園管理アプリのポートフォリオプロジェクトです。

---

## 技術構成

### フロントエンド

- React.js + TypeScript
- ビルドツール: Vite
- スタイル: SCSS（CSS Modules）
- テスト: Vitest, Testing Library
- IDE: Cursor
- 主なディレクトリ構成:
    ```
    frontend/
    ├── src/
    │   ├── components/    # UIコンポーネント群
    │   ├── styles/        # SCSS変数・共通スタイル
    │   ├── api/           # APIクライアント
    │   ├── types/         # 型定義
    │   ├── App.tsx        # ルートコンポーネント
    │   └── index.tsx      # エントリポイント
    ├── public/            # 静的ファイル（画像・favicon等）
    ├── package.json       # 依存管理
    └── ...（省略）
    ```

### バックエンド

- Kotlin + Spring Boot
- テストツール: Kotest
- データベース: PostgreSQL
- データベースアクセス: jOOQ
- コンテナ化: Docker
- docker環境構築: Colima
- API仕様: OpenAPI 3.0
- IDE: IntelliJ IDEA
- 主なディレクトリ構成:
    ```
    backend/
    ├── domain/          # ドメイン層（ビジネスロジック）
    ├── usecase/         # ユースケース層（アプリケーションロジック）
    ├── infrastructure/  # インフラストラクチャ層（データベースアクセス）
    ├── presentation/    # プレゼンテーション層（API エンドポイント）
    └── src/main/        # メインアプリケーション
    ```

---

## 起動方法

### Docker一括起動

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

---

## 開発時の注意点

### フロントエンド

- コード品質: ESLint, Prettierによる静的解析・フォーマット

```bash
# ESLint

# コードチェック
npm run lint

# 自動修正
npm run lint:fix
```

```bash
# Prettier

# コードフォーマット
npm run format

# フォーマットチェック
npm run format:check

# ESLintとPrettierの統合実行
npm run lint && npm run format
```

### バックエンド

- OpenAPI仕様の更新: `backend/openapi/api.yaml`編集後、`./gradlew openApiGenerate`で自動生成
- DBスキーマ変更: `backend/migration/`にマイグレーション追加後、`./gradlew generateJooq`でJOOQクラス再生成
- 静的解析: Detekt, Kotlin Lint

```bash
# Detekt

./gradlew detekt
```

---

## コミット前の確認

- フロントエンド: `npm run lint && npm run format:check`
- バックエンド: `./gradlew detekt && ./gradlew test`

---

## CI/CD

- GitHub Actionsによる自動テスト・Lint・ビルド
- フロントエンド: `.github/workflows/frontend-check.yml`
- バックエンド: `.github/workflows/backend-check.yml`

---

## ドキュメント

[wiki](https://github.com/mrstsgk/daycare-app-portfolio/wiki)
