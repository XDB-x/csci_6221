-- +micrate Up
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  email VARCHAR,
  password VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS users;
