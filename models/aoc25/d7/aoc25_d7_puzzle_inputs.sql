select row_number() over () as rn, val
from read_csv('data/dev/d7.csv', header=false, columns={'val': 'VARCHAR'})
