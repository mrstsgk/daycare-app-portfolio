import React, { useEffect, useState } from "react";
import { studentApi, StudentResponseModel } from "./api/client";

function App() {
  const [students, setStudents] = useState<StudentResponseModel[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchStudents = async () => {
      try {
        const data = await studentApi.getStudents();
        setStudents(data);
        setLoading(false);
      } catch (err) {
        setError("生徒データの取得に失敗しました");
        setLoading(false);
        // eslint-disable-next-line no-console
        console.error(err);
      }
    };

    fetchStudents();
  }, []);

  if (loading) return <div>読み込み中...</div>;
  if (error) return <div>{error}</div>;

  return (
    <div className="App">
      <header className="App-header">
        <h1>保育園管理システム</h1>
      </header>
      <main>
        <h2>生徒一覧</h2>
        <table>
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
                <td>{student.age}</td>
                <td>{student.className}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </main>
    </div>
  );
}

export default App;
