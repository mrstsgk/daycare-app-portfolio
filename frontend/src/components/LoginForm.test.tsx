import { render, screen } from "@testing-library/react";
import { beforeEach, describe, expect, it, vi } from "vitest";
import { LoginForm } from "./LoginForm";

describe("LoginForm", () => {
  const mockOnLogin = vi.fn();

  beforeEach(() => {
    vi.clearAllMocks();
  });

  it("renders form elements correctly", () => {
    render(<LoginForm onLogin={mockOnLogin} loading={false} error={null} />);

    expect(screen.getByText("スマ登園")).toBeInTheDocument();
    expect(
      screen.getByRole("heading", { name: "ログイン" })
    ).toBeInTheDocument();
    expect(screen.getByLabelText("メールアドレス")).toBeInTheDocument();
    expect(screen.getByLabelText("パスワード")).toBeInTheDocument();
    expect(
      screen.getByRole("button", { name: "ログイン" })
    ).toBeInTheDocument();
  });

  it("disables form elements when loading", () => {
    render(<LoginForm onLogin={mockOnLogin} loading={true} error={null} />);

    const emailInput = screen.getByLabelText("メールアドレス");
    const passwordInput = screen.getByLabelText("パスワード");
    const submitButton = screen.getByRole("button", { name: "ログイン中..." });

    expect(emailInput).toBeDisabled();
    expect(passwordInput).toBeDisabled();
    expect(submitButton).toBeDisabled();
  });

  it("displays error message when provided", () => {
    const errorMessage = "ログインに失敗しました";
    render(
      <LoginForm onLogin={mockOnLogin} loading={false} error={errorMessage} />
    );

    expect(screen.getByText(errorMessage)).toBeInTheDocument();
  });

  it("displays test account information", () => {
    render(<LoginForm onLogin={mockOnLogin} loading={false} error={null} />);

    expect(screen.getByText("テスト用アカウント:")).toBeInTheDocument();
    expect(
      screen.getByText("メールアドレス: sasaki@example.com")
    ).toBeInTheDocument();
    expect(screen.getByText("パスワード: password123")).toBeInTheDocument();
    expect(
      screen.getByText("※デモ用のテストアカウントです")
    ).toBeInTheDocument();
  });

  it("disables submit button initially (form validation)", () => {
    render(<LoginForm onLogin={mockOnLogin} loading={false} error={null} />);

    const submitButton = screen.getByRole("button", { name: "ログイン" });
    expect(submitButton).toBeDisabled();
  });
});
