module Main where

main::IO()
main = do
    s <- getLine
    [n, m] <- map read . words <$> getLine :: IO [Int]

    let sList = s

    let swapList = take (n - 1) sList ++ [sList !! (m - 1)] ++ drop n (take (m - 1) sList) ++ [sList !! (n - 1)] ++ drop m sList

    putStrLn swapList
