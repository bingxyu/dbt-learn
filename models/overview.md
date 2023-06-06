{% docs __overview__ %}
# Monthly Recurring Revenue (MRR) playbook.
This dbt project is a worked example to demonstrate how to model subscription
revenue. **Check out the full write-up [here](https://blog.getdbt.com/modeling-subscription-revenue/),
as well as the repo for this project [here](https://github.com/dbt-labs/mrr-playbook/).**
...

{% enddocs %}

{% docs __dbt_utils__ %}
# Utility macros
Our dbt project heavily uses this suite of utility macros, especially:
- `surrogate_key`
- `test_equality`
- `pivot`
{% enddocs %}

{% docs __codegen__ %}
# Codegen macros
Our dbt project heavily uses this suite of codegen macros, especially:
- `surrogate_key`
- `test_equality`
- `pivot`
{% enddocs %}

{% docs __snowplow__ %}
# Snowplow sessionization
Our organization uses this package of transformations to roll Snowplow events
up to page views and sessions.
{% enddocs %}