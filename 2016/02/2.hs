{-
First line: start at 5
Subsequent lines: start at previous button pressed
Any move that would lead you outside of the numpad is ignored.

  1
 234
56789
 ABC
  D
-}

testInput = ["ULL","RRDDD","LURDL","UUUUD"]
input' = ["RLRLLLULULULUUDUULULRDDLURURDDLDUUDDLRDDUUUDDRUDLRRDDUDUUDULUDRDULRUDRULRDRUDLDDULRRDLDRLUDDLLDRDDDUDDLUDUDULDRLLDRLULRLURDLULRUUUDRULLUUDLRDLDDUDRRRLDLRUUURRLDDRRRURLLULDUULLDRLRDLLDURDLDDULLDDLDLUURRRURLRURLLRRDURLDUDDLULUUULULLLDRRRRRLULRDUDURURLULRURRRLLUURDURULRRUULDRDLULDLLUDLUDRLUDLRRLDLLDLDUDDLULLDRULRLRULDURRDLDLLUDRLLDRRDLDUDUURUURDUUDDDLDLDDRDLUDLDUUUUDLDRLRURDLURURDLLLUURURDRDLUDLLRUDULLLDLULLULLDLDDRDRRRUDDDUDDDDRULLLLRLDDLLRDRLLLRRLDRRUDRUUURLLLRULRRDURDLDRLDDUUDUUURRLRRUDLDLDDRUDLULLUUDUUUDLUDDRUULLLURUDDDDLRUDDLLLRUR", "LDLRLDDDLUDRDRRUDUURLRULLUDDRLURLUULDLLRLLUDLRLRUDLULRLRRLRURLDDDURUDUUURDRLDDLUUUDRUDUDDDLLURLLULRUULLUDRULUDDULDUDUDULLDRUUUULRDUUDLUDURDLLRLLRLUUDUUDRLLLRULUURUDLDRLLDUDLDDRULDULDURRLDDDUDUDDRUDUDRDURLLLLLULDRDDLLUDULLLUDRURLDLDLDULLDDRURRLUDDRLURLULRLDDDUUUURLRDLRURDDURLDLRRLLRLRLUURRLLDDLDRLRDUDDLLDDDURUUDURLRRDUULRRDDRRUULDRLRUDRRLDDRLDRULLDLDURRULDURRRDLRRLRLLLRLDRLLULRRLLLLLDLDDULDLLDLLDUUDDRLURUUUUULRDDLRDLRDRDRDLUDDLDDRULLUDDRLDLLUDRLUURRLUDURURLLRURRURRLRLLRLURURDDDDRRLURDUULLUU", "LLRRDURRDLDULRDUDLRDRDRURULDURUDRRURDDDRLDLDRDRDRDRULDUURLULDDUURUULUDULLDUDLLLLDLLLDRLUUULLULDDRRUDDULLLULRDRULDDULDUDRDDLUUURULDLLUDUUUUURUDLLDRDULLRULLDURDRLLDLDRDDURUULUDURRRUULLDUUDDURDURLDLRRLLDURDDLRRRUDLRRRDLDRLUDLUDRDRLDDLLLRLLRURDLRDUUUURRLULDDLDLLLUDRDRLRRDURDDLURDLDDDULLLRRLDDDRULDDDLRRDULUUUDRRULDDLLLURDRRLLLUULDRRRUURRDDLULDRLULDDDLDULDRRRULRULLURLURULLLLRUDRRRDRDRDLDULURLRRRRLRUDDRRRUURUURLLRURURUURRURRDLDLLUDRRRDUDDRDURLLRLRRULD", "DULRRDRLRLUDLLURURLLRLRDLLDLLDRDUURLRUUUDLLDUUDDUULDUULLRUDRURLUDRDLRUDDDLULUDLLDRULULLLDRRULDLLUURLRRRLDRDLDRURRRRDLRUUDULLRLLLDLRUDLDUUDRLDLRDRLRDLDDDUDLRUDLDDLLLDRLLRRUUDRDDUUURURRRUUDLRRDDRUDLDDULULDLRRLRDDUDRUURRUULURLURUDRRURRRULDDDDURDLUUULUULULRDLRRRRRURURRLRUULDUUURRDRRDLDUUUULLULLLLUDLUUDUURRDLDLRRRLUUURULDULDLDRLLURDRUULLLLLULLLDRURURRUDRRRRUDUDUDRUDUDRDRULUUDRURDDUUDLDLDUURUDURLRLRRDRDRDLLDUDDULLRDLDDRLLDLRDURDDULLLDLLLULDLUUUDLDRDLURUURDDLRDLLLLLRLURDLLLULLRRLU", "DUULULUUDUDLLRLRURULLDLRRLURDLLDUDUDDRURRLUDULULDRRDRLUULUDDLUURURDLDDDRDRUDURLDDLUDUURULRRUUDRLURRLRLDURRRULRLDDDRUDDDDDUDDULLLRRLLDULDRULUDLRRDLLUDRDLDULRLLLUULLRULRLLLLUDDRRDRLULDLDLURDDRUDDLDLDLDRULDLLDDUUDULUULULLURDURRLLUDRULLRDUDRDRURDRDRDURUUDULDDRURUDLLUUDUUDURDLRDRURUDRUURLUUURLRLUDRUDRUURLLUDRLURDDURRUDRDRLRRLDDDRDDLUUUDDLULDUURUDUDLLDRURDURRDULRLURRDLDDRLUDRLDLRLDDUURRULDDLDUDDLRDULLDDDLDUUUUDLRUDUDLDRDLRDDLDLRLLUDDRRLUDLDUUULLDDRLRRDLRRRRUDDLRLLULRLRDURDUDDRRULLDDLDLRRDLLULDURURDDURLRLULULURRUDUDRDLURULDUDLUULDUUURLLRUDLLRDLRUDRLULDUDRRDUUDUUULUUUDDRUD"]


