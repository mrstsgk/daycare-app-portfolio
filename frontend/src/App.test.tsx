import { render, screen, waitFor } from "@testing-library/react";
import { describe, it, expect, vi } from "vitest";
import App from "./App";

// API呼び出しをモック
vi.mock("./api/client", () => ({
  studentApi: {
    getStudents: vi.fn().mockResolvedValue([
      {
        id: 1,
        name: "テスト太郎",
        age: 5,
        className: "ひまわり組",
      },
    ]),
  },
}));

describe("App", () => {
  it("renders loading state and then content", async () => {
    render(<App />);

    // まず読み込み中が表示されることを確認 (jest-domマッチャーで型安全性向上)
    expect(screen.getByText("読み込み中...")).toBeInTheDocument();

    // 非同期処理完了後にコンテンツが表示されることを確認
    await waitFor(() => {
      expect(screen.getByText("保育園管理システム")).toBeInTheDocument();
      expect(screen.getByText("テスト太郎")).toBeInTheDocument();
      expect(screen.getByText("生徒一覧")).toBeInTheDocument();
    });

    // テーブル構造が正しく表示されていることを確認
    const table = screen.getByRole("table");
    expect(table).toBeInTheDocument();

    // テーブルヘッダーが存在することを確認
    expect(screen.getByText("ID")).toBeInTheDocument();
    expect(screen.getByText("名前")).toBeInTheDocument();
    expect(screen.getByText("年齢")).toBeInTheDocument();
    expect(screen.getByText("クラス")).toBeInTheDocument();
  });
});
