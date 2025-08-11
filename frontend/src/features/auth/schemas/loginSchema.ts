import {z} from "zod";

// ログインフォームのzodスキーマ
export const loginSchema = z.object({
    email: z
        .string()
        .min(1, "メールアドレスは必須です")
        .regex(
            /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
            "有効なメールアドレスを入力してください"
        ),
    password: z
        .string()
        .min(1, "パスワードは必須です")
        .regex(
            /[A-Za-z0-9]+/,
            "パスワードは英数字を含めて入力してください"
        )
        .min(6, "パスワードは6文字以上で入力してください"),
});

// TypeScriptの型をzodスキーマから生成
export type LoginFormData = z.infer<typeof loginSchema>;
