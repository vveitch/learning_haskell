--PE22
{-Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

-}

--this problem isn't interesting enough to do
--but notice that a lookup table for letter values could be created very easily by zip (take 26 ['a','b'..]) [1,2..]
--and similarly could do the mult part of computation with zipwith (\name val = (wordscore name) * val) nameList [1,2..]
