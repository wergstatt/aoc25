select col_idx, array_agg(val) as column_values
from {{ ref('aoc25_d6_grid') }}
group by col_idx
