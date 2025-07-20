import { render, screen, waitFor } from "@testing-library/react";
import "@testing-library/jest-dom";
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

    // まず読み込み中が表示されることを確認
    expect(screen.getByText("読み込み中...")).toBeDefined();

    // 非同期処理完了後にコンテンツが表示されることを確認
    await waitFor(() => {
      expect(screen.getByText("保育園管理システム")).toBeDefined();
      expect(screen.getByText("テスト太郎")).toBeDefined();
    });
  });
});
