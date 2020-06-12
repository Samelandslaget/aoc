{-
line: string-...-string-int[string]
-}

import System.Environment
import Data.List.Split
import Data.List
import Data.Char

main = do
    args <- getArgs
    content <- readFile (head args)
    let lines' = lines content
    let rooms = map parseLine lines'
    let realRooms = filter isRoomReal rooms
    let decryptedRoomNames = map decryptRoom realRooms
    putStrLn (show (decryptedRoomNames))

parseLine :: String -> (String, Int, String)
parseLine line =
    (concat (init lineSplitOnDash),
     read (head (splitOn "[" (last lineSplitOnDash))) :: Int,
     take 5 (last (splitOn "[" (last lineSplitOnDash) ))
    )
    where lineSplitOnDash = splitOn "-" line

isRoomReal :: (String, Int, String) -> Bool
isRoomReal (encryptedName, id', checksum) = (topFiveLetters encryptedName) == checksum

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

-- Bad function name
myComparer (a1, b1) (a2, b2)
    | b1 > b2 = LT
    | b1 < b2 = GT
    | b1 == b2= compare a1 a2

decryptRoom :: (String, Int, String) -> (String, Int)
decryptRoom (encryptedName, id', _) = (caesarDecrypt encryptedName id', id')

caesarDecrypt :: String -> Int -> String
caesarDecrypt [] _ = []
caesarDecrypt (x:xs) cipher = (caesarDecryptChar x cipher) : (caesarDecrypt xs cipher)

caesarDecryptChar :: Char -> Int -> Char
caesarDecryptChar c cipher = intToChar $ mod ((charToInt c) + cipher) 26

intToChar :: Int -> Char
intToChar i = chr (i + (ord 'a'))

charToInt :: Char -> Int
charToInt c = (ord c) - (ord 'a')
