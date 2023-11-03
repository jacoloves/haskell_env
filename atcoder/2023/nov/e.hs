import Data.List
main :: IO ()
main = do
    n <- readLn
    s <- getLine
    let ans = f n s

    print ans

f :: Int -> String -> Int
f n s =
    let sList = s
    in case fIndex sList of
        Just idx -> idx + 1
        Nothing -> -1

fIndex :: String -> Maybe Int
fIndex s = go 0 s
    where
        go _ [] = Nothing
        go i (x:xs)
            | i + 2 < length s && x == 'A' && xs !! (i+1) == 'B' && xs !! (i+2) == 'C' = Just i
            | otherwise = go (i+1) xs
