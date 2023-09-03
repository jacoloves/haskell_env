module Main where

main::IO()
main = do
    s <- getLine
    n <- getLine

    let nInt = read n :: Int

    putStrLn [s !! (nInt - 1)]
