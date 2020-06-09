{-
A "triangle" with sides a, b and c is impossiple if any of the following is true.
a + b <= c
a + c <= b
b + c <= a

tri = triangle
pos = possible

Input is now given in columns...

Take 3 lines at a time.
tupify3 then intifyTup3 each of the three lines
create a tuple of the first element of all the
-}

import Data.List.Split

isTriPos :: (Ord a, Num a) => (a, a, a) -> Bool
isTriPos (a, b, c) = (a + b > c) && (a + c > b) && (b + c > a)

tupify3 :: [a] -> (a,a,a)
tupify3 [a,b,c] = (a,b,c)

intifyTup3 :: (String, String, String) -> (Int, Int, Int)
intifyTup3 (a,b,c) = (read a :: Int, read b :: Int, read c :: Int)

boolToInt :: Bool -> Int
boolToInt True = 1
boolToInt False = 0

getPosTriCountOfTupleChunk :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int) -> Int
getPosTriCountOfTupleChunk (a,b,c) (d,e,f) (g,h,i) =
    boolToInt (isTriPos (a,d,g)) +
    boolToInt (isTriPos (b,e,h)) +
    boolToInt (isTriPos (c,f,i))
    
getPosTriCountOfStringChunk :: [String] -> Int
getPosTriCountOfStringChunk [a,b,c] =
    let tuple1 = intifyTup3 (tupify3 (words a))
        tuple2 = intifyTup3 (tupify3 (words b))
        tuple3 = intifyTup3 (tupify3 (words c))
    in getPosTriCountOfTupleChunk tuple1 tuple2 tuple3

processLinesInChunksOfThree :: [String] -> Int -> Int
processLinesInChunksOfThree [] posTriCount = posTriCount
processLinesInChunksOfThree lines' posTriCount =
     processLinesInChunksOfThree 
         (drop 3 lines')  
         (posTriCount + getPosTriCountOfStringChunk (take 3 lines'))

main = do
    content <- readFile "in.txt" 
    let result = processLinesInChunksOfThree (lines content)  0
    putStrLn (show (result))
