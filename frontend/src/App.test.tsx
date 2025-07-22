import { render, screen } from "@testing-library/react";
import { describe, it, expect } from "vitest";
import App from "./App";

describe("App", () => {
  it("renders main components correctly", () => {
    render(<App />);

    // ヘッダーコンポーネントが表示されることを確認
    expect(screen.getByText("スマ登園")).toBeInTheDocument();
    expect(screen.getByText("田中 太郎さん")).toBeInTheDocument();
    expect(
      screen.getByRole("button", { name: "ログアウト" })
    ).toBeInTheDocument();

    // お知らせボードが表示されることを確認
    expect(screen.getByText("重要なお知らせ")).toBeInTheDocument();
    expect(screen.getByText("運動会のお知らせ")).toBeInTheDocument();
    expect(screen.getByText("システムメンテナンス")).toBeInTheDocument();

    // ダッシュボードが表示されることを確認
    expect(screen.getByText("機能一覧")).toBeInTheDocument();
    expect(screen.getByText("登園・降園")).toBeInTheDocument();
    expect(screen.getByText("出勤・退勤")).toBeInTheDocument();
    expect(screen.getByText("連絡帳作成")).toBeInTheDocument();
    expect(screen.getByText("日案作成")).toBeInTheDocument();

    // すべての「開く」ボタンが表示されることを確認
    const openButtons = screen.getAllByRole("button", { name: "開く" });
    expect(openButtons).toHaveLength(4);
  });
});
