{-PE67. This is identical to my solution for PE18-}

--idea: build a new pyramid where each node contains the value of the maximal path to that node

import System.IO

type Row = [Integer]
type Pyramid = [Row]

{-this function takes row n-1 from the maxpath pyramid and row n from the costs pyramid and populates row n of the maxpath pyramid
note that for simplicity this actually expects the head of the previous maxpath row to be duplicated so for instance
3
7 4
should be entered as
3 3
7 4
-}
populateRow :: Row -> Row -> Row
populateRow [prevRow] [curRow]  = [prevRow + curRow]  --only one option in this case
--maximum value path is max of 2 entries on top of current point + value of current point
populateRow (pa : pt@(pb:_)) (ca : ct) = (max pa pb) + ca : populateRow pt ct 

maxPathConstructor :: Pyramid -> Pyramid
maxPathConstructor inputPyramid = maxPath
  where maxPath = (head inputPyramid) : zipWith (\prevRow@(h:_) curRow -> populateRow (h:prevRow) curRow)  maxPath (tail inputPyramid)

---------------------------------------------------------
-- logic to read in the input pyramid from a text file --
---------------------------------------------------------


integerize :: [String] -> [Integer]
integerize  = map (\x -> read x :: Integer)

main = do
  contents <- readFile "pe067_data.txt"
  let inputPyramid = map integerize (map words (lines contents))
  putStrLn (show . maximum . last $ maxPathConstructor inputPyramid)
