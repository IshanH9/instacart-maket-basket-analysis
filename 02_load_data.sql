-- 02_load_data.sql
-- Adjust stage paths to your filenames
COPY INTO aisles (aisle_id, aisle) FROM @my_stage/aisles.csv FILE_FORMAT=(FORMAT_NAME='csv_file_format');
COPY INTO departments (department_id, department) FROM @my_stage/departments.csv FILE_FORMAT=(FORMAT_NAME='csv_file_format');
COPY INTO products (product_id, product_name, aisle_id, department_id) FROM @my_stage/products.csv FILE_FORMAT=(FORMAT_NAME='csv_file_format');
COPY INTO orders (order_id, user_id, eval_set, order_number, order_dow, order_hour_of_day, days_since_prior_order) FROM @my_stage/orders.csv FILE_FORMAT=(FORMAT_NAME='csv_file_format');
COPY INTO order_products (order_id, product_id, add_to_cart_order, reordered) FROM @my_stage/order_products.csv FILE_FORMAT=(FORMAT_NAME='csv_file_format');
