module Main where

main::IO()
main = do
    s <- getLine
    t <- getLine
    u <- getLine

    putStrLn $ u ++ t ++ s
