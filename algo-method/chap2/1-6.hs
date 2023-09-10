module Main where
import Control.Monad (replicateM)
import Data.List (minimumBy)
import Data.Function (on)

main = do
    n <- readLn :: IO Int
    points <- replicateM n $ do
        [x,y] <- map read . words <$> getLine
        return (x,y)

    let ans = calcMinDist points
    print ans

distance :: (Double, Double) -> (Double, Double) -> Double
distance (x1, y1) (x2, y2) = sqrt $ (x1 - x2) ** 2 + (y1 - y2) ** 2

calcMinDist :: [(Double, Double)] -> Double
calcMinDist points = loop points 0.0 (head points)
    where
        loop [] ans _ = ans
        loop remaining ans currentPoint =
            let (nextPoint, minDist) = minimumBy(compare `on` snd) $ filter (\(p, _) -> p /= currentPoint) $ map (\p -> (p, distance currentPoint p)) remaining
            in loop (filter (/= nextPoint) remaining) (ans + minDist) nextPoint
