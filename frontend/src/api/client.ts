import axios from 'axios';

const apiClient = axios.create({
    baseURL: process.env.NODE_ENV === 'production' ? '' : process.env.REACT_APP_API_BASE_URL || 'http://localhost:8080',
    headers: {
        'Content-Type': 'application/json',
    },
});

export interface StudentResponseModel {
    id: number;
    name: string;
    age: number;
    className: string;
}

export const studentApi = {
    getStudents: async (): Promise<StudentResponseModel[]> => {
        const response = await apiClient.get<StudentResponseModel[]>('/api/students');
        return response.data;
    }
};

export default apiClient;
