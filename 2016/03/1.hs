{-
A "triangle" with sides a, b and c is impossiple if any of the following is true.
a + b <= c
a + c <= b
b + c <= a

tri = triangle
pos = possible
-}

import Data.List.Split

isTriPos :: (Ord a, Num a) => (a, a, a) -> Bool
isTriPos (a, b, c) = (a + b > c) && (a + c > b) && (b + c > a)

tupify3 :: [a] -> (a,a,a)
tupify3 [a,b,c] = (a,b,c)

intifyTup3 (a,b,c) = (read a :: Int, read b :: Int, read c :: Int)

isTriStrPos :: String -> Bool
isTriStrPos triString = isTriPos (intifyTup3 (tupify3 (words triString)))

isTrue n = n == True

main = do
    content <- readFile "in.txt" 
    let results = map isTriStrPos $ lines content
    let trues = length $ filter isTrue results 
    putStrLn (show (trues))
