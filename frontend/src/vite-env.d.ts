/// <reference types="vite/client" />
/// <reference types="@testing-library/jest-dom" />

// Viteの環境変数の型定義
interface ImportMetaEnv {
  readonly VITE_API_URL?: string;
  // 必要に応じて他の環境変数を追加
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
