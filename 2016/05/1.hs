import System.Environment
import qualified Crypto.Hash.MD5 as CHM
import qualified Data.ByteString.Char8 as BSC
import qualified Data.ByteString.Base16 as BSB

main = do
    args <- getArgs
    doorId <- readFile (head args)
    putStr doorId

md5 str = BSC.unpack . BSB.encode . CHM.hash . BSC.pack $ str

-- WARNING: Infinite!
-- infPass = [x | x <- ()]


-- Note: this file is a WIP
