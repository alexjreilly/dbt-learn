
WITH customer_payments AS (

    SELECT
        stg_orders.order_id,
        stg_orders.customer_id,
        stg_payments.amount

    FROM {{ ref('stg_orders') }} stg_orders

    LEFT JOIN {{ ref('stg_payments') }} stg_payments
        ON stg_orders.order_id = stg_payments.order_id
)


SELECT
    customer_payments.*,
    ltv.life_time_value

FROM customer_payments

LEFT JOIN (

    SELECT
        customer_id,
        SUM(amount) AS life_time_value

    FROM customer_payments

    GROUP BY
        customer_id

) AS ltv

    ON customer_payments.customer_id = ltv.customer_id
