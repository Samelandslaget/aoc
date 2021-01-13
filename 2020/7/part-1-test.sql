-- id of shiny gold: 4

IF OBJECT_ID (N'dbo.recFun', N'FN') IS NOT NULL DROP FUNCTION recFun;
go
CREATE FUNCTION dbo.recFun(@containing_id int)
RETURNS int
AS
BEGIN
	if (0 in (select count(1) from d7_contents_test where containing_color_id = @containing_id))
		return 0;
	if (4 in (select contained_color_id from d7_contents_test where containing_color_id = @containing_id))
		return 1;
	--return 1 + dbo.recFun(@return_value - 1);
	return (select sum(dbo.recFun(contained_color_id)) from d7_contents_test where containing_color_id = @containing_id);
END;
go

select count(1) as gold
from d7_colors_test
where dbo.recFun(id) > 0