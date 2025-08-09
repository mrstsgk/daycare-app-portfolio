import {useEffect, useState} from "react";
import {AuthError, onAuthStateChanged, signInWithEmailAndPassword, signOut, User, UserCredential,} from "firebase/auth";
import {auth} from "../config/firebase";
import {authApi, UserSummaryDto} from "../api/client";

// Firebase エラーかどうかを判定する型ガード
const isFirebaseError = (error: unknown): error is AuthError => {
    return (
        typeof error === "object" &&
        error !== null &&
        "code" in error &&
        typeof (error as AuthError).code === "string"
    );
};

interface AuthState {
    firebaseUser: User | null;
    appUser: UserSummaryDto | null;
    loading: boolean;
    error: string | null;
    isAuthenticated: boolean;
}

interface LoginCredentials {
    email: string;
    password: string;
}

export const useAuth = () => {
    const [authState, setAuthState] = useState<AuthState>({
        firebaseUser: null,
        appUser: null,
        loading: true,
        error: null,
        isAuthenticated: false,
    });

    // Firebase認証状態の監視
    useEffect(() => {
        const unsubscribe = onAuthStateChanged(auth, async firebaseUser => {
            if (firebaseUser) {
                try {
                    // FirebaseのlocalIdを取得（uidがlocalIdに相当）
                    const localId = firebaseUser.uid;

                    // バックエンドにlocalIdで認証を確認
                    const backendResponse = await authApi.login(localId);

                    if (backendResponse.success && backendResponse.user) {
                        // 成功: FirebaseとBackend両方で認証OK
                        setAuthState({
                            firebaseUser,
                            appUser: backendResponse.user,
                            loading: false,
                            error: null,
                            isAuthenticated: true,
                        });
                    } else {
                        // Backend認証失敗: Firebaseからもログアウト
                        console.warn(
                            "Backend authentication failed, logging out from Firebase"
                        );
                        await signOut(auth);
                        setAuthState({
                            firebaseUser: null,
                            appUser: null,
                            loading: false,
                            error: backendResponse.error || "認証に失敗しました",
                            isAuthenticated: false,
                        });
                    }
                } catch (error) {
                    console.error("Backend authentication error:", error);
                    // エラー時もFirebaseからログアウト
                    await signOut(auth);
                    setAuthState({
                        firebaseUser: null,
                        appUser: null,
                        loading: false,
                        error: "認証処理中にエラーが発生しました",
                        isAuthenticated: false,
                    });
                }
            } else {
                // Firebaseでログインしていない
                setAuthState({
                    firebaseUser: null,
                    appUser: null,
                    loading: false,
                    error: null,
                    isAuthenticated: false,
                });
            }
        });

        return () => unsubscribe();
    }, []);

    // ログイン処理
    const login = async (
        credentials: LoginCredentials
    ): Promise<{ success: boolean; error?: string }> => {
        setAuthState(prev => ({...prev, loading: true, error: null}));

        try {
            // 1. Firebaseでログイン
            const userCredential: UserCredential = await signInWithEmailAndPassword(
                auth,
                credentials.email,
                credentials.password
            );

            // 2. localIdを取得（uidがlocalIdに相当）
            const localId = userCredential.user.uid;

            // デバッグ情報出力
            console.log("🔥 Firebase認証成功！");
            console.log("📧 Email:", userCredential.user.email);
            console.log("🆔 Firebase UID (localId):", localId);
            console.log("👤 Display Name:", userCredential.user.displayName);

            // 3. バックエンドでlocalIdを使って認証
            console.log("🚀 バックエンドAPI呼び出し開始...");
            const backendResponse = await authApi.login(localId);

            if (backendResponse.success && backendResponse.user) {
                // 成功
                setAuthState({
                    firebaseUser: userCredential.user,
                    appUser: backendResponse.user,
                    loading: false,
                    error: null,
                    isAuthenticated: true,
                });

                return {success: true};
            } else {
                // Backend認証失敗: Firebaseからもログアウト
                await signOut(auth);
                const errorMessage =
                    backendResponse.error || "アプリケーション認証に失敗しました";
                setAuthState(prev => ({
                    ...prev,
                    loading: false,
                    error: errorMessage,
                    isAuthenticated: false,
                }));
                return {success: false, error: errorMessage};
            }
        } catch (error: unknown) {
            let errorMessage = "ログインに失敗しました";

            if (isFirebaseError(error)) {
                errorMessage = getErrorMessage(error.code);
            } else if (error instanceof Error) {
                console.error("Login error:", error.message);
                errorMessage = "ログイン処理中にエラーが発生しました";
            }

            setAuthState(prev => ({
                ...prev,
                loading: false,
                error: errorMessage,
                isAuthenticated: false,
            }));
            return {success: false, error: errorMessage};
        }
    };

    // ログアウト処理
    const logout = async (): Promise<{ success: boolean; error?: string }> => {
        try {
            // Firebaseからログアウト (バックエンドは接続しないので、Firebaseのみ)
            await signOut(auth);
            setAuthState({
                firebaseUser: null,
                appUser: null,
                loading: false,
                error: null,
                isAuthenticated: false,
            });
            return {success: true};
        } catch {
            const errorMessage = "ログアウトに失敗しました";
            setAuthState(prev => ({
                ...prev,
                error: errorMessage,
            }));
            return {success: false, error: errorMessage};
        }
    };

    // エラーコードを日本語メッセージに変換
    const getErrorMessage = (errorCode: string): string => {
        switch (errorCode) {
            case "auth/user-not-found":
                return "ユーザ��が見つかりません";
            case "auth/wrong-password":
                return "パスワードが間違っています";
            case "auth/invalid-email":
                return "メールアドレスの形式が正しくありません";
            case "auth/user-disabled":
                return "このアカウントは無効化されています";
            case "auth/too-many-requests":
                return "ログイン試行回数が多すぎます。しばらく待ってからお試しください";
            case "auth/network-request-failed":
                return "ネットワークエラーが発生しました";
            case "auth/invalid-credential":
                return "メールアドレスまたはパスワードが間違っています";
            default:
                return "ログインに失敗しました";
        }
    };

    return {
        firebaseUser: authState.firebaseUser,
        user: authState.appUser, // アプリケーション側のユーザー情報
        loading: authState.loading,
        error: authState.error,
        isAuthenticated: authState.isAuthenticated,
        login,
        logout,
    };
};
