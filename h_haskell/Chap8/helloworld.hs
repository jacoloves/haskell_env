main = do
    putStrLn "Hello, whts's yout name?"
    name <- getLine
    putStrLn ("Hey " ++ name ++ ", you rock!")
