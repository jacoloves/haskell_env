main :: IO ()
main = do
    [a, b] <- map read . words <$> getLine

    let ans = f a b

    print ans


f :: Int -> Int -> String
f a b
    | if a == b then No
      else if a > b && b + 3 >= a then Yes
      else if a < b && a + 2 >= b then Yes
      otherwise  No

