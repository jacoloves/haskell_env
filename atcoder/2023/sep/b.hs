module Main where

main :: IO ()
main = do
  [a, b] <- fmap (map read . words) getLine :: IO [Int]

  let d = b - a
  let ans = d * (d + 1) `div` 2 - b

  print ans
