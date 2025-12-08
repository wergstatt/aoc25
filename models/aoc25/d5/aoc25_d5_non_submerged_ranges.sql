select *
from {{ ref('aoc25_d5_fresh_ranges') }} as fr
where not exists (
  -- avoid range that are fully submerged in another.
  select 1
  from {{ ref('aoc25_d5_fresh_ranges') }} as ref
  where fr.rn != ref.rn
    and fr.range_start between ref.range_start and ref.range_end
    and fr.range_end between ref.range_start and ref.range_end
)
