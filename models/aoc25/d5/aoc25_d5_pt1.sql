select count(distinct ingredient_id)
from {{ ref('aoc25_d5_ingredients') }} as ig
join {{ ref('aoc25_d5_fresh_ranges') }} as fr
  on ig.ingredient_id between fr.range_start and fr.range_end