newPosFromMove :: Char -> (Int, Int) -> (Int, Int)
newPosFromMove 'R' (2, 4) = (2, 4)
newPosFromMove 'R' (3, 3) = (3, 3)
newPosFromMove 'R' (4, 2) = (4, 2)
newPosFromMove 'R' (3, 1) = (3, 1)
newPosFromMove 'R' (2, 0) = (2, 0)
newPosFromMove 'R' (x, y) = (x + 1, y)

newPosFromMove 'L' (2, 4) = (2, 4)
newPosFromMove 'L' (1, 3) = (1, 3)
newPosFromMove 'L' (0, 2) = (0, 2)
newPosFromMove 'L' (1, 1) = (1, 1)
newPosFromMove 'L' (2, 0) = (2, 0)
newPosFromMove 'L' (x, y) = (x - 1, y)

newPosFromMove 'U' (0, 2) = (0, 2)
newPosFromMove 'U' (1, 3) = (1, 3)
newPosFromMove 'U' (2, 4) = (2, 4)
newPosFromMove 'U' (3, 3) = (3, 3)
newPosFromMove 'U' (4, 2) = (4, 2)
newPosFromMove 'U' (x, y) = (x, y + 1)

newPosFromMove 'D' (0, 2) = (0, 2)
newPosFromMove 'D' (1, 1) = (1, 1)
newPosFromMove 'D' (2, 0) = (2, 0)
newPosFromMove 'D' (3, 1) = (3, 1)
newPosFromMove 'D' (4, 2) = (4, 2)
newPosFromMove 'D' (x, y) = (x, y - 1)

newPosFromIns :: String -> (Int, Int) -> (Int, Int)
newPosFromIns "" pos = pos
newPosFromIns ins pos = newPosFromIns (tail ins) (newPosFromMove (head ins) pos)

addNumToCode :: Char -> String -> String
addNumToCode num code = code ++ [num]

posToNum :: (Int, Int) -> String
posToNum (2,4) = "1"
posToNum (1,3) = "2"
posToNum (2,3) = "3"
posToNum (3,3) = "4"
posToNum (0,2) = "5"
posToNum (1,2) = "6"
posToNum (2,2) = "7"
posToNum (3,2) = "8"
posToNum (4,2) = "9"
posToNum (1,1) = "A"
posToNum (2,1) = "B"
posToNum (3,1) = "C"
posToNum (2,0) = "D"

newPosFromInss :: [String] -> (Int, Int) -> String -> ((Int, Int), String)
newPosFromInss [] pos code = (pos, code)
newPosFromInss inss pos code =
  newPosFromInss
    (tail inss)
    (newPosFromIns (head inss) pos)
    (code ++ (posToNum (newPosFromIns (head inss) pos)))
