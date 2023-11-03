
main :: IO ()
main = do
    n <- readLn :: IO Int

    let ans = f n
    print ans

f :: Int -> Int
f n
    | ff n = n
    | otherwise = f (n+1)

ff :: Int -> Bool
ff n =
    let h = n `div` 100
        t = (n `div` 10) `mod` 10
        u = n `mod` 10
    in h * t == u
