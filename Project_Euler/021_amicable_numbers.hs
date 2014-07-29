--PE21
{-Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

-}

--this is at least a factor of 2 slower than it needs to be
divisorSum :: Integer -> Integer
divisorSum n = sum $ takeWhile (< n) [x | x<- [1,2..], n `mod` x == 0]

--this is really slow. Maybe I would have been better off with a fold?
amicable_Numbers_Sum = sum $ [x | x <- [1..10000], x /= divisorSum x,  divisorSum (divisorSum x) == x]

--a different way to do this would be to recursively populate a list of the divisorSums of the first 10000 numbers and then check for the appropriate equalities; this would be much faster since we could save computation with eg. divisorSum 2*n = 2 + divisorSum n  
