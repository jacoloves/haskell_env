module Main where

main = do
    n <- readLn :: IO Int
    print $ loop 0 n
  where
    loop cnt n | n == 1 = cnt + 1
               | even n = loop (cnt + 1) (n `div` 2)
               | otherwise = loop (cnt + 1) (n - 1)
