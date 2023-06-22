import Data.List
import Data.Char
import Control.Monad.Trans.Cont (shift)
import Data.Void (vacuous)
import qualified Data.Map as Map


numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key xs = foldr (\(k, v) acc -> if key == k then Just v else acc) Nothing xs
{-- findKey key [] = Nothing
findKey key ((k,v):xs)
    | key == k = Just v
    | otherwise = findKey key xs --}

{--
phoneBook :: Map.Map String String
phoneBook = Map.fromList $ [("betty", "555-2938"),("bonnie", "452-2928"),("pasty", "493-2928"),("lucille", "205-2938"),("wendy", "5939-8282"),("penny", "853-2492")]
--}

string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit

phoneBook = 
    [
        ("bety", "550-2938")
        ,("bety", "342-2492")
        ,("bonnie", "444-3456")
        ,("pasty", "345-1234")
        ,("pasty", "987-1234")
        ,("pasty", "345-1254")
        ,("lucille", "464-1367")
        ,("wendy", "342-7654")
        ,("penny", "345-1234")
        ,("penny", "345-4567")
    ]

phoneBookToMap :: (Ord k) => [(k, a)] -> Map.Map k [a]
phoneBookToMap xs = Map.fromListWith (++) $ map (\ (k,v) -> (k,[v])) xs
-- phoneBookToMap xs = Map.fromListWith add xs
--     where add number1 number2 = number1 ++ ", " ++ number2