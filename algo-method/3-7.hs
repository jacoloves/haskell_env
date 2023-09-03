module Main where

main::IO()
main = do
    [a, b, c, d] <- map read . words <$> getLine :: IO [Int]

    print $ max (max a b) (max c d)
