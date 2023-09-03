module Main where

main::IO()
main = do
    strFirst <- getLine
    strSecond <- getLine

    if strFirst == strSecond
        then putStrLn "Yes"
        else putStrLn "No"
