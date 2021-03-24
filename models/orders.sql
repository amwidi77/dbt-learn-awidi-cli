with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

)

SELECT o.order_id,
    o.customer_id,
    o.status,
    o.order_date,
    SUM(CASE WHEN p.status = 'success' THEN p.amount ELSE 0 END) as amount
FROM orders AS o
LEFT JOIN payments AS p
WHERE p.status = 'success'
GROUP BY o.order_id, o.customer_id, o.status, o.order_date