{% test assert_row_count_greater_than(model, min_count) %}
    {% set actual_count = get_row_count(model) %}

    select
        {{ actual_count }} as actual,
        {{ min_count }} as minimum
    where {{ actual_count }} < {{ min_count }}
{% endtest %}

