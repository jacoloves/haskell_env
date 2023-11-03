main :: IO ()
main = do
    [a, b] <- map read . words <$> getLine

    if (a < b && a + 2 >= b) || (a > b && b + 3 >= a) then putStrLn "Yes"
    else  putStrLn "No"

