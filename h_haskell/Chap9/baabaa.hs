import System.IO (openFile, IOMode (ReadMode), hGetContents, hClose)
main = do
    handle <- openFile "baabaa.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
