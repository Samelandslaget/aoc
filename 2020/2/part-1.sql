select count(*)
from d2
where len(d2.pwd) - len(replace(d2.pwd, d2.letter, '')) <= d2.max
and len(d2.pwd) - len(replace(d2.pwd, d2.letter, '')) >= d2.min
