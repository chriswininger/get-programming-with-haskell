import System.Random

minDie :: Int
minDie = 1


maxDie :: Int
maxDie = 5

main :: IO ()
main = do
    dieRoll <- randomRIO (minDie,maxDie)
    putStrLn (show dieRoll)
