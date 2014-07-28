--PE15
--Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner. How many such routes are there through a 20×20 grid?

--we will populate each point of the grid with the total number of paths to that point
--this is the sum of the number to the left and to the right

--the most obvious way of doing (point by point from the end) would give a massively redundant recursion. Instead we recurse on the columns

populateColumn :: [Int] -> Int -> [Int]
--populates the number of paths to each grid point in the column it populates 
--takes the (remainder of) previous column and the value of the grid point above the one being calculated as input
populateColumn [] _ = []
populateColumn (prevHead:prevTail) n = numPaths : populateColumn prevTail numPaths
  where numPaths = prevHead + n


--populates an infinite list of columns for a grid with 20 rows.
--I'm not sure how to get rid of the hardcoded 21 (20 edges, 21 points)
gridColumns :: [[Int]]
gridColumns = (take 21 $ repeat 1) : next gridColumns
  where
    next (a:b) = (populateColumn a 0) : next b

--total number of paths to 20th entry of 20th column
numPaths = gridColumns !! 20 !! 20
