module Main where
import Control.Monad (replicateM, liftM)

main :: IO ()
main = do
  n <- readLn :: IO Int
  a <- replicateM n $ do
    [a_i, b_i] <- liftM (map read . words) getLine :: IO [Int]
    return (a_i, b_i)

  let ans = sum [a_i * b_i | (a_i, b_i) <- a]
  print (truncate (fromIntegral ans * 1.05) :: Int)

