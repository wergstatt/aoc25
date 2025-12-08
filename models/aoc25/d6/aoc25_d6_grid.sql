select
  rn as row_idx,
  regexp_replace(trim(val), '\s+', ',', 'g') as clean_val,
  generate_subscripts(split(clean_val, ','), 1) as col_idx,
  unnest(split(clean_val, ','))::bigint as val
from {{ ref('aoc25_d6_puzzle_inputs') }}
where val not like '+%' and val not like '*%'
