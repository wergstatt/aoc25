select
  rn,
  split_part(val, '-', 1)::bigint as range_start,
  split_part(val, '-', 2)::bigint as range_end
from {{ ref('aoc25_d5_puzzle_inputs') }}
where rn < ( select sep_rn from {{ ref('aoc25_d5_sep') }} )
