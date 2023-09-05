module Main where
import Control.Monad (replicateM)

main::IO()
main = do
    n <- getLine
    s <- replicateM (read n) getLine

    let strHeadList = [head str | str <- s]
    putStrLn strHeadList
