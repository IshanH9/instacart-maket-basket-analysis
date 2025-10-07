-- 00_stage_and_file_format.sql
-- Replace with your own bucket, creds, or external stage/IAM role
CREATE OR REPLACE STAGE my_stage
  URL = 's3://<your-bucket>/instacart/'
  CREDENTIALS = (AWS_KEY_ID = '<YOUR_KEY>' AWS_SECRET_KEY = '<YOUR_SECRET>');

CREATE OR REPLACE FILE FORMAT csv_file_format
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"';
