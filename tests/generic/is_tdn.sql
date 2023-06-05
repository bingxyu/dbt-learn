{# Verifies all elements in field are TDNs. If validation_errors returns >0 rows, test fails. #}

{% test is_tdn(model, column_name) %}

with validation as (
  select
    {{ column_name }} as tdn_field
  from {{ model }}
),

validation_errors as (
  select
    tdn_field
  from validation
  where tdn_field not rlike '^\\d{10}$'
)

select count(*)
from validation_errors

{% endtest %}