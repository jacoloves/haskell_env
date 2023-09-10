module Main where

main = do
    n <- readLn :: IO Int

    let cnt = countSteps n 0
    print cnt

countSteps :: Int -> Int -> Int
countSteps 0 cnt = cnt
countSteps n cnt
    | n `mod` 3 == 0 = countSteps (n `div` 3) (cnt + 1)
    | otherwise = countSteps (n - 1) (cnt + 1)
