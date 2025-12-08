select sum(range_length) as total_fresh_ingredients
from {{ ref('aoc25_d5_fresh_ingredient_ranges') }}
