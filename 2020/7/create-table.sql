CREATE TABLE d7_colors (
	id int primary key,
	name varchar(256)
)

CREATE TABLE d7_contents (
	containing_color_id int foreign key references d7_colors(id),
	contained_color_id int foreign key references d7_colors(id),
	amount int,
	primary key (containing_color_id, contained_color_id)
)

CREATE TABLE d7_colors_test (
	id int primary key,
	name varchar(256)
)

CREATE TABLE d7_contents_test (
	containing_color_id int foreign key references d7_colors_test(id),
	contained_color_id int foreign key references d7_colors_test(id),
	amount int,
	primary key (containing_color_id, contained_color_id)
)
