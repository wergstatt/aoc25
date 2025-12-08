select
  center.cell_idx,
  count(*) filter (where surround.symbol = '@') as n_rolls
from {{ ref('aoc25_d4_grid') }} as center
join {{ ref('aoc25_d4_grid') }} as surround
  on surround.row_idx between center.row_idx -1 and center.row_idx +1
  and surround.col_idx between center.col_idx -1 and center.col_idx +1
where center.symbol = '@'
group by all
having n_rolls <= 4
