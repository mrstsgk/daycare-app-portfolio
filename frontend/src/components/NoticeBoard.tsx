import React from "react";
import "../styles/NoticeBoard.scss";

interface Notice {
  id: number;
  title: string;
  content: string;
  date: string;
  priority: "high" | "medium" | "low";
}

interface NoticeBoardProps {
  notices: Notice[];
}

const NoticeBoard: React.FC<NoticeBoardProps> = ({ notices }) => {
  return (
    <div className="notice-board">
      <h3 className="notice-title">重要なお知らせ</h3>
      <div className="notice-list">
        {notices.length > 0 ? (
          notices.map(notice => (
            <div
              key={notice.id}
              className={`notice-item priority-${notice.priority}`}
            >
              <div className="notice-header">
                <span className="notice-item-title">{notice.title}</span>
                <span className="notice-date">{notice.date}</span>
              </div>
              <p className="notice-content">{notice.content}</p>
            </div>
          ))
        ) : (
          <p className="no-notices">現在、お知らせはありません。</p>
        )}
      </div>
    </div>
  );
};

export default NoticeBoard;
