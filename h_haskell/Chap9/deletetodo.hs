import Data.List (delete)
import System.IO (hClose, openTempFile, hPutStr)
import System.Directory (removeFile, renameFile)
import Control.Exception (bracketOnError)
main = do
    contents <- readFile "todo.txt"
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks

    putStrLn "These are your TO-DO items:"
    mapM_ putStrLn numberedTasks
    putStrLn "Which one do you want to delete?"
    numberString <- getLine
    let number = read numberString
        newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
    bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHadle) -> do
            hClose tempHadle
            removeFile tempName)

        (\(tempName, tempHadle) -> do
            hPutStr tempHadle newTodoItems
            hClose tempHadle
            removeFile "todo.txt")

