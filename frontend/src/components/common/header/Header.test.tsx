import { render, screen, fireEvent } from "@testing-library/react";
import { describe, it, expect, vi } from "vitest";
import Header from "./Header";

describe("Header", () => {
  const userName = "田中 太郎";
  const onLogout = vi.fn();

  it("ロゴとタイトルが左寄せで表示される", () => {
    render(<Header userName={userName} onLogout={onLogout} />);
    expect(screen.getByAltText("スマ登園ロゴ")).toBeInTheDocument();
    expect(screen.getByText("スマ登園")).toBeInTheDocument();
  });

  it("ユーザー名とログアウトボタンが右寄せで表示される", () => {
    render(<Header userName={userName} onLogout={onLogout} />);
    expect(screen.getByText(`${userName}さん`)).toBeInTheDocument();
    expect(
      screen.getByRole("button", { name: "ログアウト" })
    ).toBeInTheDocument();
  });

  it("ログアウトボタンをクリックするとonLogoutが呼ばれる", () => {
    render(<Header userName={userName} onLogout={onLogout} />);
    fireEvent.click(screen.getByRole("button", { name: "ログアウト" }));
    expect(onLogout).toHaveBeenCalled();
  });
});
