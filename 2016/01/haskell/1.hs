{-
Start. Face North.
Ln/Rn = Turn left/right 90 degrees, then walk n steps.

dir = directon
pos = position
ins = instruction


currentDir = 0

def newDir(char turn, int currentDir)
	if turn == 'L'
		return mod (currentDir - 1) 4
	return mod (currentDir + 1) 4

def newPos (int dir, int n, (int, int) (x, y))
	if dir == 0
		return (x, y + n)
	elif dir == 1
		return (x + n, y)
	elif dir == 2
		return (x, y - n)
	else
		return (x - n, y)

def dist((int, int) x, y)
	return (abs x) + (abs y)

-}


input' = ["L5", "R1", "R4", "L5", "L4", "R3", "R1", "L1", "R4", "R5", "L1", "L3", "R4", "L2", "L4", "R2", "L4", "L1", "R3", "R1", "R1", "L1", "R1", "L5", "R5", "R2", "L5", "R2", "R1", "L2", "L4", "L4", "R191", "R2", "R5", "R1", "L1", "L2", "R5", "L2", "L3", "R4", "L1", "L1", "R1", "R50", "L1", "R1", "R76", "R5", "R4", "R2", "L5", "L3", "L5", "R2", "R1", "L1", "R2", "L3", "R4", "R2", "L1", "L1", "R4", "L1", "L1", "R185", "R1", "L5", "L4", "L5", "L3", "R2", "R3", "R1", "L5", "R1", "L3", "L2", "L2", "R5", "L1", "L1", "L3", "R1", "R4", "L2", "L1", "L1", "L3", "L4", "R5", "L2", "R3", "R5", "R1", "L4", "R5", "L3", "R3", "R3", "R1", "R1", "R5", "R2", "L2", "R5", "L5", "L4", "R4", "R3", "R5", "R1", "L3", "R1", "L2", "L2", "R3", "R4", "L1", "R4", "L1", "R4", "R3", "L1", "L4", "L1", "L5", "L2", "R2", "L1", "R1", "L5", "L3", "R4", "L1", "R5", "L5", "L5", "L1", "L3", "R1", "R5", "L2", "L4", "L5", "L1", "L1", "L2", "R5", "R5", "L4", "R3", "L2", "L1", "L3", "L4", "L5", "L5", "L2", "R4", "R3", "L5", "R4", "R2", "R1", "L5"]

newDir 'L' dir = mod (dir - 1) 4
newDir 'R' dir = mod (dir + 1) 4

newPos 0 n (x, y) = (x, y + n)
newPos 1 n (x, y) = (x + n, y)
newPos 2 n (x, y) = (x, y - n)
newPos 3 n (x, y) = (x - n, y)

dist pos = abs (fst pos) + abs (snd pos)

newDirFromIns :: Int -> String -> Int
newDirFromIns dir ins = newDir (head ins) dir

newPosFromIns :: Int -> String -> (Int, Int) -> (Int, Int) 
newPosFromIns dir ins pos = newPos (newDirFromIns dir ins) (read (tail ins) :: Int) pos

doInss :: Int -> [String] -> (Int, Int) -> (Int, Int)
doInss dir [] pos = pos
doInss dir inss pos = doInss (newDirFromIns dir (head inss)) (tail inss) (newPosFromIns dir (head inss) pos)

main = print(head input')
