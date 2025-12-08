with recursive tachyon_beam as (
  select *
  from {{ ref('aoc25_d7_tachyon_manifold') }}
  where row_idx = 1
    and symbol = 'S'

  union

  select *
  from (
    select tm.*
    from tachyon_beam as tb
    join {{ ref('aoc25_d7_tachyon_manifold') }} as tm
      on tb.row_idx + 1 = tm.row_idx
      and tb.col_idx = tm.col_idx
    where tm.symbol = '.'

    union

    select tm.*
    from tachyon_beam as tb
    join {{ ref('aoc25_d7_tachyon_manifold') }} as tm
      on tb.row_idx + 1 = tm.row_idx
    qualify lag(tm.symbol) over (partition by tm.row_idx order by tm.col_idx) = '^'
        and tm.symbol = '.'

    union

    select tm.*
    from tachyon_beam as tb
    join {{ ref('aoc25_d7_tachyon_manifold') }} as tm
      on tb.row_idx + 1 = tm.row_idx
    qualify lead(tm.symbol) over (partition by tm.row_idx order by tm.col_idx) = '^'
        and tm.symbol = '.'
  )
)

select *
from tachyon_beam
