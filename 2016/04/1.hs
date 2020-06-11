{-
line: string-...-string-int[string]
-}

import System.Environment
import Data.List.Split
import Data.List

main = do
    args <- getArgs
    content <- readFile (head args)
    let lines' = lines content
    let parsedLines = map parseLine lines'
    let result = sum (map valueOfRoom parsedLines)
    putStrLn (show (result))

parseLine :: String -> (String, Int, String)
parseLine line =
    (concat (init lineSplitOnDash),
     read (head (splitOn "[" (last lineSplitOnDash))) :: Int,
     take 5 (last (splitOn "[" (last lineSplitOnDash) ))
    )
    where lineSplitOnDash = splitOn "-" line

valueOfRoom :: (String, Int, String) -> Int
valueOfRoom (encryptedName, id', checksum) = if (topFiveLetters encryptedName) == checksum
    then id'
    else 0

topFiveLetters :: String -> String
topFiveLetters str =
    let c = letterCount str []
        s = sortBy myComparer c
    in take 5 (map fst s)
    
letterCount :: String -> ( [(Char, Int)] -> [(Char, Int)] )
letterCount "" counts = counts
letterCount str counts
    | str /= sort str = letterCount (sort str) counts
letterCount (x:xs) [] = letterCount xs [(x, 1)]
letterCount (x:xs) counts
    | x == fst (head counts) = letterCount xs ((x, (snd (head counts)) + 1) : (tail counts))
    | otherwise = letterCount xs ((x, 1) : counts)

myComparer (a1, b1) (a2, b2)
    | b1 > b2 = LT
    | b1 < b2 = GT
    | b1 == b2= compare a1 a2  
