--Funktionale Programmierung
--Übung 8
--Bearbeitet von: Nils Kerk, William Djalal

--1. Aufgabe
--Behauptung:
map f xs ++ map f ys = map f (xs ++ ys)

--Induktionsanfang
xs = []
map f [] ++ map f ys = map f([] ++ ys) --map f [] = [], (++) [] ys = ys
[] ++ map f ys       = map f ys --(++) [] ys = ys
map f ys             = map f ys

--Induktionsvorraussetzung
xs = xs'
map f xs' ++ map f ys = map f (xs' ++ ys)

--Induktionsschritt
xs = (x:xs')
map f (x:xs') ++ map f ys           == map f ((x:xs') ++ ys) --map f (x:xs) = (f x): map f xs, (++) (x:xs) ys = x:(xs ++ ys)
(f x): map f xs ++ map f ys         == map f (x:(xs ++ ys)) --ys = (++) [] ys
(f x): map f xs ++ map f (++) [] ys == (f x): map f (xs ++ ys) --map f [] = []
(f x): map f xs ++ (++) [] ys       == (f x): map f (xs ++ ys) --(++) [] ys = ys
(f x): map f (xs ++ ys)              = (f x): map f (xs ++ ys)
----------------------------------------------------------------------------------------------------------------------------
--2. Aufgabe
--a)
--Behauptung:
(takeWhile p xs)++(dropWhile p xs) == xs

--Induktionsanfang
xs = []
(takeWhile p [])++(dropWhile p []) == [] --dropWhile p [] = [], takeWhile p [] = [] 
[] ++ []                           == []
[]                                  = []

--Induktionsvorraussetzung
xs = xs'
(takeWhile p xs')++(dropWhile p xs') = xs'

--Induktionsschritt
xs = (x:xs')
(takeWhile p (x:xs'))++(dropWhile p (x:xs')) == (x:xs')
if p x then x:(takeWhile p xs) else [] if p x then dropWhile p xs else (x:xs) = (x:xs')

--b)
--Behauptung:
reverse (xs ++ ys) == reverse ys ++ reverse xs

--Induktionsanfang
xs = []
reverse ([] ++ ys) == reverse ys ++ reverse [] --reverse [] = []
reverse ([] ++ ys)  = reverse ([] ++ ys)

--Induktionsvorraussetzung
xs = xs'
reverse (xs' ++ ys) = reverse ys ++ reverse xs'

--Induktionsschritt
xs = (x:xs')
reverse ((x:xs') ++ ys) == reverse ys ++ reverse (x:xs') --ys = (++) [] ys
reverse ((x:xs') ++ ys) == reverse [] ++ ys ++ reverse (x:xs') --reverse [] = [], (++) [] ys = ys
reverse ((x:xs') ++ ys) == ys ++ reverse (x:xs')
reverse ((x:xs') ++ ys)  = reverse ((x:xs') ++ ys)

--c)
--Behauptung:
elem a (xs ++ ys) == elem a xs || elem a ys

--Induktionsanfang
xs = []
elem a ([] ++ ys) == elem a [] || elem a ys --(++) [] ys = ys, ekem x [] = False
elem a ys          = False || elem a ys

--Induktionsvorraussetzung
xs = xs'
elem a (xs' ++ ys) = elem a xs' || elem a ys

--Induktionsschritt
xs = (x:xs')
elem a ((x:xs') ++ ys) == elem a (x:xs') || elem a ys --ys = (++) [] ys, elem x [] = False
elem a ((x:xs') ++ ys) == elem a (x:xs') || False ++ ys
----------------------------------------------------------------------------------------------------------------------------
--Aufgabe 3
--Behauptung:
maxPieces == maxPieces'

--Induktionsanfang
maxPieces 0 = 1 --maxPieces 0 = 1
maxPieces' 0 = 1 --maxPieces' 0 = aux 0 0

maxPieces 1 = 2 --maxPieces 1 = maxPieces (n-1) + n
maxPieces' 1 = 2 --maxPieces' 1 = aux 0 1

--Induktionsvorraussetzung
n = k
maxPieces k = maxPieces' k

--Induktionsschritt
maxPieces (k+1) = maxPieces' (k+1)
maxPieces ((k+1)-1) + (k+1) = aux 0 (k+1)

--Behauptung:
maxPieces n + (k+1) == aux (k+1) n

--Induktionsanfang
maxPieces 0 + (k+1) = aux (k+1) 0 --maxPieces 0 = 1
(k+1) + 1 = (k+1) + 1

--Induktionsvorraussetzung
n = k
maxPieces k + (k+1) = aux (k+1) k

--Induktionsschritt
k = k + 1
maxPieces (k+1) + k+1 == aux k+1 (k+1) --I.V.
aux k+1 (k+1)          = aux k+1 (k+1)

--Induktionsschritt
maxPieces (k+1)    == maxPieces' (k+1)
maxPieces (k+1)     = aux (k+1) k
maxPieces k + (k+1) = aux (k+1) k
----------------------------------------------------------------------------------------------------------------------------
--Aufgabe 4
--Behauptung:
length (powerset xs) = 2^(length xs)

--Induktionsanfang
xs = []
length (powerset []) = 2^(length []) --powerset [] = [[]], length xs = length [z|x<-xs]
length ([[]])      = 2^0 --length xs = length [z|x<-xs]
1                  = 1

--Induktionsvorraussetzung
xs = xs'
length (powerset xs') = 2^(length xs')

--Induktionsschritt
xs = (x:xs')
length (powerset (x:xs')) == 2^(length (x:xs'))
length (powerset' ++ [x:ys | ys <- powerset'])  = 2^(length (x:xs'))