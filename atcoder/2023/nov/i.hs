main :: IO ()
main = do
  n <- readLn
  s <- getLine
  let ans = f n s

  print ans

f :: Int -> String -> Int
f n s =
  go 0
  where
    go i
      | i >= n - 2 = -1
      | [s !! i, s !! (i + 1), s !! (i + 2)] == "ABC" = i + 1
      | otherwise = go (i + 1)