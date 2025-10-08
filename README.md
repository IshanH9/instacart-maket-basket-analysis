# Instacart Market Basket — Snowflake Star Schema + Power BI

### What’s inside
- Snowflake SQL to create stages, tables, load data, and build a **star schema**
- Core **DAX measures** for demand, reorders, and basket size
- **Three Power BI pages**: Overview, Reorder Behavior, Customers & Basket Size
- Screenshots + ERD
- Repro steps to run it yourself

---

## Screenshots

**Overview**
![Overview](https://github.com/IshanH9/instacart-maket-basket-analysis/blob/main/01_overview.png)

**Reorder Behavior**
![Reorder Behavior](https://github.com/IshanH9/instacart-maket-basket-analysis/blob/main/02_reorder_behavior.png)

**Customers & Basket Size**
![Customers & Basket Size](https://github.com/IshanH9/instacart-maket-basket-analysis/blob/main/03_customers_basket.png)

**Dimensional Model (ERD)**
![ERD](https://github.com/IshanH9/instacart-maket-basket-analysis/blob/main/erd.png)

---

## Repo structure
```
instacart-powerbi-snowflake-powerbi/
├─ images/                     # ERD + dashboard screenshots
├─ sql/                        # Snowflake SQL (run in order)
│  ├─ 00_stage_and_file_format.sql
│  ├─ 01_create_tables.sql
│  ├─ 02_load_data.sql
│  ├─ 03_build_dim_fact.sql
│  └─ 10_analytics_examples.sql
├─ dax/
│  └─ measures.md              # Power BI measures used in the report
├─ powerbi/
│  └─ Instacart_Dashboard.pbix # (add your PBIX here, consider Git LFS)
├─ .gitattributes              # LFS for .pbix
├─ .gitignore
└─ LICENSE
```

---

## Dataset
- Public dataset: **Instacart Market Basket Analysis** (Kaggle)
- Download CSVs and place them in your cloud storage/S3 or Snowflake stage.
- Source: https://www.kaggle.com/competitions/instacart-market-basket-analysis

> Note: This repo contains only SQL/DAX and screenshots; no raw data files are committed.

---

## How to reproduce

### Prereqs
- **Snowflake** account & warehouse
- **Power BI Desktop**
- CSV files from the Instacart dataset

### 1) Create stage + file format
Run `sql/00_stage_and_file_format.sql` in Snowflake.  
Replace placeholders for your bucket and credentials (or use an external stage/IAM role).

### 2) Create tables
Run `sql/01_create_tables.sql`.

### 3) Load data
Upload the CSVs to your stage path, then run `sql/02_load_data.sql`.

### 4) Build star schema (dims + fact)
Run `sql/03_build_dim_fact.sql`.

You should now have:
- `fact_order_products`
- `dim_orders`, `dim_users`, `dim_products`, `dim_aisles`, `dim_departments`

### 5) Connect Power BI
- **Get Data → Snowflake** → select the tables above
- Set relationships (Many-to-One, single direction) from each dim to the fact
- Add measures from `dax/measures.md`
- Recreate visuals (Overview, Reorder Behavior, Customers & Basket Size)

### 6) Optional — Git LFS for PBIX
```bash
git lfs install
git lfs track "*.pbix"
git add .gitattributes
```

---

## Quick start (GitHub)
```bash
git init
git add .
git commit -m "Init: Instacart Snowflake + Power BI project"
git branch -M main
git remote add origin https://github.com/<your-username>/instacart-powerbi-snowflake-powerbi.git
git push -u origin main
```
---

## Author
Built originally as a learning project; now maintained with production patterns in mind.  
Open to feedback and extensions (date dimension, incremental loads, semantic model, unit tests with dbt/Great Expectations, etc.).
