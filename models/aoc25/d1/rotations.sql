-- initial state is 50.
select 0 as rn, 50 as rotate

union all

select
  rn,
  (2*(left(val, 1) = 'R')::int - 1) * ltrim(val, 'LR')::int as rotate
from {{ ref('puzzle_inputs') }}
