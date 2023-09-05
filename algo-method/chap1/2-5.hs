module Main where

main::IO()
main = do
    str <- getLine
    let hour = read str :: Int
    print $ 24 - hour
