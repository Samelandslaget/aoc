declare @w as int = 11; -- test: width = 11


	select count(*) from d3
	where
		id % @w -- true_x
		=
		(1 * (id / @w)) % @w -- calc_x (y = id / @w)
	and
		tree = 1
union all	
	select count(*) from d3
	where
		id % @w -- true_x
		=
		(3 * (id / @w)) % @w -- calc_x (y = id / @w)
	and
		tree = 1
union all	
	select count(*) from d3
	where
		id % @w -- true_x
		=
		(5 * (id / @w)) % @w -- calc_x (y = id / @w)
	and
		tree = 1
union all	
	select count(*) from d3
	where
		id % @w -- true_x
		=
		(7 * (id / @w)) % @w -- calc_x (y = id / @w)
	and
		tree = 1
union all	
	select count(*) from d3
	where
		(id / @w) % 2 = 0
	and
		id % @w -- true_x
		=
		((id / @w) / 2) % @w -- calc_x (y = id / @w)
	and
		tree = 1
