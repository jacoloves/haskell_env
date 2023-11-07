import Control.Monad (replicateM)
import Data.List (nub, transpose)

main :: IO ()
main = do
  a <- replicateM 9 (fmap (map read . words) getLine)
  let ans = cS a
  putStrLn $ if ans then "Yes" else "No"

cS :: [[Int]] -> Bool
cS a =
  all cR a && all cC (transpose a) && all cB (gBG a)

cR :: [Int] -> Bool
cR row = length (nub row) == 9

cC :: [Int] -> Bool
cC col = length (nub col) == 9

cB :: [Int] -> Bool
cB block = length (nub block) == 9

gBG :: [[Int]] -> [[[Int]]]
gBG a =
  let rIB = sE 3 a
   in concatMap (transpose . map (sE 3)) rIB

sE :: Int -> [a] -> [[a]]
sE _ [] = []
sE n list = take n list : sE n (drop n list)