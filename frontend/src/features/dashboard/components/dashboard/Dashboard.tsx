import { FC } from "react";
import styles from "./Dashboard.module.scss";

interface FeatureItem {
  id: string;
  title: string;
  description: string;
  icon: string;
  path: string;
}

interface DashboardProps {
  onNavigate: (path: string) => void;
}

const Dashboard: FC<DashboardProps> = ({ onNavigate }) => {
  const features: FeatureItem[] = [
    {
      id: "attendance",
      title: "登園・降園",
      description: "園児の登園・降園時刻を記録します",
      icon: "🚪",
      path: "/attendance",
    },
    {
      id: "work-hours",
      title: "出勤・退勤",
      description: "職員の出勤・退勤時刻を記録します",
      icon: "⏰",
      path: "/work-hours",
    },
    {
      id: "contact-book",
      title: "連絡帳作成",
      description: "園児の連絡帳を作成・編集します",
      icon: "📝",
      path: "/contact-book",
    },
    {
      id: "daily-plan",
      title: "日案作成",
      description: "保育の日案を作成・管理します",
      icon: "📋",
      path: "/daily-plan",
    },
  ];

  return (
    <div className={styles.dashboard}>
      <div className={styles.dashboardContent}>
        <h2 className={styles.dashboardTitle}>機能一覧</h2>
        <div className={styles.featuresGrid}>
          {features.map(feature => (
            <div
              key={feature.id}
              className={styles.featureCard}
              onClick={() => onNavigate(feature.path)}
            >
              <div className={styles.featureIcon}>{feature.icon}</div>
              <h3 className={styles.featureTitle}>{feature.title}</h3>
              <p className={styles.featureDescription}>{feature.description}</p>
              <button className={styles.featureButton}>開く</button>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
