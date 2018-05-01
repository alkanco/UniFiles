-- Aufgabe 1
-- a)
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0] --Alle Teiler von x werden ausgegeben, x wird immer um 1 erhöht bis n(Maximum)
-- b)
trueDivisors :: [(Int,[Int])]
trueDivisors = [(x,init (divisors x)) | x <- [1..]] --Es können unendlich Zahlen ausgegeben werden, desses Teiler in einer Liste dargestellt werden
-- c)
primes :: [Int]
primes = map fst (filter isPrime trueDivisors) --Es können unendlich Primzahlen ausgegeben werden
    where
        isPrime (_, teiler) = teiler == [1] --Vorheriger Wert wird gelöscht mit (_), um Speicher zu sparen
		
-- Aufgabe 2
friends :: Int -> Int -> Bool
friends x y = sum (init (divisors x)) == y && sum (init (divisors y)) == x --Es wird geprüft ob x und y "freunde" sind, "init" wird verwendet, da die Zahl nicht durch sich selbst geteilt werden soll

allFriendsSmaller :: Int -> [(Int,Int)]
allFriendsSmaller n = [(x,y)|x <- [1,2..n],y <- [1,2..x-1], x<n, y<n, friends x y] --Es werden alle befreundeten Zahlenpaare bis zum gegebenen Limit ausgegeben, Berechnung kann aber bei hohen Werten lange dauern

-- Aufgabe 3
-- a)
weakGoldbachTriples :: Int -> [(Int,Int,Int)]
weakGoldbachTriples n
    | even n = error "Please use an odd number!"
    | otherwise = [(x,y,z) | x <- takeWhile (<n) primes, y <- takeWhile (<n) primes, z <- takeWhile (<n) primes, x+y+z == n, z>= y, z>= x, x<=y] --Gerade Zahl gibt Fehler zurück, Ungerade Zahl wird in Goldbachsche Triples aufgeteilt
-- b)
wGTriplesUntil m = not $ any tripel [weakGoldbachTriples x | x <- [7,9..m]] --"null" prüft ob das Tripel leer ist
    where
	   tripel = null
	   
-- Aufgabe 4
isSorted f (x:y:xs) = f x y && isSorted f (y:xs) --Es wird geprüft ob das erste Element und das zweite Element die gegebene Funktion f erfüllen und ob das zweite und alle restlichen Elemente die Funktion erfüllen
isSorted _ _ = True 

-- Aufgabe 5
pythTriplesSmaller :: Int -> [(Int,Int,Int)]
pythTriplesSmaller n = [(a,b,c)|a <- [1,2..n], b <- [1,2..n], c <- [1,2..n], a^2+b^2==c^2, 0<a, a<=b, b<=c, c<=n] --Bedingung aus Aufgabenstellung kopiert, a,b und c werden immer größer
  
-- Aufgabe 6
{-
removeItem _[] = []
diffList :: String -> String -> String
diffList (x:xs) (y:ys) | y `elem` x = removeItem -} --Funktion funktioniert nicht, Idee mit (x:xs) und (y:ys) für beide Listen