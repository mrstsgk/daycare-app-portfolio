import { render, screen, fireEvent } from "@testing-library/react";
import { describe, it, expect, vi } from "vitest";
import Dashboard from "./Dashboard";

describe("Dashboard", () => {
  const onNavigate = vi.fn();

  it("機能一覧タイトルが表示される", () => {
    render(<Dashboard onNavigate={onNavigate} />);
    expect(screen.getByText("機能一覧")).toBeInTheDocument();
  });

  it("全ての機能カードが表示される", () => {
    render(<Dashboard onNavigate={onNavigate} />);
    expect(screen.getByText("登園・降園")).toBeInTheDocument();
    expect(screen.getByText("出勤・退勤")).toBeInTheDocument();
    expect(screen.getByText("連絡帳作成")).toBeInTheDocument();
    expect(screen.getByText("日案作成")).toBeInTheDocument();
  });

  it("機能カードの「開く」ボタンをクリックするとonNavigateが呼ばれる", () => {
    render(<Dashboard onNavigate={onNavigate} />);
    const buttons = screen.getAllByRole("button", { name: "開く" });
    fireEvent.click(buttons[0]);
    expect(onNavigate).toHaveBeenCalled();
  });
});
