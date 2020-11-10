
SELECT
    orderid AS order_id,
    amount

FROM {{ source('stripe', 'payment') }}
