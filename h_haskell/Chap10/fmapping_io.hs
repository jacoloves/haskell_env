import Data.List (intersperse)
import Data.Char (toUpper)

main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
          putStrLn line
