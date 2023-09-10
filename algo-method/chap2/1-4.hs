module Main where
import Control.Monad (liftM, replicateM)
import Data.List (sort)

main = do
    line <- fmap(map read . words) getLine :: IO [Int]
    let n = head line
    let m = line !! 1

    al <- map read . words <$> getLine :: IO [Int]
    bl <- map read . words <$> getLine :: IO [Int]

    let (ans, _) = countPairs al bl 0 0

    print ans

countPairs :: [Int] -> [Int] -> Int -> Int -> (Int, Int)
countPairs _ [] ans _ = (ans, 0)
countPairs [] _ ans _ = (ans, 0)
countPairs (x:xs) (y:ys) ans cnt
    | x <= y = countPairs xs ys (ans + 1) (cnt + 1)
    | otherwise = countPairs (x:xs) ys ans (cnt + 1)
