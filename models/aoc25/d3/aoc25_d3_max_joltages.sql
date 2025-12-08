select b1.bank_id, max((b1.battery_level || b2.battery_level)::int) as max_joltage
from {{ ref('aoc25_d3_batteries') }} as b1
join {{ ref('aoc25_d3_batteries') }} as b2
  on b1.bank_id = b2.bank_id
  and b1.idx < b2.idx
group by all
