import System.Environment
import qualified Crypto.Hash.MD5 as CHM
import qualified Data.ByteString.Char8 as BSC
import qualified Data.ByteString.Base16 as BSB

-- NOTE: The actual input should be the argument to main, not the file name of the text file containing the input.
main = do
    args <- getArgs
    let doorId = head args
    let pwd = generatePwd doorId
    putStr pwd

generatePwd :: String -> String
generatePwd doorId = map (!!5) $ take 8 $ filter (\x -> (take 5 x) == "00000" ) $ map md5 $ map (doorId++) $ map show [0..]

md5 str = BSC.unpack . BSB.encode . CHM.hash . BSC.pack $ str
