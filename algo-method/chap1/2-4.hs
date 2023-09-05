module Main where

main::IO()
main = do
    str <- getLine
    let thirdChar = str !! 2
    putStrLn [thirdChar]
