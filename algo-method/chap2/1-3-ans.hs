module Main where

main = do
    n <- readLn :: IO Int
    a <- map read . words <$> getLine :: IO [Int]
    print . solve n $ zip [50,10,5,1] a

solve _ [] = 0
solve x ((y,c):ycs) = case r of
    0 -> count
    _ -> count + solve r ycs
    where
        count = min c $ div x y
        r = x - count * y
    
