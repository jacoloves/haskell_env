module Main where
import qualified Data.List as List

main = do 
    [n,m] <- map read . words <$> getLine :: IO [Int]
    xs <- map read . words <$> getLine :: IO [Int]
    ys <- map read . words <$> getLine :: IO [Int]

    let xs' = reverse $ List.sort xs
    let ys' = reverse $ List.sort ys

    print $ foldl (\cnt a -> 
        if length ys' <= cnt then cnt
        else if a <= ys' !! cnt then cnt + 1
        else cnt) 0 xs'

