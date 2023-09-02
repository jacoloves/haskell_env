module Main where

main::IO()
main = do
    [a, b] <- map read . words <$> getLine :: IO [Int]
    let firstNum = a `mod` 10
    let secondNum = b `mod` 10
    
    if firstNum > secondNum
        then print a
        else print b
