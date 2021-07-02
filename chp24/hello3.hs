import System.IO
import System.Environment
import Control.Monad
import Data.Semigroup

main :: IO ()
main = do
    args <- getArgs
    let fileName = head args

    print ("Reading: " <> fileName)
    helloFile <- openFile fileName ReadMode
    hasLine <- hIsEOF helloFile
    firstLine <- if not hasLine
                 then hGetLine helloFile
                 else return "empty"
    putStrLn "done!"
