-- original blog post: http://blog.redlinernotes.com/posts/Playing-with-Haskell.html

-- how to find words like "cosmicomics":
-- words which can be split into anagrams by the middle letter
-- PRESENTLY ASSUME THAT ALL WORDS ARE LOWERCASE! I should probably unit test or type for this.

import Data.List (sort)
import System.Environment (getArgs)

main = do
         [f] <- getArgs
         inFile <- readFile f
         let dict = filter (not . null) (lines inFile)
         printFunnies (filter notSameWord (findFunnies dict))

isAnagram :: String -> String -> Bool
isAnagram word1 word2 = sort word1 == sort word2

hasJoiner :: String -> String -> Bool
hasJoiner word1 word2 = last word1 == head word2

isFunnyWord :: String -> String -> Bool
isFunnyWord word1 word2
            | isAnagram word1 word2 && hasJoiner word1 word2 = True
            | otherwise                                      = False

notSameWord :: (String, String) -> Bool
notSameWord (word1, word2) = word1 /= word2

sameLength :: String -> [String] -> [String]
sameLength word xs = filter (\x -> length x == length word) xs

printFunnies :: [(String, String)] -> IO [()]
printFunnies xs = mapM (\(x,y) -> putStrLn (x ++ tail y)) xs

partialFind :: [String] -> String -> [(String, String)]
partialFind dict word = [(word,w) | w <- sameLength word dict, isFunnyWord word w]

findFunnies :: [String] -> [(String, String)]
findFunnies xs = concatMap (partialFind xs) xs
