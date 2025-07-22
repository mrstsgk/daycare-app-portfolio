import { render, screen } from "@testing-library/react";
import { describe, it, expect } from "vitest";
import NoticeBoard from "./NoticeBoard";

describe("NoticeBoard", () => {
  const notices = [
    {
      id: 1,
      title: "テストお知らせ",
      content: "お知らせ内容",
      date: "2025-07-15",
      priority: "high",
    },
    {
      id: 2,
      title: "メンテナンス",
      content: "メンテナンス内容",
      date: "2025-07-14",
      priority: "medium",
    },
  ];

  it("お知らせタイトルが表示される", () => {
    render(<NoticeBoard notices={notices} />);
    expect(screen.getByText("重要なお知らせ")).toBeInTheDocument();
  });

  it("お知らせリストが正しく表示される", () => {
    render(<NoticeBoard notices={notices} />);
    expect(screen.getByText("テストお知らせ")).toBeInTheDocument();
    expect(screen.getByText("メンテナンス")).toBeInTheDocument();
    expect(screen.getByText("お知らせ内容")).toBeInTheDocument();
    expect(screen.getByText("メンテナンス内容")).toBeInTheDocument();
  });

  it("お知らせがない場合はメッセージが表示される", () => {
    render(<NoticeBoard notices={[]} />);
    expect(
      screen.getByText("現在、お知らせはありません。")
    ).toBeInTheDocument();
  });
});
