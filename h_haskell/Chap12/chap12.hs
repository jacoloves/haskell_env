import Data.Monoid

-- CharList
newtype CharList = CharList { getCharList :: [Char] } deriving (Eq, Show)

-- Pair
newtype Pair b a = Pair { getPair :: (a, b) }

-- fmap
instance Functor (Pair c) where
  fmap f (Pair (x, y)) = Pair (f x, y)

-- CoolBool
-- data CoolBool = CoolBool { getCoolBool :: Bool }
newtype CoolBool = CoolBool { getCoolBool :: Bool }

helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello"

-- IntList
type IntList = [Int]

-- Product
newtype Product a = Product { getProduct :: a }
    deriving (Eq, Ord, Read, Show, Bounded)

-- any
newtype Any = Any { getAny :: Bool }
    deriving (Eq, Ord, Read, Show, Bounded)

-- all
newtype All = All { getAll :: Bool }
    deriving (Eq, Ord, Read, Show, Bounded)

-- lengthCompare
{-
lentgthCompare :: String -> String -> Ordering
lentgthCompare x y = let a = length x `compare` length y
                         b = x `compare` y
                     in if a == EQ then b else a
-}

lentgthCompare :: String -> String -> Ordering
lentgthCompare x y = (length x `compare` length y) `mappend`
                     (vowels x `compare` vowels y) `mappend`
                     (x `compare` y)
                     where vowels = length . filter (`elem` "aeiou")

