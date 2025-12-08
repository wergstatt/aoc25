select r1.rn as rn, sum(r2.rotate) % 100 as state
from {{ ref('aoc25_d1_rotations') }} as r1
join {{ ref('aoc25_d1_rotations') }} as r2 on r1.rn > r2.rn
group by all
order by rn
