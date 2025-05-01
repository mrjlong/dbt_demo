{% test assert_row_count_equals(model, expected_count) %}
    {% set actual_count = get_row_count(model) %}

    select
        {{ actual_count }} as actual,
        {{ expected_count }} as expected
    where {{ actual_count }} != {{ expected_count }}
{% endtest %}
