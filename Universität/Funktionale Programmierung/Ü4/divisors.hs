-- Aufgabe 1
-- a)
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0]
-- b)
trueDivisors :: [(Int,[Int])]
trueDivisors = [(x,init (divisors x)) | x <- [1..]]
-- c)
primes :: [Int]
primes = map fst (filter isPrime trueDivisors)
    where
        isPrime (_, teiler) = teiler == [1]
		
-- Aufgabe 2
{-
friends :: Int -> Int -> Bool
friends x y = -}

-- Aufgabe 3
weakGoldbachTriples :: Integer -> [(Integer,Integer,Integer)]
weakGoldbachTriples n = [(x,y,z) | x <- [take 1 [primzahlen 5]], y <- [take 1 [primzahlen 5]], z <- [take 1 [primzahlen 5]]]

primzahlen :: Integer -> [Integer]
primzahlen n = sieb [2..n]
 where
	sieb [] = []
	sieb (p:xs) = p: sieb [k | k<-xs, (mod k p)>0]
  
-- Aufgabe 6
--diffList :: [String] -> [String] -> [String]
--diffList [x] [y] = [z|
 