select sum(max_joltage) as sum_joltage
from {{ ref('aoc25_d3_max_joltages') }}
