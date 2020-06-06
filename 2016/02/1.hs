{-
First line: start at 5
Subsequent lines: start at previous button pressed
Any move that would lead you outside of the numpad is ignored.

123
456
789
-}

testInput = ["ULL","RRDDD","LURDL","UUUUD"]


newPosFromMove 'R' (2, y) = (2, y)
newPosFromMove 'R' (x, y) = (x + 1, y)
newPosFromMove 'L' (0, y) = (0, y)
newPosFromMove 'L' (x, y) = (x - 1, y)
newPosFromMove 'U' (x, 2) = (x, 2)
newPosFromMove 'U' (x, y) = (x, y + 1)
newPosFromMove 'D' (x, 0) = (x, 0)
newPosFromMove 'D' (x, y) = (x, y - 1)

newPosFromIns :: String -> (Int, Int) -> (Int, Int)
newPosFromIns "" pos = pos
newPosFromIns ins pos = newPosFromIns (tail ins) (newPosFromMove (head ins) pos)

addNumToCode num code = code ++ [num]

posToNum (0,2) = '1'
posToNum (1,2) = '2'
posToNum (2,2) = '3'
posToNum (0,1) = '4'
posToNum (1,1) = '5'
posToNum (2,1) = '6'
posToNum (0,0) = '7'
posToNum (1,0) = '8'
posToNum (2,0) = '9'

-- generateCodeFromInss :: [String] -> (Int, Int) -> String
-- -- TODO: Exit pattern goes on this line
-- generateCodeFromInss inss pos = newPosFromIns (head inss)

newPosFromInss [] pos = pos
newPosFromInss inss pos = newPosFromInss (tail inss) (newPosFromIns (head inss) pos)

-- main inss pos code = 
