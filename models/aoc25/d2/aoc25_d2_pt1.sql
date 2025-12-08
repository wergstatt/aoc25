select sum(val)
from {{ ref('aoc25_d2_product_range_bounds') }}
cross join lateral generate_series(range_start, range_end) as s(val)
where length(val::varchar) % 2 = 0
  and left(val::varchar, (length(val::varchar) / 2)::bigint)
        = right(val::varchar, (length(val::varchar) / 2)::bigint)
