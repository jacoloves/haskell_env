module Main where

main :: IO ()
main = do
  [a, b] <- fmap (map read . words) getLine :: IO [Int]
  let a' = b 
  let b' = a

  putStrLn $ show a' ++ " " ++ show b'
