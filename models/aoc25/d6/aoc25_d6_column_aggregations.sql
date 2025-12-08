select
  list_reduce(
    column_values,
    lambda x,y : case when o.op = '+' then x + y else x * y end,
    case when o.op = '+' then 0 else 1 end
  ) as val
from {{ ref('aoc25_d6_column_values') }} as cv
join {{ ref('aoc25_d6_operations') }} as o on cv.col_idx = o.op_idx
