{{
    config(
        materialized='view'
    )
}}


SELECT
    id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    amount/100 AS amount,
    created

FROM {{ source('stripe', 'payment') }}
