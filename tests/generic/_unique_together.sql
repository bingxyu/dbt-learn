{#
models:
  - name: orders
    tests:
      - unique:
          column_name: "country_code || '-' || order_id"

schema.yml
test_unique_together:
  - {fields: ['field_1', 'field_2']}
#}

{% test unique_together(model, fields) %}

  with exceptions as (
    select
      {% for field in fields %}
        {{ field }}{% if not loop.last %},{% endif %}
      {% endfor %}

    from
      {{ model }}

    {{ dbt_utils.group_by(n=fields|length) }}

    having
      count(*) > 1
  )

  select count(*) from exceptions

{% endtest %}