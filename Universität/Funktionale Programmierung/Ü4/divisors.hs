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
friends :: Int -> Int -> Bool
friends x y = sum (init (divisors x)) == y && sum (init (divisors y)) == x

allFriendsSmaller :: Int -> [(Int,Int)]
allFriendsSmaller n = [(x,y)|x <- [1,2..n],y <- [1,2..x-1], x<n, y<n, friends x y]

-- Aufgabe 3
-- a)
weakGoldbachTriples :: Int -> [(Int,Int,Int)]
weakGoldbachTriples n
    | even n = error "Please use an odd number!"
    | otherwise = [(x,y,z) | x <- takeWhile (<n) primes, y <- takeWhile (<n) primes, z <- takeWhile (<n) primes, x+y+z == n, z>= y, z>= x, x<=y]
-- b)
wGTriplesUntil m = not $ any tripel [weakGoldbachTriples x | x <- [7,9..m]]
    where
	   tripel = null
  
-- Aufgabe 6
--diffList :: [String] -> [String] -> [String]
diffList [] [] = []
diffList x y | (x) == (x) =