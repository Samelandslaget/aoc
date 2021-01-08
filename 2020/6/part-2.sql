drop table if exists #ints;
create table #ints (i int);
insert into #ints values
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26)

select sum(counts.all_yes_count) answer from
(
	select t1.group_id, count(c) all_yes_count from
	(
		select p1.c c, count(p1.c) c_count, p1.group_id group_id from
		(
			select substring(p.answers, n.i, 1) c, p.id, p.group_id
			from d6 p
 			join #ints n on n.i <= len(p.answers)
		) p1
		inner join
		(
			select substring(p.answers, n.i, 1) c, p.id, p.group_id
			from d6 p
 			join #ints n on n.i <= len(p.answers)
		) p2
		on p1.group_id = p2.group_id
			and p1.c = p2.c
		group by p1.c, p1.group_id
	) t1
	inner join
	(
		select count(p.id) group_size, p.group_id
		from d6 p
		group by group_id
	) t2
	on t1.group_id = t2.group_id
	where c_count = group_size * group_size
	group by t1.group_id
) counts