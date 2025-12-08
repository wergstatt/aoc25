select sum(val)
from {{ ref('aoc25_d6_column_aggregations') }}
