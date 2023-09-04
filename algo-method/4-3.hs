module Main where

main::IO()
main = do
    _ <- getLine
    a <- map read . words <$> getLine :: IO [Int]

    let ansList =  map (`mod` 10) a
    mapM_ print ansList
