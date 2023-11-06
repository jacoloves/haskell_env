main :: IO ()
main = do
    n <- readLn
    let ans = f n
    print ans

f :: Int -> Int
f n =
    go 1
    where
        go i
            | n == i ^ i = i
            | n < i ^ i = -1
            | otherwise = go (i+1)