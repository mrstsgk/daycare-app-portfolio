/**
 * 環境変数の型定義と取得
 */
interface FirebaseEnvConfig {
  apiKey: string;
  authDomain: string;
  projectId: string;
  storageBucket: string;
  messagingSenderId: string;
  appId: string;
  measurementId: string;
}

/**
 * Firebase設定用の環境変数を取得
 * 必須の環境変数が不足している場合はエラーを投げる
 */
export const getFirebaseEnvConfig = (): FirebaseEnvConfig => {
  const config = {
    apiKey: import.meta.env.VITE_FIREBASE_API_KEY,
    authDomain: import.meta.env.VITE_FIREBASE_AUTH_DOMAIN,
    projectId: import.meta.env.VITE_FIREBASE_PROJECT_ID,
    storageBucket: import.meta.env.VITE_FIREBASE_STORAGE_BUCKET,
    messagingSenderId: import.meta.env.VITE_FIREBASE_MESSAGING_SENDER_ID,
    appId: import.meta.env.VITE_FIREBASE_APP_ID,
    measurementId: import.meta.env.VITE_FIREBASE_MEASUREMENT_ID,
  };

  // 必須の環境変数をチェック
  const requiredFields: (keyof FirebaseEnvConfig)[] = [
    "apiKey",
    "authDomain",
    "projectId",
  ];
  const missingFields = requiredFields.filter(field => !config[field]);

  if (missingFields.length > 0) {
    throw new Error(
      `Firebase設定に必要な環境変数が不足しています: ${missingFields.join(
        ", "
      )}. .env.localファイルを確認してください。`
    );
  }

  return config;
};
