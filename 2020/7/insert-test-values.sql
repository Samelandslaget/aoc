declare @id as int = 0;

insert into d7_colors_test values (@id, 'light red')
set @id = @id + 1;
insert into d7_colors_test values (@id, 'dark orange')
set @id = @id + 1;
insert into d7_colors_test values (@id, 'bright white')
set @id = @id + 1;
insert into d7_colors_test values (@id, 'muted yellow')
set @id = @id + 1;
insert into d7_colors_test values (@id, 'shiny gold')
set @id = @id + 1;
insert into d7_colors_test values (@id, 'dark olive')
set @id = @id + 1;
insert into d7_colors_test values (@id, 'vibrant plum')
set @id = @id + 1;
insert into d7_colors_test values (@id, 'faded blue')
set @id = @id + 1;
insert into d7_colors_test values (@id, 'dotted black')
set @id = @id + 1;

set @id = 0;

insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'bright white'), 1)
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'muted yellow'), 2)
set @id = @id + 1;
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'bright white'), 3)
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'muted yellow'), 4)
set @id = @id + 1;
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'shiny gold'), 1)
set @id = @id + 1;
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'shiny gold'), 2)
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'faded blue'), 9)
set @id = @id + 1;
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'dark olive'), 1)
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'vibrant plum'), 2)
set @id = @id + 1;
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'faded blue'), 3)
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'dotted black'), 4)
set @id = @id + 1;
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'faded blue'), 5)
insert into d7_contents_test values (@id, (select id from d7_colors_test where name = 'dotted black'), 6)
set @id = @id + 1;
set @id = @id + 1;
set @id = @id + 1;
