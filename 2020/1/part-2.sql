select a.Expense * b.Expense * c.Expense as answer
from d1 as a, d1 as b, d1 as c
where a.Expense + b.Expense + c.Expense = 2020
and a.Expense >= b.Expense
and b.Expense >= c.Expense
