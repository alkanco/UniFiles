--Funktionale Programmierung-Übung5
import Data.List (sort,nub)

--1. Aufgabe
toDecFrom :: Int -> [Int] -> Int
toDecFrom b xs = foldl multBase 0 xs
  where
    multBase x y = (x*b)+ y
--Eingabewert: n = Länge der Liste xs
--"multBase" ist konstant, kann daher als solche behandelt werden.
--foldl ist von der Komplexität her linear.
--Es gilt: O(n)

--2. Aufgabe
--flatten_r im Gegensatz zu flatten_l ist viel komplizierter, da von rechts nach links
--gerechnet wird und dabei alle Listen neu konstruiert werden müssen.
flatten :: [[a]] -> [a]
flatten xss = [y | ys <- xss, y <- ys] --Löse Liste nach einander auf

--3. Aufgabe
potenzSeq :: Int -> Int -> [Int]
potenzSeq n m = sort (nub [b^e | b <- [2,3..n], e <- [2,3..m]]) --"sort" sortiert die Liste, "nub" entfernt doppelte Zahlen in der Liste
--potenzSeq ist eine lineare Funktion
--Es gilt: O(n*m)

--4. Aufgabe
minNatNotIn :: [Int] -> Int
minNatNotIn xs = minimum [y | z <- [last xs], y <- [0..z], notElem y xs]
--Eingabewert: n = Länge der Liste xs
--Es gilt: O(n)

--5. Aufgabe
--Eingabewert: n = Länge der Liste xs
--Es gilt: O(log(n))
