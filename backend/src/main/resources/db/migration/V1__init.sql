CREATE TABLE menus (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INTEGER NOT NULL,
    description TEXT
);

INSERT INTO menus (name, price, description) VALUES
('カレーライス', 800, 'スパイシーなカレーライス'),
('ハンバーグ', 950, 'ジューシーなハンバーグ'),
('サラダ', 500, '新鮮な野菜サラダ'); 