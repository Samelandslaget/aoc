select count(*)
from d2
where
(
	substring(pwd, d2.min, 1) = letter
	and substring(pwd, d2.max, 1) != letter
)
or
(
	substring(pwd, d2.min, 1) != letter
	and substring(pwd, d2.max, 1) = letter
)
