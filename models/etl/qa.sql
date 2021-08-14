DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  product_name VARCHAR(125),
  slogan VARCHAR(255),
  description VARCHAR,
  category VARCHAR(50),
  default_price FLOAT(2)
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  product_id INTEGER NOT NULL REFERENCES products(id),
  helpful INTEGER DEFAULT 0,
  reported BOOLEAN DEFAULT 'false',
  body VARCHAR NOT NULL,
  username VARCHAR(100),
  email VARCHAR(255),
  created_at timestamp with time zone
);

CREATE TABLE answers (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  question_id INTEGER NOT NULL REFERENCES questions(id),
  helpful INTEGER DEFAULT 0,
  reported BOOLEAN DEFAULT 'false',
  body VARCHAR NOT NULL,
  username VARCHAR(100),
  email VARCHAR(255),
  created_at timestamp with time zone
);

CREATE TABLE photos (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  answer_id INTEGER REFERENCES answers(id),
  photo_url VARCHAR(255) NOT NULL
);

CREATE INDEX photos_answerid on photos (answer_id);
CREATE INDEX answers_questionid on answers (question_id);
CREATE INDEX questions_productid on questions (product_id);