drop table if exists #ints;
create table #ints (i int);
insert into #ints values
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26)

select sum(counts.c) from
(
	select count(distinct substring(p.answers, n.i, 1)) as c
	from d6 p
	join #ints n on n.i <= len(p.answers)
	group by group_id
) counts