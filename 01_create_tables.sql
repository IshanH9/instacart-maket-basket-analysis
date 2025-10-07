-- 01_create_tables.sql
CREATE OR REPLACE TABLE aisles (
  aisle_id INTEGER PRIMARY KEY,
  aisle VARCHAR
);

CREATE OR REPLACE TABLE departments (
  department_id INTEGER PRIMARY KEY,
  department VARCHAR
);

CREATE OR REPLACE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name VARCHAR,
  aisle_id INTEGER,
  department_id INTEGER
);

CREATE OR REPLACE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  eval_set STRING,
  order_number INTEGER,
  order_dow INTEGER,
  order_hour_of_day INTEGER,
  days_since_prior_order INTEGER
);

CREATE OR REPLACE TABLE order_products (
  order_id INTEGER,
  product_id INTEGER,
  add_to_cart_order INTEGER,
  reordered INTEGER,
  PRIMARY KEY (order_id, product_id)
);
