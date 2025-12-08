select count(*)
from {{ ref('aoc25_d7_tachyon_beam') }} as tb
join {{ ref('aoc25_d7_tachyon_manifold') }} as tm
  on tm.row_idx = tb.row_idx + 1 -- a spliiter must follow beam
  and tm.col_idx = tb.col_idx
where tm.symbol = '^'
