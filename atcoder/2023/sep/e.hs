module Main where

main :: IO ()
main = do
  [n, t] <- fmap (map read . words) getLine :: IO [Int]
  aArray <- fmap (map read . words) getLine :: IO [Int]

  let sum_a = sum aArray

  let (mus, musTime) = f t sum_a aArray 1 0

  putStrLn $ show mus ++ " " ++ show musTime


f :: Int -> Int -> [Int] -> Int -> Int -> (Int, Int)
f _ _ [] mus musTime = (mus, musTime)
f t sum_a (x:xs) mus musTime
  | t > x = f (t - x) sum_a xs (mus + 1) musTime
  | t == x = (mus + 1, x)
  | otherwise = (mus, t)
