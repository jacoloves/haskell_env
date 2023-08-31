module Main where

main::IO()
main = do
    x <- getLine
    let str = concat $ replicate 3 x
    putStrLn str
