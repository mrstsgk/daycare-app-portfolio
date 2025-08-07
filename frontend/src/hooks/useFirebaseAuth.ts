import {useEffect, useState} from "react";
import {onAuthStateChanged, signInWithEmailAndPassword, signOut, User, UserCredential,} from "firebase/auth";
import {auth} from "../config/firebase";

interface AuthState {
    user: User | null;
    loading: boolean;
    error: string | null;
}

interface LoginCredentials {
    email: string;
    password: string;
}

export const useFirebaseAuth = () => {
    const [authState, setAuthState] = useState<AuthState>({
        user: null,
        loading: true,
        error: null,
    });

    // Firebase認証状態の監視
    useEffect(() => {
        const unsubscribe = onAuthStateChanged(auth, user => {
            setAuthState({
                user,
                loading: false,
                error: null,
            });
        });

        return () => unsubscribe();
    }, []);

    // ログイン処理
    const login = async (
        credentials: LoginCredentials
    ): Promise<{ success: boolean; error?: string }> => {
        setAuthState(prev => ({...prev, loading: true, error: null}));

        try {
            const userCredential: UserCredential = await signInWithEmailAndPassword(
                auth,
                credentials.email,
                credentials.password
            );

            setAuthState({
                user: userCredential.user,
                loading: false,
                error: null,
            });

            return {success: true};
        } catch (error: unknown) {
            const firebaseError = error as { code?: string };
            const errorMessage = getErrorMessage(firebaseError.code || 'unknown');
            setAuthState(prev => ({
                ...prev,
                loading: false,
                error: errorMessage
            }));
            return {success: false, error: errorMessage};
        }
    };

    // ログアウト処理
    const logout = async (): Promise<{ success: boolean; error?: string }> => {
        try {
            await signOut(auth);
            setAuthState({
                user: null,
                loading: false,
                error: null,
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
                return "ユーザーが見つかりません";
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
        user: authState.user,
        loading: authState.loading,
        error: authState.error,
        login,
        logout,
    };
};
