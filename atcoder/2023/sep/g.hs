module Main where

main :: IO ()
main = do
  n <- readLn :: IO Int
  if f n then putStrLn "Yes" else putStrLn "No"

f :: Int -> Bool
f n = ff (n `div` 10) (n `mod` 10)

ff :: Int -> Int -> Bool
ff 0 _ = True
ff n p
  | p >= next = False
  | otherwise = ff (n `div` 10) next
  where next = n `mod` 10

