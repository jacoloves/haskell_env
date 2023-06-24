-- data Person = Person String String Int Float String String
--     deriving (Show)

-- data Person = Person { firstName:: String
--                         , lastName :: String
--                         , age :: Int
--                         , height :: Float
--                         , phoneNumber :: String
                        -- , flavor :: String } deriving (Show)

-- firstName :: Person -> String
-- firstName (Person firstName _ _ _ _ _) = firstName

-- lastName :: Person -> String
-- lastName (Person _ lastName _ _ _ _) = lastName

-- age :: Person -> Int
-- age (Person _ _ age _ _ _) = age

-- height :: Person -> Float
-- height (Person _ _ _ height _ _ ) = height

-- phoneNumber :: Person -> String
-- phoneNumber (Person _ _ _ _ number _) = number

-- flavor :: Person -> String
-- flavor (Person _ _ _ _ _ flavor) = flavor

data Person = Person { firstName :: String
                        , lastName :: String
                        , age :: Int
                        } deriving (Eq, Show, Read)

mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}
adRock = Person {firstName = "Adam", lastName = "Forovitz", age = 41}

mysteryDude = "Person { firstName = \"Michael\"" ++
                    ", lastName =\"Diamond\"" ++
                    ", age = 43}"

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
            deriving (Eq, Ord, Show, Read, Bounded, Enum)

phoneBook :: [(String, String)]
phoneBook =
    [("betty", "555-2938")
    ,("bonnie", "452-2928")
    ,("pasty", "493-2928")
    ,("lucille", "205-2928")
    ,("wendy", "939-8282")
    ,("penny", "853-2492")
    ]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook