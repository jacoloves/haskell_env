module Main where
import Data.List (sort)

main :: IO ()
main = do
  abc <- fmap (map read . words) getLine :: IO [Int]
  let sortAbc = sort abc

  if head sortAbc + (sortAbc !! 1) >= (sortAbc !! 2)
    then print (sortAbc !! 2)
    else putStrLn "-1"

