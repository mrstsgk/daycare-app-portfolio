import React from "react";
import { useForm } from "react-hook-form";
import { createUserWithEmailAndPassword } from "firebase/auth";
import { auth } from "../config/firebase";
import styles from "./LoginForm.module.scss";

interface LoginFormData {
  email: string;
  password: string;
}

interface LoginFormProps {
  onLogin: (email: string, password: string) => Promise<void>;
  loading: boolean;
  error: string | null;
}

export const LoginForm: React.FC<LoginFormProps> = ({
  onLogin,
  loading,
  error,
}) => {
  const {
    register,
    handleSubmit,
    formState: { errors, isValid },
  } = useForm<LoginFormData>({
    mode: "onChange",
  });

  const onSubmit = async (data: LoginFormData) => {
    await onLogin(data.email, data.password);
  };

  const createTestUser = async () => {
    try {
      console.log("🔨 Firebase新規ユーザー作成開始...");
      const userCredential = await createUserWithEmailAndPassword(
        auth,
        "sasaki@example.com",
        "password123"
      );

      const uid = userCredential.user.uid;
      console.log("✅ Firebase新規ユーザー作成成功！");
      console.log("📧 Email:", userCredential.user.email);
      console.log("🆔 Firebase UID:", uid);
      console.log("💾 このUIDをデータベースに登録してください:", uid);

      alert(
        `Firebase新規ユーザー作成成功！\n\nUID: ${uid}\n\nこのUIDをコピーして、開発者ツールのコンソールログで確認してください。`
      );
    } catch (error: any) {
      console.error("❌ Firebase新規ユーザー作成エラー:", error);
      if (error.code === "auth/email-already-in-use") {
        alert(
          "このメールアドレスは既に登録されています。ログインを試してください。"
        );
      } else {
        alert(`エラー: ${error.message}`);
      }
    }
  };

  return (
    <div className={styles.loginContainer}>
      <form className={styles.loginForm} onSubmit={handleSubmit(onSubmit)}>
        <h1 className={styles.title}>スマ登園</h1>
        <h2 className={styles.subtitle}>ログイン</h2>

        {error && <div className={styles.error}>{error}</div>}

        <div className={styles.inputGroup}>
          <label htmlFor="email">メールアドレス</label>
          <input
            type="email"
            id="email"
            {...register("email", {
              required: "メールアドレスは必須です",
              pattern: {
                value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                message: "有効なメールアドレスを入力してください",
              },
            })}
            placeholder="メールアドレスを入力してください"
            disabled={loading}
          />
          {errors.email && (
            <span className={styles.errorMessage}>{errors.email.message}</span>
          )}
        </div>

        <div className={styles.inputGroup}>
          <label htmlFor="password">パスワード</label>
          <input
            type="password"
            id="password"
            {...register("password", {
              required: "パスワードは必須です",
              minLength: {
                value: 6,
                message: "パスワードは6文字以上で入力してください",
              },
            })}
            placeholder="パスワードを入力してください"
            disabled={loading}
          />
          {errors.password && (
            <span className={styles.errorMessage}>
              {errors.password.message}
            </span>
          )}
        </div>

        <button
          type="submit"
          className={styles.loginButton}
          disabled={loading || !isValid}
        >
          {loading ? "ログイン中..." : "ログイン"}
        </button>

        <div className={styles.helpText}>
          <p>テスト用アカウント:</p>
          <p>メールアドレス: sasaki@example.com</p>
          <p>パスワード: password123</p>
          <p>※デモ用のテストアカウントです</p>
          <br />
          <button
            type="button"
            onClick={() => createTestUser()}
            className={styles.createUserButton}
            disabled={loading}
          >
            テストユーザー作成 (Firebase)
          </button>
        </div>
      </form>
    </div>
  );
};
