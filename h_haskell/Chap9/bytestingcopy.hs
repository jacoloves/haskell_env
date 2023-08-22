import System.Environment (getArgs)
import qualified Data.ByteString.Lazy as B
import Control.Exception (bracketOnError)
import System.IO (openTempFile, hClose)
import System.Directory (removeFile, renameFile)

main = do
    (fileNmale1:fileName2:_) <- getArgs
    copy fileNmale1 fileName2

copy source dest = do
    contents <- B.readFile source
    bracketOnError
        (openTempFile "." "temp")
        (\(tempName, tempHadle) -> do
            hClose tempHadle
            removeFile tempName)
        (\(tempName, tempHadle) -> do
            B.hPutStr tempHadle contents
            hClose tempHadle
            renameFile tempName dest)
