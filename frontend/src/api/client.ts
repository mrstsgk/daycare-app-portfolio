import axios, { AxiosError } from "axios";

const baseURL =
  import.meta.env.MODE === "production"
    ? ""
    : (import.meta.env.VITE_API_BASE_URL ?? "http://localhost:8080");

const apiClient = axios.create({
  baseURL,
  headers: {
    "Content-Type": "application/json",
  },
});

export interface StudentResponseModel {
  id: number;
  name: string;
  age: number;
  className: string;
}

export interface LoginRequestModel {
  localId: string;
}

export interface UserSummaryDto {
  id: number;
  name: string;
}

export interface LoginResponse {
  success: boolean;
  user?: UserSummaryDto;
  error?: string;
}

// Axios エラーかどうかを判定する型ガード
const isAxiosError = (error: unknown): error is AxiosError => {
  return axios.isAxiosError(error);
};

// APIエラーレスポンスの型定義
interface ApiErrorResponse {
  message?: string;
  error?: string;
}

export const studentApi = {
  getStudents: async (): Promise<StudentResponseModel[]> => {
    const response =
      await apiClient.get<StudentResponseModel[]>("/api/students");
    return response.data;
  },
};

export const authApi = {
  login: async (localId: string): Promise<LoginResponse> => {
    try {
      // 実際の/api/loginエンドポイントを使用
      const response = await apiClient.post<{
        success: boolean;
        message: string;
        user?: UserSummaryDto;
      }>("/api/login", { localId });

      if (response.data.success && response.data.user) {
        return {
          success: true,
          user: response.data.user,
        };
      } else {
        return {
          success: false,
          error: response.data.message || "ログインに失敗しました",
        };
      }
    } catch (error: unknown) {
      // Axiosエラーの場合、レスポンスからエラーメッセージを取得
      if (isAxiosError(error)) {
        const errorData = error.response?.data as ApiErrorResponse | undefined;
        return {
          success: false,
          error:
            errorData?.message || errorData?.error || "ログインに失敗しました",
        };
      }

      // その他のエラーの場合
      if (error instanceof Error) {
        return {
          success: false,
          error: error.message || "ログインに失敗しました",
        };
      }

      // 予期しないエラーの場合
      return {
        success: false,
        error: "ログインに失敗しました",
      };
    }
  },
};

export default apiClient;
