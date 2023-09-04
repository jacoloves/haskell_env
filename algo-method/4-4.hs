module Main where

main::IO()
main = do
    _ <- getLine
    a <- map read . words <$> getLine :: IO [Int]

    let ansList = [x | x <- a, x `mod` 3 == 0]
    mapM_ print ansList
