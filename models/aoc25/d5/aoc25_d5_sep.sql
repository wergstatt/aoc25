select min(rn) as sep_rn
from {{ ref('aoc25_d5_puzzle_inputs') }}
where val is null
