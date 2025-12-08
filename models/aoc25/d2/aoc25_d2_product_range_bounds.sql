select
  idx,
  split_part(product_range, '-', 1)::bigint as range_start,
  split_part(product_range, '-', 2)::bigint as range_end
from {{ ref('aoc25_d2_row_ranges') }}
