select r,c, rc.r * 8 + rc.c as id from
(
	select
	cast(r64 as int) * 64 +
	cast(r32 as int) * 32 +
	cast(r16 as int) * 16 +
	cast(r8 as int) * 8 +
	cast(r4 as int) * 4 +
	cast(r2 as int) * 2 +
	cast(r1 as int) * 1 
	as r,
	cast(c4 as int) * 4 +
	cast(c2 as int) * 2 +
	cast(c1 as int) * 1 
	as c
	from d5
) as rc
order by id desc
