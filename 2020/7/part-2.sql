IF OBJECT_ID(N'dbo.recFun', N'FN') IS NOT NULL
	DROP FUNCTION recFun;
GO

CREATE FUNCTION dbo.recFun (@containing_id INT)
RETURNS INT
AS
BEGIN
	IF (
			0 IN (
				SELECT count(1)
				FROM d7_contents
				WHERE containing_color_id = @containing_id
				)
			)
		RETURN 0;

	RETURN (
			SELECT sum(amount + amount * dbo.recFun(contained_color_id))
			FROM d7_contents
			WHERE containing_color_id = @containing_id
			);
END;
GO

-- id of shiny gold: 470
SELECT dbo.recFun(470) as solution

--select col.id, col.name, col2.name as containss, con.amount, col2.id
--from d7_colors col
--left join d7_contents con on col.id = con.containing_color_id
--left join d7_colors col2 on con.contained_color_id = col2.id
