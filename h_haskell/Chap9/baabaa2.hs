import System.IO (withFile, IOMode (ReadMode), hGetContents)
main = do
    withFile "baabaa.txt" ReadMode $ \handle -> do
        contents <- hGetContents handle
        putStr contents
