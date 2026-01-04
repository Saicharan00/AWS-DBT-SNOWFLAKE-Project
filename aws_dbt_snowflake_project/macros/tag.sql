{% macro tag(col) %}
    CASE
        WHEN {{col}} < 100 then 'low'
        when {{col}} <200 then 'medium'
        else 'high'
    end

{% endmacro %}