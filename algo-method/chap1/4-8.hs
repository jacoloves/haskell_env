module Main where
import Control.Monad (replicateM)

main::IO()
main = do
    n <- getLine
    s <- replicateM (read n) getLine

    print $ length $ concat s

    
