--PE23
{-
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.


-}

--the code I write gets slower and slower the further after midnight it gets

import Data.List

--this is awfully slow
divisorSum :: Integer -> Integer
divisorSum n = sum $ takeWhile (< n) [x | x<- [1,2..n `div` 2], n `mod` x == 0]

--all numbers less than 28123 that can be written as the sum of abundant numbers
--nub is here to remove duplicates, but I feel certain there must be a cleaner way
abundant_Sums = nub [a+b | a<-abundant_Numbers, b<-[y | y<-abundant_Numbers, y>=a, y < (28123 - a)] ] where
  abundant_Numbers = [x | x <- [1,2..28123], x < divisorSum x ]

--take the sum of all numbers up to the known upper bound minus the sum of those that can be written as abundant numbers
non_Abundant_Sum = sum [1..28122] - (sum abundant_Sums) 

--in retrospect it would have been better to just iterate through the list of candidate numbers to find the ones that can't be written as a sum of two abundant numbers, which I think would actually be relatively quick
