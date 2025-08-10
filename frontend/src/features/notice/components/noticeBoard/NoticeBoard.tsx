import { FC } from "react";
import styles from "./NoticeBoard.module.scss";

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

const NoticeBoard: FC<NoticeBoardProps> = ({ notices }) => {
  const getPriorityClass = (priority: string) => {
    switch (priority) {
      case "high":
        return `${styles.noticeItem} ${styles.priorityHigh}`;
      case "medium":
        return `${styles.noticeItem} ${styles.priorityMedium}`;
      case "low":
        return `${styles.noticeItem} ${styles.priorityLow}`;
      default:
        return styles.noticeItem;
    }
  };

  return (
    <div className={styles.noticeBoard}>
      <h3 className={styles.noticeTitle}>重要なお知らせ</h3>
      <div className={styles.noticeList}>
        {notices.length > 0 ? (
          notices.map(notice => (
            <div key={notice.id} className={getPriorityClass(notice.priority)}>
              <div className={styles.noticeHeader}>
                <span className={styles.noticeItemTitle}>{notice.title}</span>
                <span className={styles.noticeDate}>{notice.date}</span>
              </div>
              <p className={styles.noticeContent}>{notice.content}</p>
            </div>
          ))
        ) : (
          <p className={styles.noNotices}>現在、お知らせはありません。</p>
        )}
      </div>
    </div>
  );
};

export default NoticeBoard;
