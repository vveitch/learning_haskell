--PE 17
{-If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

-}

{-basic algorithm:
number of times word "n" is used (eg. the number of times the string "two" shows up) is:
--total number of characters is: (number of characters from 1-9)*100 + "hundred"*900 + "and"*(900-9) + (# characters from 0-99) * 10
--number of characters from 0-99 is 9*(numbers of chacters from 1-9) + (number of chacters from 10-20)
--this problem is now too boring to bother coding 
-}
