declare @w as int = 31; -- test: width = 11

select count(*) from d3
where
	id % @w -- true_x
	=
	(3 * (id / @w)) % @w -- calc_x (y = id / @w)
and
	tree = 1