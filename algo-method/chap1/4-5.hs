module Main where

main::IO()
main = do
    _ <- getLine
    a <- map read . words <$> getLine :: IO [Int]

    let ansList =  reverse a
    mapM_ print ansList
