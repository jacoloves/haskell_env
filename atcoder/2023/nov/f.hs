main :: IO ()
main = do
    n <- readLn
    s <- getLine
    let ans = f n s

    putStrLn ans

f :: Int -> String -> String
f n s 
    | n >= 2 && fCheck s = "Yes"
    | otherwise = "No"

fCheck :: String -> Bool
fCheck ('a' : 'b' : rest) = True
fCheck ('b' : 'a' : rest) = True
fCheck (_ : rest) = fCheck rest
fCheck [] = False