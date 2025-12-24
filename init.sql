-- init.sql


CREATE TABLE restaraunts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    adress VARCHAR(255) NOT NULL
);

CREATE TABLE chefs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    restaraunt_id INTEGER NOT NULL REFERENCES restaraunts(id)
);

CREATE TABLE pizzas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    cheese VARCHAR(255),
    height VARCHAR(255),
    ingr TEXT,
    secret VARCHAR(255),
    restaraunt_id INTEGER REFERENCES restaraunts(id)
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    restaraunt_id INTEGER NOT NULL REFERENCES restaraunts(id),
    rate INTEGER NOT NULL,
    text TEXT
);

