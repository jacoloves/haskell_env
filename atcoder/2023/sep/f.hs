module Main where

main :: IO ()
main = do
  n <- readLn :: IO Int
  
  let ans = f n 1
  print ans

f :: Int -> Int -> Int
f n i
  | i * i * i * i == n = i
  | i <= 1000 = f n (i + 1)
  | otherwise = 0
