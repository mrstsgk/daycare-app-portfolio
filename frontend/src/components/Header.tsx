import React from "react";
import "../styles/Header.scss";

interface HeaderProps {
  userName: string;
  onLogout: () => void;
}

const Header: React.FC<HeaderProps> = ({ userName, onLogout }) => {
  return (
    <header className="header">
      <div className="header-content">
        <div className="logo">
          <img
            src="/images/suma_touen_image_logo.png"
            alt="スマ登園ロゴ"
            className="logo-image"
          />
          <span className="logo-text">スマ登園</span>
        </div>
        <div className="user-section">
          <span className="user-name">{userName}さん</span>
          <button className="logout-button" onClick={onLogout}>
            ログアウト
          </button>
        </div>
      </div>
    </header>
  );
};

export default Header;
