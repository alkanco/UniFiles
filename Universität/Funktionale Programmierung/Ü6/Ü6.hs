--Funktionale Programmierung 6. Übung

--1. Aufgabe
listOfLocalMaxs :: Ord a => [a] -> [a]
listOfLocalMaxs (x:y:z:xs) = if max then y:(listOfLocalMaxs (y:z:xs)) else listOfLocalMaxs (y:z:xs)
    where
        max = y > x && y > z
listOfLocalMaxs _ = []

--4. Aufgabe
data Weekday = Mo | Tu | We | Th | Fr | Sa | Su deriving Show
data Month = Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec deriving Eq

weekday :: Int -> Month -> Int -> Weekday
weekday t m y 
    | m `elem` [Jan,Mar,May,Jul,Sep,Nov] && t < 32 = num2weekday ((t + x + (31 * m0) `div` 12) `mod` 7)
    | m `elem` [Apr,Jun,Aug,Oct,Dec] && t < 31 = num2weekday ((t + x + (31 * m0) `div` 12) `mod` 7)
    | m == Feb && isLeapYear y && t < 30 = num2weekday ((t + x + (31 * m0) `div` 12) `mod` 7)
    | m == Feb && isLeapYear y == False && t < 29 = num2weekday ((t + x + (31 * m0) `div` 12) `mod` 7)
    | otherwise = error "Please enter a valid Date!"
    where
        y0 = y - (14 - month2Num m) `div` 12
        x = y0 + y0 `div` 4 - y0 `div` 100 + y0 `div` 400
        m0 = (month2Num m) + 12 * ((14 - (month2Num m)) `div` 12) - 2

isLeapYear :: Int -> Bool
isLeapYear x
    | x `mod` 400 == 0 = True
    | x `mod` 100 == 0 = False
    | otherwise = x `mod` 4 == 0

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



                
