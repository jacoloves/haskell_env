import Control.Monad (replicateM)
import Data.List (sortBy)
main :: IO()
main = do
    n <- readLn
    s <- replicateM n getLine
    putStrLn . unwords . map show $ f s

f :: [String] -> [Int]
f = 
  map fst
    . sortBy (\ (_, a) (_, b) -> compare b a)
    . zip [1..]
    . map (length . filter (=='o'))
