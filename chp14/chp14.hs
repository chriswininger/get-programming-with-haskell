-- data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6
--
-- instance Show SixSidedDie where
--     show S1 = "one"
--     show S2 = "two"
--     show S3 = "three"
--     show S4 = "four"
--     show S5 = "five"
--     show S6 = "six"
--
-- instance Eq SixSidedDie where
--    (==) S6 S6 = True
--    (==) S5 S5 = True
--    (==) S4 S4 = True
--    (==) S3 S3 = True
--    (==) S2 S2 = True
--    (==) S1 S1 = True
--    (==) _ _ = False
--
-- instance Ord SixSidedDie where
--     compare S6 S6 = EQ
--     compare S6 _ = GT
--     compare _ S6 = LT
--     compare S5 S5 = EQ
--     compare S5 _ = GT
--     compare _ S5 = LT
--     compare S4 S4 = EQ
--     compare S4 _ = GT
--     compare _ S4 = LT
--     compare S3 S3 = EQ
--     compare S3 _ = GT
--     compare _ S3 = LT
--     compare S2 S2 = EQ
--     compare S2 _ = GT
--     compare _ S2 = LT
--     compare _ _ = EQ

data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6 deriving (Enum, Eq, Ord)
instance Show SixSidedDie where
    show S1 = "one"
    show S2 = "two"
    show S3 = "three"
    show S4 = "four"
    show S5 = "five"
    show S6 = "six"

data TwoSidedDie = One | Two

instance Show TwoSidedDie where
    show One = "I"
    show Two = "II"

-- ## This will fail when you try implement a custom order
-- type Name = (String,String)
-- names :: [Name]
-- names = [("Emil", "Cioran")
--         , ("Eugene", "Thacker")
--         , ("Friedrich", "Nietzsche")]
-- instance Ord Name where
--     compare (f1, l1) (f2, l2) = compare (l1, f1) (l2, f2)

-- ## Making it data will let us implement Ord
-- data Name = Name (String,String) deriving (Show, Eq)
-- names :: [Name]
-- instance Ord Name where
--     compare (Name (f1,l1)) (Name (f2,l2)) = compare (l1,f1) (l2,f2)
-- names = [Name ("Emil", "Cioran")
--         ,Name ("Eugene", "Thacker")
--         ,Name ("Friedrich", "Nietzsche")]

-- ## This works just like the above but is more efficient
newtype Name = Name (String,String) deriving (Show, Eq)
names :: [Name]
instance Ord Name where
    compare (Name (f1,l1)) (Name (f2,l2)) = compare (l1,f1) (l2,f2)
names = [Name ("Emil", "Cioran")
        ,Name ("Eugene", "Thacker")
        ,Name ("Friedrich", "Nietzsche")]
