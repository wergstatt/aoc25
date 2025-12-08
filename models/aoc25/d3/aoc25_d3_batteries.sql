select
  rn as bank_id,
  generate_subscripts(split(val, ''), 1) as idx,
  unnest(split(val, '')) as battery_level
from {{ ref('aoc25_d3_puzzle_inputs') }}
