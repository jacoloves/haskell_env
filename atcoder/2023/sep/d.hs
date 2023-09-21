module Main where
import Data.List (foldl')

main :: IO ()
main = do
  n <- readLn :: IO Int
  let ans = s n
  print ans

s :: Int -> Int
s n = foldl' (\cnt i -> if f i then cnt + 1 else cnt) 0 [1..n]

f :: Int -> Bool
f x = all (\base -> not (hD x base)) [8, 10]

hD :: Int -> Int -> Bool
hD 0 _ = False
hD x base = (x `mod` base == 7) || hD (x `div` base) base
