main = do
    n <- readLn :: IO Int

    let res = n `div` 5
    let res2 = n `mod` 5

    print $ res + res2
