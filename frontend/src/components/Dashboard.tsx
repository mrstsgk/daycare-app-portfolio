import React from "react";
import "../styles/Dashboard.scss";

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

const Dashboard: React.FC<DashboardProps> = ({ onNavigate }) => {
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
    <div className="dashboard">
      <div className="dashboard-content">
        <h2 className="dashboard-title">機能一覧</h2>
        <div className="features-grid">
          {features.map(feature => (
            <div
              key={feature.id}
              className="feature-card"
              onClick={() => onNavigate(feature.path)}
            >
              <div className="feature-icon">{feature.icon}</div>
              <h3 className="feature-title">{feature.title}</h3>
              <p className="feature-description">{feature.description}</p>
              <button className="feature-button">開く</button>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
