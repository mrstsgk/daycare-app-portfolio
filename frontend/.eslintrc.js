module.exports = {
  env: {
    browser: true,
    es2021: true,
    node: true,
  },
  extends: [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:react-hooks/recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:prettier/recommended",
  ],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: "latest",
    sourceType: "module",
    project: "./tsconfig.json", // TypeScript型チェック情報を提供
    tsconfigRootDir: __dirname,
  },
  plugins: ["@typescript-eslint", "react", "react-hooks", "prettier"],
  rules: {
    // React関連のルール
    "react/react-in-jsx-scope": "off", // React 17以降は不要
    "react/prop-types": "off", // TypeScriptを使用するため

    // TypeScript関連のルール
    "@typescript-eslint/no-unused-vars": ["error", { argsIgnorePattern: "^_" }],
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/explicit-module-boundary-types": "off",

    // 型安全性を重視するルール
    "@typescript-eslint/no-explicit-any": "error", // any型の使用を禁止
    "@typescript-eslint/no-unsafe-assignment": "warn", // 安全でない代入を警告（段階的導入）
    "@typescript-eslint/no-unsafe-member-access": "warn", // 安全でないメンバーアクセスを警告
    "@typescript-eslint/no-unsafe-call": "warn", // 安全でない関数呼び出しを警告
    "@typescript-eslint/no-unsafe-return": "warn", // 安全でない戻り値を警告
    "@typescript-eslint/prefer-as-const": "error", // as constの使用を推奨
    "@typescript-eslint/no-non-null-assertion": "warn", // non-null assertionの使用に警告
    "@typescript-eslint/prefer-nullish-coalescing": "error", // ??演算子の使用を推奨
    "@typescript-eslint/prefer-optional-chain": "error", // オプショナルチェーンの使用を推奨
    "@typescript-eslint/no-unnecessary-type-assertion": "error", // 不要な型アサーションを禁止

    // 一般的なルール
    "no-console": "warn",
    "no-debugger": "error",
    "no-unused-vars": "off", // TypeScriptのルールを使用

    // Prettierでハンドリングされるため、コードスタイルルールは削除
  },
  settings: {
    react: {
      version: "detect",
    },
  },
  ignorePatterns: ["build/", "node_modules/", "*.config.js"],
};
