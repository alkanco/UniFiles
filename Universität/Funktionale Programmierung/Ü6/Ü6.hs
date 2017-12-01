import Data.List (nub)

--1. Aufgabe
listOfLocalMaxs xs = nub [x | a <- [0..length xs-1], let x = xs !! a, let y = xs !! a-1, let z = xs !! a+1, x>y]