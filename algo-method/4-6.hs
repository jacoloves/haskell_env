module Main where

main::IO()
main = do
    n <- getLine
    a <- map read . words <$> getLine :: IO [Int]

    let nInt = read n :: Int
    let ans =  sum a `div` nInt

    print ans
