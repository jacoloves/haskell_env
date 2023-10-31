module Main where

main :: IO ()
main = do
    input <- getLine
    if f input
        then putStrLn "Yes"
        else putStrLn "No"

f :: String -> Bool
f s = all (\(i, c) -> i `mod` 2 == 0 || c == '0') $ zip [0..] s