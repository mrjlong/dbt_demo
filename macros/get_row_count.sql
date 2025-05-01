{% macro get_row_count(relation) %}
    {% set query %}
        select count(*) as row_count from {{ relation }}
    {% endset %}

    {% set results = run_query(query) %}
    {% if execute %}
        {{ results.columns[0].values()[0] }}
    {% else %}
        0
    {% endif %}
{% endmacro %}
