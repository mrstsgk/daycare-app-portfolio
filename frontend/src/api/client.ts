import axios from "axios";

const baseURL =
  import.meta.env.MODE === "production"
    ? ""
    : (import.meta.env.VITE_API_BASE_URL ?? "http://localhost:8080");

console.log("🔧 DEBUG - API Base URL:", baseURL);
console.log("🔧 DEBUG - Environment mode:", import.meta.env.MODE);
console.log("🔧 DEBUG - VITE_API_BASE_URL:", import.meta.env.VITE_API_BASE_URL);

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

      console.log("🔍 Login response:", response.data);

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
    } catch (error: any) {
      console.error("🚨 Login API Error:", error);
      return {
        success: false,
        error: error.response?.data?.message || "ログインに失敗しました",
      };
    }
  },
};

export default apiClient;
