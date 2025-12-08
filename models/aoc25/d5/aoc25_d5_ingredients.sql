select val::bigint as ingredient_id
from {{ ref('aoc25_d5_puzzle_inputs') }}
where rn > ( select sep_rn from {{ ref('aoc25_d5_sep') }} )
