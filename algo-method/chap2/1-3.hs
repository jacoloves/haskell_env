module Main where

main = do
   n <- readLn :: IO Int 
   [a, b, c, d] <- map read . words <$> getLine :: IO [Int]

   let cnt = countCoins n [a, b, c, d]
   print cnt

countCoins :: Int -> [Int] -> Int
countCoins n [a, b, c, d] = count n [a, b, c, d] 0
  where
    count _ [] cnt = 0
    count x (a:as) cnt
        | x >= 50 && a > 0 = count (x - 50) (a - 1:as) (cnt + 1)
        | x >= 10 && a > 0 = count (x - 10) (a - 1:as) (cnt + 1)
        | x >= 5 && a > 0 = count (x - 5) (a - 1:as) (cnt + 1)
        | x >= 1 && a > 0 = count (x - 1) (a - 1:as) (cnt + 1)
        | otherwise = count x as cnt
