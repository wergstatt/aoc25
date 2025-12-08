  select
    regexp_replace(val, '\s+', ',', 'g') as clean_val,
    generate_subscripts(split(clean_val, ','), 1) as op_idx,
    unnest(split(clean_val, ',')) as op
  from {{ ref('aoc25_d6_puzzle_inputs') }}
  where val like '+%' or val like '*%'
