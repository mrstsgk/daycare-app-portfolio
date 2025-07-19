import React from "react";
import styles from "./Header.module.scss";

interface HeaderProps {
  userName: string;
  onLogout: () => void;
}

const Header: React.FC<HeaderProps> = ({ userName, onLogout }) => {
  return (
    <header className={styles.header}>
      <div className={styles.headerContent}>
        <div className={styles.logo}>
          <img
            src="/images/suma_touen_image_logo.png"
            alt="スマ登園ロゴ"
            className={styles.logoImage}
          />
          <span className={styles.logoText}>スマ登園</span>
        </div>
        <div className={styles.userSection}>
          <span className={styles.userName}>{userName}さん</span>
          <button className={styles.logoutButton} onClick={onLogout}>
            ログアウト
          </button>
        </div>
      </div>
    </header>
  );
};

export default Header;
