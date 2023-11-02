module Main where
import Control.Monad
-- import Data.Char
import Data.List (sortBy)

f :: [String] -> [[Int]]
f strings = zipWith(\i s -> [i, length (filter (=='o') s)]) [1..] strings

main :: IO ()
main = do
    n <- readLn :: IO Int
    array <- replicateM n (getLine :: IO String)

    let arrCount = f array

    let sortArry = sortBy (\[i1, o1] [i2, o2] -> if o1 == o2 then compare i1 i2 else compare o2 o1) arrCount

    let firstSortArray = map head sortArry

    putStrLn $ unwords $ map show firstSortArray
