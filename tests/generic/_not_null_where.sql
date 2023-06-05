{#
not_null
config:
        where: "order_date = current_date"

schema.yml
not_null_where:
  - {field: 'field_1', condition: "another_field = 'something'"}
  - {field: 'field_1', condition: "another_field > 0"}
  - {field: 'field_1', condition: "not(field_2 = 'a' and field_3 = 'b')"}
#}



{% test not_null_where(model, field, condition) %}

with validation as (
    select 
        {{ field }} as field
    from {{ model }}
), 

validation_errors as (
    select 
        field
    from validation
    where 
        field is null
        and {{ condition }}
)

select count(*)
from validation_errors

{% endtest %}
