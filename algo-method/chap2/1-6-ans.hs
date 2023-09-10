module Main where

import Control.Monad
import Data.List
import Data.Ord

func :: [(Int, [Double])] -> [Double] -> Double -> Double
func [(_,ab)] o dis = dis + calcDist ab o
func ((i,ab):iab) o dis = 
    func iab' o (dis + cal)
    where
        iab'@((_,ab'):_) = sortOn (calcDist ab . snd) $ sort iab
        cal = calcDist ab ab'

calcDist :: [Double] -> [Double] -> Double
calcDist [a1, b1] [a2, b2] = sqrt $ (a1 - a2) ** 2 + (b1 - b2) ** 2

getDoubleList :: IO [Double]
getDoubleList = map read . words <$> getLine

main :: IO ()
main = do
    n <- readLn
    abs@(ab:_) <- replicateM n getDoubleList
    print $ func (zip [0..] abs) ab 0.0
