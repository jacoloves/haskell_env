module Main where

main::IO()
main = do
    ns <- map read . words <$> getLine :: IO [Int]
    print $ sum ns
