applyMade :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMade Nothing f = Nothing
applyMade (Just x) f = f x

type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Pole
landLeft n (left, right) = (left + n, right)

landRight :: Birds -> Pole -> Pole
landRight n (left, right) = (left, right + n)

--x -: f = f x

landLeft' :: Birds -> Pole -> Maybe Pole
landLeft' n (left, right)
  | abs ((left + n) - right) < 4 = Just (left + n, right)
  | otherwise                    = Nothing

landRight' :: Birds -> Pole -> Maybe Pole
landRight' n (left, right)
  | abs (left - (right + n)) < 4 = Just (left, right + n)
  | otherwise                    = Nothing

x -: f = f x

banana :: Pole -> Maybe Pole
banana _ = Nothing

{-
routine :: Maybe Pole
routine = case landLeft' 1 (0, 0) of
            Nothing -> Nothing
            Just pole1 -> case landRight' 4 pole1 of
              Nothing -> Nothing
              Just pole2 -> case landLeft' 2 pole2 of
                Nothing -> Nothing
                Just pole3 -> landLeft' 1 pole3
-}
foo :: Maybe String
foo = do
  x <- Just 3
  y <- Just "!"
  Just (show x ++ y)

marySue :: Maybe Bool
marySue = do
  x <- Just 9
  Just (x > 8)

routine :: Maybe Pole
routine = do
  start <- return (0, 0)
  first <- landLeft' 2 start
  Nothing
  second <- landRight' 2 first
  landLeft' 1 second


jstuH :: Maybe Char
jstuH = do
  (x:xs) <- Just "hello"
  return x

wopwop :: Maybe Char
wopwop = do
  (x:xs) <- Just ""
  return x

listOfTuples :: [(Int, Char)]
listOfTuples = do
  n <- [1, 2]
  ch <- ['a', 'b']
  return (n, ch)

class Monad m => MonadPlus m where
  mzero :: m a
  mplus :: m a -> m a -> m a

instance MonadPlus [] where
    mzero = []
    mplus = (++)

guard :: (MonadPlus m) => Bool -> m ()
guard True = return ()
guard False = mzero

sevensOnly :: [Int]
sevensOnly = do
  x <- [1..50]
  guard ('7' `elem` show x)
  return x

type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c, r) = do
  (c', r') <- [(c+2, r-1), (c+2, r+1), (c-2, r-1), (c-2, r+1)
              , (c+1, r-2), (c+1, r+2), (c-1, r-2), (c-1, r+2)
              ]
  guard (c' `elem` [1..8] && r' `elem` [1..8])
  return (c', r')

in3 :: KnightPos -> [KnightPos]
in3 start = do
  first <- moveKnight start
  second <- moveKnight first
  moveKnight second

canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` in3 start

(<=<) :: (Monad m) => (b -> m c) -> (a -> m b) -> (a -> m c)
f <=< g = (\x -> g x >>= f)
