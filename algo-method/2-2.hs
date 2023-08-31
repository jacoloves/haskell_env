module Main where

main::IO()
main = do
    x <- getLine
    let y = read x :: Int
    print $ y `mod` 5
