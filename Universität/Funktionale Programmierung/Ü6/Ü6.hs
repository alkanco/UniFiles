--1. Aufgabe
listOfLocalMaxs xs = [y | x <- [1..length xs-2], let y = xs !! x, let v = xs !! x-1, let z = xs !! x+1, y > v && y > z]