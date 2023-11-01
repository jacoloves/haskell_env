module Main where
import Data.Bits

main :: IO ()
main = do
  k <- readLn :: IO Int
  let a = f k
  print (a !! (k-1))

f :: Int -> [Int]
f k = take k [x | s <- [0..(2^10 - 1)], let x = ff s, x /= 0]

ff :: Int -> Int
ff s =
  let x = foldl(\acc i -> if testBit s i then acc * 10 + i else acc) 0 [9, 8..0]
  in if x == 0 then 0 else x
