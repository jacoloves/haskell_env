module Main where

main::IO()
main = do
    [a, b] <- map read . words <$> getLine :: IO [Int]

    let ans = a `mod` b == 0
    if ans
        then putStrLn "Yes"
        else putStrLn "No"
