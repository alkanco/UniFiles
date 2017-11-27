import Data.List (sort,nub)
--1. Aufgabe
toDecFrom :: Int -> [Int] -> Int
toDecFrom b xs = foldl multBase 0 xs
	where
		multBase x y = (x*b)+y
--Eingabewert: n=Länge der Liste xs
--multBase ist konstant, kann daher als solche behandelt werden.
--foldl ist von der Komplexität her linear.
--O(n)

--2. Aufgabe
--flatten_r im Gegensatz zu flatten_l ist viel komplizierter, da von rechts nach links
--gerechnet wird und dabei alle Listen neu konstruiert werden müssen.
flatten :: [[a]] -> [a]
flatten xss = [y | ys <- xss, y <- ys]

--3. Aufgabe
potenzSeq :: Int -> Int -> [Int]
potenzSeq n m = sort nub [b^e|b<-[2,3..n],e<-[2,3..m]]
--potenzSeq ist eine lineare Funktion
--O(n*m)

--4. Aufgabe
{-
minNatNotIn :: [Int] -> Int
minNatNotIn xs = [y|y<-[0..5],y/=xs] -}

--5. Aufgabe
--Eingabewert: n=Länge der Liste xs
--O
