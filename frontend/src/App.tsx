import { useState } from "react";
import Header from "./components/Header";
import NoticeBoard from "./components/NoticeBoard";
import Dashboard from "./components/Dashboard";
import styles from "./App.module.scss";

function App() {
  const [userName] = useState("田中 太郎"); // TODO: 実際の実装では認証情報から取得

  // Note: バックエンドでの実装はしないのでサンプルのお知らせデータを表示
  const [notices] = useState([
    {
      id: 1,
      title: "運動会のお知らせ",
      content:
        "来月の運動会の準備についてお知らせいたします。詳細は後日配布予定です。",
      date: "2025-07-15",
      priority: "high" as const,
    },
    {
      id: 2,
      title: "システムメンテナンス",
      content:
        "7月20日（日）午前2時〜午前6時の間、システムメンテナンスを実施いたします。",
      date: "2025-07-14",
      priority: "medium" as const,
    },
  ]);

  const handleLogout = () => {
    // TODO: ログアウト処理の実装
    console.log("ログアウトが実行されました");
    // 実際の実装では認証状態をクリアしてログイン画面に遷移
  };

  const handleNavigate = (path: string) => {
    // TODO: ナビゲーション処理の実装
    console.log(`${path}への遷移が実行されました`);
    // 実際の実装ではReact Routerなどを使用してページ遷移
  };

  return (
    <div className={styles.app}>
      <Header userName={userName} onLogout={handleLogout} />
      <main className={styles.mainContent}>
        <NoticeBoard notices={notices} />
        <Dashboard onNavigate={handleNavigate} />
      </main>
    </div>
  );
}

export default App;
