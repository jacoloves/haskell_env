module Main where

main::IO()
main = do
    [a, b] <- map read . words <$> getLine :: IO [Int]
    print $ max a b
