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
