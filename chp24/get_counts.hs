import System.IO
import System.Environment
import Control.Monad
import Data.Semigroup

getCounts :: String -> (Int,Int,Int)
getCounts input = (charCount, wordCount, lineCount)
    where charCount = length input
          wordCount = (length . words) input
          lineCount = (length. lines) input

countsText :: (Int,Int,Int) -> String
countsText (cc,wc,lc) = unwords ["chars: "
                                  , show cc
                                  , " words: "
                                  , show wc
                                  , " lines: "
                                  , show lc]

main :: IO ()
main = do
    args <- getArgs
    let fileName = head args

    file <- openFile fileName ReadMode
    input <- hGetContents file

    let summary = (countsText .getCounts) input

    -- without this putStrLn here summary would not be evaluated and the file would not be read until after we close the file
    putStrLn summary

    hClose file

    appendFile "stats.dat" (mconcat [fileName, " ", summary, "\n"])

