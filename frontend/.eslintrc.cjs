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
  ],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: "latest",
    sourceType: "module",
  },
  plugins: ["@typescript-eslint", "react", "react-hooks"],
  rules: {
    // React関連のルール
    "react/react-in-jsx-scope": "off",
    "react/prop-types": "off",

    // 一般的なルール
    "no-console": "warn",
    "no-debugger": "error",
    "no-unused-vars": "off",
  },
  settings: {
    react: {
      version: "detect",
    },
  },
  ignorePatterns: ["build/", "node_modules/", "*.config.js", "*.config.ts"],
  globals: {
    vi: true,
    describe: true,
    it: true,
    expect: true,
    beforeEach: true,
    afterEach: true,
  },
};
