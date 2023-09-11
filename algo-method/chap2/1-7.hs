module Main where

import Control.Monad
import Data.List (sortOn)

main :: IO ()
main = do
    n <- readLn :: IO Int
    schedules <- replicateM n $ do
        [sa, ta] <- map read . words <$> getLine :: IO [Int]
        return (sa, ta)

    let ids = [0..n-1]
        sortedIds = sortOn(\i -> snd (schedules !! i)) ids

    let (_, result) = foldl (\(lastTime, count) i ->
            let (sa, ta) = schedules !! i in
                if sa < lastTime
                then (lastTime, count)
                else (ta, count + 1)
            ) (0, 0) sortedIds

    print result
    
