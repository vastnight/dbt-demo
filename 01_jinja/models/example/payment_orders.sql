

-- select
-- order_id,
-- sum(case when payment_method = 'bank_transfer' then amount end) as bank_transfer_amount,
-- sum(case when payment_method = 'credit_card' then amount end) as credit_card_amount,
-- sum(case when payment_method = 'gift_card' then amount end) as gift_card_amount,
-- sum(amount) as total_amount
-- from {{ ref('raw_payments') }}
-- group by 1

-- STEP 1: jinja based query
-- {% set payment_methods = ["bank_transfer", "credit_card", "gift_card"] %}

-- select
-- order_id,
-- {% for payment_method in payment_methods %}
-- sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
-- {% endfor %}
-- sum(amount) as total_amount
-- from {{ ref('raw_payments') }}
-- group by 1


-- STEP 2: run_query micro
{% macro get_payment_methods() %}

{% set payment_methods_query %}
select distinct
payment_method
from {{ ref('raw_payments') }}
order by 1
{% endset %}

{% set results = run_query(payment_methods_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}

{% set payment_methods = get_payment_methods() %}
select
    order_id,
    {% for payment_method in payment_methods %}
    sum(case when payment_method = '{{ payment_method }}' then amount end) as {{ payment_method | lower }}_amount,
    {% endfor %}
    sum(amount) as total_amount
from {{ ref('raw_payments') }}
group by 1

-- NEED TO FIX THIS