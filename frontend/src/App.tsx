import React, { useEffect, useState } from "react";
import axios from "axios";

type Student = {
  id: number;
  name: string;
  age: number;
  className: string;
};

const API_BASE_URL = (process.env.REACT_APP_API_BASE_URL as string | undefined) || "http://localhost:8080";

const App: React.FC = () => {
  const [students, setStudents] = useState<Student[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    axios.get<Student[]>(`${API_BASE_URL}/api/students`)
      .then(res => setStudents(res.data))
      .catch(err => {
        console.error("APIエラー:", err);
        setError("生徒データの取得に失敗しました。サーバーの接続を確認してください。");
      })
      .finally(() => setLoading(false));
  }, []);

  if (loading) return <div>読み込み中...</div>;
  if (error) return <div style={{ color: 'red' }}>{error}</div>;

  return (
    <div style={{ maxWidth: 600, margin: "2rem auto", fontFamily: "sans-serif" }}>
      <h1>生徒一覧</h1>
      <table border={1} cellPadding={8} style={{ width: "100%" }}>
        <thead>
          <tr>
            <th>ID</th>
            <th>名前</th>
            <th>年齢</th>
            <th>クラス</th>
          </tr>
        </thead>
        <tbody>
          {students.map(student => (
            <tr key={student.id}>
              <td>{student.id}</td>
              <td>{student.name}</td>
              <td>{student.age}歳</td>
              <td>{student.className}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default App; 