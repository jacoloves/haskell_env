module Main (main) where

import Lib

main :: IO ()
main = do
    putStrLn "Please, input subject:"
    subject <- getLine
    print $ "Hello, " ++ subject ++ "!"
