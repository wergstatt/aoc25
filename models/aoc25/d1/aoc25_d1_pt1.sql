select
  count(*) filter (where state = 0) as n_zeroes
from {{ ref('aoc25_d1_states') }}
