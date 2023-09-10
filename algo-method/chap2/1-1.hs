main = do
    putStr "Enter a number: "
    n <- readLn :: IO Int
    print n
    let result = countSteps n 0
    print result

countSteps :: Int -> Int -> Int
counteSteps 0 cnt = cnt
countSteps n cnt
    | even n = countSteps (n `div` 2) (cnt + 1)
    | otherwise = countSteps (n - 1) (cnt + 1)
