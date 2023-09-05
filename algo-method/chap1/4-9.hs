module Main where
import Control.Monad (replicateM)

main::IO()
main = do
    n <- getLine
    s <- replicateM (read n) getLine

    let leftCnt =  count "left" s
    let rightCnt = count "right" s

    if leftCnt > rightCnt
        then putStrLn "left"
        else if leftCnt < rightCnt
            then putStrLn "right"
            else putStrLn "same"

count :: String -> [String] -> Int
count word = length . filter (==word)
