import { useState } from "react";
import { useAuth } from "./features/auth/hooks/useAuth";
import { LoginForm } from "./features/auth/components/loginForm/LoginForm";
import Header from "./components/common/header/Header";
import NoticeBoard from "./features/notice/components/noticeBoard/NoticeBoard";
import Dashboard from "./features/dashboard/components/dashboard/Dashboard";
import styles from "./App.module.scss";

function App() {
  const { user, loading, error, isAuthenticated, login, logout } = useAuth();

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

  const handleLogin = async (email: string, password: string) => {
    const result = await login({ email, password });
    if (!result.success) {
      // 本番環境では適切なエラーハンドリングに置き換える
    }
  };

  const handleLogout = async () => {
    const result = await logout();
    if (!result.success) {
      // 本番環境では適切なエラーハンドリングに置き換える
    }
  };

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const handleNavigate = (_path: string) => {
    // 本番環境では適切なナビゲーション処理に置き換える
  };

  // ローディング中の表示
  if (loading) {
    return (
      <div className={styles.loadingContainer}>
        <div className={styles.loading}>読み込み中...</div>
      </div>
    );
  }

  // 未認証の場合はログインフォームを表示
  if (!isAuthenticated || !user) {
    return <LoginForm onLogin={handleLogin} loading={loading} error={error} />;
  }

  // 認証済みの場合はメインアプリケーションを表示 - バックエンドのユーザー名を使用
  const userName = user.name || "ユーザー";

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
