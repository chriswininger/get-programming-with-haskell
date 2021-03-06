firstName :: PatientName -> FirstName
firstName patientName = fst patientName

lastName :: PatientName -> LastName
lastName patientName = snd patientName

patientInfo :: PatientName -> Age -> Height -> String
patientInfo (fname, lname) age height = name ++ " " ++ ageHeight
    where name = lname ++ ", " ++ fname
          ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"

type PatientName = (String, String)
type FirstName = String
type LastName = String
type Age = Int
type Height = Int

data Sex = Male | Female

sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

data RhType = Pos | Neg

data ABOType = A | B | AB | O

data BloodType = BloodType ABOType RhType

patient1BT :: BloodType
patient1BT = BloodType A Pos

patient2BT :: BloodType
patient2BT = BloodType O Neg

patient3BT :: BloodType
patient3BT = BloodType AB Pos

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"
showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"
showBloodType :: BloodType -> String
showBloodType (BloodType abo rh) = showABO abo ++ showRh rh

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _ = True
canDonateTo _ (BloodType AB _) = True
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo _ _ = False --otherwise

type MiddleName = String
data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l

name1 = Name "Jerome" "Salinger"
name2 = NameWithMiddle "Jerome" "David" "Salinger"

-- data Patient = Patient Name Sex Int Int Int BloodType
-- johnDoe :: Patient
-- johnDoe = Patient (Name "John" "Doe") Male 30 74 200 (BloodType AB Pos)

-- automatically creates getters, height jackSmith
-- showBloodType jackSmith
data Patient = Patient { name :: Name
                       , sex :: Sex
                       , age :: Int
                       , height :: Int
                       , weight :: Int
                       , bloodType :: BloodType }

jackSmith :: Patient
jackSmith = Patient {name= Name "Jack" "Smith"
                    , age = 43
                    , sex = Female
                    , height = 62
                    , weight = 115
                    , bloodType = BloodType O Neg }



