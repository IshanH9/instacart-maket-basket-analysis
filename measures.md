# DAX Measures

```DAX
Order Lines = COUNTROWS(fact_order_products)

Distinct Orders = DISTINCTCOUNT(fact_order_products[ORDER_ID])

Distinct Users = DISTINCTCOUNT(fact_order_products[USER_ID])

Distinct Products = DISTINCTCOUNT(fact_order_products[PRODUCT_ID])

Reordered Lines = SUM(fact_order_products[REORDERED])

Reorder Rate = DIVIDE([Reordered Lines], [Order Lines])

Items per Order =
AVERAGEX(
    VALUES(dim_orders[ORDER_ID]),
    CALCULATE(COUNTROWS(fact_order_products))
)

Avg Days Since Prior Order = AVERAGE(dim_orders[DAYS_SINCE_PRIOR_ORDER])

Unique Products (User Context) =
DISTINCTCOUNT(fact_order_products[PRODUCT_ID])
```
