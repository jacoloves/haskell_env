module Main where

main = do
    let eps = 1e-4
    n <- readLn :: IO Double

    let (left, right) = fr 0.0 100.0 eps n
    let ans = left

    print ans

fr :: Double -> Double -> Double -> Double -> (Double, Double)
fr left right eps n
    | right - left < eps = (left, right)
    | f < n = fr mid right eps n
    | otherwise = fr left mid eps n
    where
        mid = (left + right) / 2.0
        f = mid * (mid * (mid + 1.0) + 2.0) + 3.0
