module Main where

main::IO()
main = do
    _ <- getLine
    a <- map read . words <$> getLine :: IO [Int]
    
    print $ minimum a
