select
  rn as row_idx,
  generate_subscripts(split(val, ''), 1) as col_idx,
  unnest(split(val, '')) as symbol
from {{ ref('aoc25_d7_puzzle_inputs') }}
