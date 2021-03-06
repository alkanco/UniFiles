--Funktionale Programmierung 6. Übung
--William Djalal, Nils Kerk

--1. Aufgabe
listOfLocalMaxs :: Ord a => [a] -> [a]
listOfLocalMaxs (x:y:z:xs) = if max then y:(listOfLocalMaxs (y:z:xs)) else listOfLocalMaxs (y:z:xs)
    where
        max = y > x && y > z
listOfLocalMaxs _ = [] --Falls weniger als 3 Parameter gegeben sind -> Leere Liste

--2. Aufgabe
--Nicht funktionsfähig!
suffixes [] = []
suffixes xs = quicksort (xs:suffixes (tail xs))

{-
qSort [] = []
qSort (x:xs) = qSort small ++ mid ++ qSort large
    where
	    small = [y | y <- xs, y < x]
		mid = [y | y <- xs, y == x] ++ [x]
		large [y | y <- xs, y > y]
	
cmpLists (x:xs) (y:ys)
    | x == y = cmpLists xs
    | otherwise = max x y
-}

--3. Aufgabe
--a)
data Root3Num = Root3Num Int Int deriving Show

addOperator :: Root3Num -> Root3Num -> Root3Num
addOperator (Root3Num a b) (Root3Num c d) = Root3Num (a+c) (b+d)

subOperator :: Root3Num -> Root3Num -> Root3Num
subOperator (Root3Num a b) (Root3Num c d) = Root3Num (a-c) (b-d)

mulOperator :: Root3Num -> Root3Num -> Root3Num
mulOperator (Root3Num a b) (Root3Num c d) = Root3Num (a*(c+d)) (b*(c+d))

--b)
--getValue :: Root3Num -> Double
--getValue (Root3Num a b) = (addOperator (Root3Num a b))  * sqrt 3

--4. Aufgabe
data Weekday = Mo | Tu | We | Th | Fr | Sa | Su deriving Show
data Month = Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec deriving Eq

weekday :: Int -> Month -> Int -> Weekday
weekday t m y 
    | m `elem` [Jan,Mar,May,Jul,Sep,Nov] && t < 32 = num2weekday ((t + x + (31 * m0) `div` 12) `mod` 7)
    | m `elem` [Apr,Jun,Aug,Oct,Dec] && t < 31 = num2weekday ((t + x + (31 * m0) `div` 12) `mod` 7)
    | m == Feb && isLeapYear y && t < 30 = num2weekday ((t + x + (31 * m0) `div` 12) `mod` 7)
    | m == Feb && isLeapYear y == False && t < 29 = num2weekday ((t + x + (31 * m0) `div` 12) `mod` 7)
    | otherwise = error "Please enter a valid Date!" --Falls Tageseingabe nicht passend mit Monat oder Schaltjahr und Tageseingabe nicht passend
    where
        y0 = y - (14 - month2Num m) `div` 12
        x = y0 + y0 `div` 4 - y0 `div` 100 + y0 `div` 400
        m0 = (month2Num m) + 12 * ((14 - (month2Num m)) `div` 12) - 2

isLeapYear :: Int -> Bool
isLeapYear x
    | x `mod` 400 == 0 = True
    | x `mod` 100 == 0 = False
    | otherwise = x `mod` 4 == 0 --Alle 4Jahre ist ein Schaltjahr, alle 100Jahre ist keins, alle 400Jahre ist wieder eins

month2Num :: Month -> Int
month2Num Jan = 1
month2Num Feb = 2
month2Num Mar = 3
month2Num Apr = 4
month2Num May = 5
month2Num Jun = 6
month2Num Jul = 7
month2Num Aug = 8
month2Num Sep = 9
month2Num Oct = 10
month2Num Nov = 11
month2Num Dec = 12

num2weekday :: Int -> Weekday
num2weekday 0 = Su
num2weekday 1 = Mo
num2weekday 2 = Tu
num2weekday 3 = We
num2weekday 4 = Th
num2weekday 5 = Fr
num2weekday 6 = Sa

--5. Aufgabe
data B = T | F deriving Show
data Nat = Zero | S Nat deriving Show

eqB :: B -> B -> B
eqB T T = T
eqB T F = F
eqB F T = F
eqB F F = T

xorB :: B -> B -> B
xorB T T = F 
xorB T F = T 
xorB F T = T 
xorB F F = F

addN :: Nat -> Nat -> Nat
addN Zero a = a
addN a Zero = a 
addN a (S b) = addN (S a) b

--Aus der Vorlesung übernommen!
subN :: Nat -> Nat -> Nat
subN a Zero = a
subN (S a) (S b) = subN a b
subN Zero _ = Zero
--

minN :: Nat -> Nat -> Nat
minN a b = subN (addN y x) y

isTeiler :: Nat -> Nat -> B
isTeiler Zero b = F
isTeiler a Zero = T
isTeiler a b = subN b S(Zero)

ggtN :: Nat -> Nat -> Nat

