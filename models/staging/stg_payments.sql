{{
    config(
        materialized='view'
    )
}}


SELECT
    orderid AS order_id,
    amount

FROM {{ source('stripe', 'payment') }}
