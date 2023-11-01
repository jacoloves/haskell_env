module Main where
import Data.List

main :: IO ()
main = do
  [n, x] <- map read . words <$> getLine :: IO [Int]
  a <- map read . words <$> getLine :: IO [Int]
  let ans = f n x a
  print ans

f :: Int -> Int -> [Int] -> Int
f n x a = ff n x a 0

ff :: Int -> Int -> [Int] -> Int -> Int
ff n x a ans
  | ans > 100 = -1
  | otherwise =
      let ac = a ++ [ans]
          sa = sort ac
          sn = sum (drop 1 (take (n - 1) sa))
      in if sn >= x then ans else ff n x a (ans + 1)
