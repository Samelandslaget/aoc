select a.Expense * b.Expense as answer
from d1 as a, d1 as b
where a.Expense + b.Expense = 2020
and a.Expense >= b.Expense; -- To avoid duplicate answer
