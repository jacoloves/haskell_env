import Control.Monad (when)
main = do
    input <- getLine
    when(input == "SWORDFISH") $ do
        putStrLn input
