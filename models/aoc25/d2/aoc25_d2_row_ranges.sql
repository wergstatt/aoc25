select
  generate_subscripts(split(val, ','), 1) AS idx,
  unnest(split(val, ',')) as product_range
from {{ ref('aoc25_d2_puzzle_inputs') }}
