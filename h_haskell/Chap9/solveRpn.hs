solveRPN :: String -> Double
solveRPN = head . foldl foldfingFunction [] . words
    where foldfingFunction (x:y:ys) "*" = (y * x):ys
          foldfingFunction (x:y:ys) "+" = (y + x):ys
          foldfingFunction (x:y:ys) "-" = (y - x):ys
          foldfingFunction xs numberString = read numberString:xs
