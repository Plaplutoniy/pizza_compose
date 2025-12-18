-- init.sql

-- 1. Создание таблицы "restaraunts" (Restaraunt)
CREATE TABLE restaraunts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    adress VARCHAR(255) NOT NULL
);
-- 2. Создание таблицы "chefs" (chef)
CREATE TABLE chefs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    restaraunt_id INTEGER NOT NULL REFERENCES restaraunts(id)
);
-- 3. Создание таблицы "pizzas" (pizza)
CREATE TABLE pizzas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    cheese VARCHAR(255),
    height VARCHAR(255),
    ingr TEXT,
    secret VARCHAR(255),
    restaraunt_id INTEGER REFERENCES restaraunts(id)
);
-- 4. Создание таблицы "reviews" (review)
CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    restaraunt_id INTEGER NOT NULL REFERENCES restaraunts(id),
    rate INTEGER NOT NULL,
    text TEXT
);

-- --- ВСТАВКА ДАННЫХ ---

-- Вставка данных в таблицу restaraunts
INSERT INTO restaraunts (id, name, adress) VALUES
(1, 'У Артёма', 'Байзакова 1'),
(2, 'Лололостаран', 'Байтурсынова 12 а'),
(3, 'ТраТра Пицца', 'Османова 38'),
(4, 'ДораПлица', 'Алтын-Орда 23');

-- Вставка данных в таблицу chefs
INSERT INTO chefs (id, name, restaraunt_id) VALUES
(1, 'Луиджи Итальяни', 1), 
(2, 'Жирнини Панини', 2),
(3, 'Гомерито Пончикито', 3),
(4, 'Дурсуни Хасанини', 4),
(5, 'Эдуардо Лимончиков', 3);

-- Вставка данных в таблицу pizzas
INSERT INTO pizzas (id, name, cheese, height, ingr, secret, restaraunt_id) VALUES
(1, 'Маргаритка', 'Пармезан', 'Пышное', 'базилик, помидоры, ломтики ветчины', 'Лавровый лист', 3),
(2, 'Пеперкони', 'Твороженный', 'Тонкое', 'колбаса, ветчина, конина', 'Жир мангуста', 1),
(3, 'С ананасами', 'Чеддер', 'Классическое', 'дольки ананаса, лук, усы итальянца', 'Ананасы', 2),
(4, 'Четыре Друга', 'Моцарелла', 'Пышное', 'ломтики шампиньонов, мясо скунса, артезианская вода', 'Грибы', 4),
(5, 'С грибами', 'Козий', 'С большими бортиками', 'Шампиньоны, вешенки, топленное масло', 'Мухоморы', 2);

-- Вставка данных в таблицу reviews
INSERT INTO reviews (id, restaraunt_id, rate, text) VALUES
(1, 2, 4, 'Хороший ресторан, но задержали заказ'),
(2, 4, 1, 'Официант плюнул в блюдо'), 
(3, 1, 5, 'Отличный ресторан, всё понравилось'),
(4, 3, 2, 'От пиццы пахло мусоркой');

-- Восстановление последовательности для SERIAL ID (для безопасной работы INSERT)
SELECT setval('restaraunts_id_seq', (SELECT MAX(id) FROM restaraunts));
SELECT setval('chefs_id_seq', (SELECT MAX(id) FROM chefs));
SELECT setval('pizzas_id_seq', (SELECT MAX(id) FROM pizzas));
SELECT setval('reviews_id_seq', (SELECT MAX(id) FROM reviews));