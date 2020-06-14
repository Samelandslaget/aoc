import System.Environment
import Data.List

main = do
    args <- getArgs
    content <- readFile (head args)
    let ls = lines content
    let columns = transpose' ls
    putStrLn (map leastCommon columns)

transpose' :: [String] -> [String]
transpose' ls = [ [ l!!i | l <- ls ] | i <- [0..length (head ls)-1] ]

mostCommon :: String -> Char
mostCommon s = head (head [x | x <- grouped, (length x) == maxLength])
    where maxLength = last $ sort $ map length grouped
          grouped = groupBy' s

leastCommon :: String -> Char
leastCommon s = head (head [x | x <- grouped, (length x) == minLength])
    where minLength = head $ sort $ map length grouped
          grouped = groupBy' s

groupBy' :: String -> [String]
groupBy' "" = []
groupBy' str
    | str /= (sort str) = groupBy' (sort str)
groupBy' (x:xs) = takeWhile (\a -> a == x) (x:xs) : (groupBy' (dropWhile (\a -> a == x) (x:xs)))
