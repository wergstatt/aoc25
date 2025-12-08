select
  range_start,
  range_end,

  lag(range_end)  over (order by range_start, range_end) as last_range_end,

  -- build effective ranges of new information.
  greatest(range_start, last_range_end + 1) as effective_range_start,
  range_end - effective_range_start + 1 as range_length
from {{ ref('aoc25_d5_non_submerged_ranges') }}
