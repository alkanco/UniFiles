-- Funktionale Programmierung
-- Übungsblatt 9
-- Bearbeitet von William Djalal

-- 1. Aufgabe
(map f) xs = unfold p f' (+1) 0
    where
	    p x = x >= (length xs) -- p(x) ist wahr, wenn x größer, gleich der Länge der Liste ist
		f' x = f (xs !! x) -- f'(x) ist f von der x-sten Stelle der Liste xs

-- 3. Aufgabe
filter f [] = [] -- filter.1
filter f (x:xs)
  | f x =  x:filter f xs -- filter.2
  | otherwise = filter f xs -- filter.3

(++) [] ys = ys -- (++).1

reverse [] = [] -- reverse.1
reverse (x:xs) = reverse xs ++ [x] -- reverse.2
-- Induktionsvoraussetzung
filter p (xs ++ ys) == filter p xs ++ filter p ys
-- Induktionsanfang
xs = []
filter p ([] ++ ys) == filter p [] ++ filter p ys
					== [] ++ filter p ys -- filter.1
					== [] ++ filter p ([] ++ ys) -- (++).1
					 = filter p ([] ++ ys)
-- Induktionsbehauptung
xs = (x:xs)
filter p ((x:xs) ++ ys) = filter p (x:xs) ++ filter p ys
-- Induktionsschritt
filter p ((x:xs) ++ ys) == filter p (x:xs) ++ filter p ys
						== filter p (x:xs) ++ filter p [] ++ ys -- (++).1
						== filter p (x:xs) ++ ys -- filter.1
						 = filter p ((x:xs) ++ ys)
						
-- 4. Aufgabe
-- Induktionsvoraussetzung
foldl g z xs = foldr f z (reverse xs)
-- Induktionsanfang
xs = []
foldl g z [] == foldr f z (reverse [])
z			 == foldr f z (reverse []) -- foldl.1
			 == foldr f z [] -- reverse.1
			  = z -- foldr.1
-- Induktionsbehauptung
xs = (x:xs)
foldl g z (x:xs) = foldr f z (reverse (x:xs))
-- Induktionsschritt
foldl g z (x:xs) == foldr f z (reverse (x:xs))
				 == foldr f z (reverse xs ++ [x]) -- reverse.2
				 
-- 5. Aufgabe
h x (g y z) = g z (h x y) -- funk.1
-- Induktionsvoraussetzung
h x (foldl g y xs) = foldl g (h x y) xs
-- Induktionsanfang
xs = []
h x (foldl g y []) == foldl g (h x y) []
				    = h x (foldl g y []) -- funk.1
-- Induktionsbehauptung
xs = (x:xs)
h x (foldl g y (x:xs)) = foldl g (h x y) (x:xs)
-- Induktionsschritt
h x (foldl g y (x:xs)) == foldl g (h x y) (x:xs)
				        = h x (foldl g y (x:xs)) -- funk.1
-- 6. Aufgabe
takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile p [] = [] -- takeWhile.1
takeWhile p (x:xs) 
 | p x = x : takeWhile p xs -- takeWhile.2
 | otherwise = [] -- takeWhile.3

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile p [] = [] -- dropWhile.1
dropWhile p (x:xs) 
 | p x = dropWhile p xs -- dropWhile.2
 | otherwise = (x:xs) -- dropWhile.3

span :: (a -> Bool) -> [a] -> ([a], [a])
span p [] = ([], []) -- span.1
span p (x:xs) 
 | p x = (x:ys, zs) -- span.2
 | otherwise = ([], x:xs) -- span.3
   where (ys, zs) = span p xs 
 
-- Induktionsvoraussetzung
span p xs == (takeWhile p xs, dropWhile p xs)
-- Induktionsanfang
xs = []
span p [] == (takeWhile p [], dropWhile p [])
span p [] == ([],[]) -- takeWhile.1, dropWhile.1
([],[])    = ([],[]) -- span.1
-- Induktionsbehauptung
xs = (x:xs)
span p (x:xs) = (takeWhile p (x:xs), dropWhile p (x:xs))
-- Induktionsschritt
span p (x:xs) == (takeWhile p (x:xs), dropWhile p (x:xs))
span p (x:xs) == (x:takeWhile p xs, dropWhile p xs) -- takeWhile.2, dropWhile.2
span p (x:xs) == (x:takeWhile p xs, dropWhile p xs) -- span.2
...
span p (x:xs) == (x1:x2:..xn:takeWhile p xs, dropWhile p xs')
span p (x:xs) == (x1:x2:..xn:[], dropWhile p []) -- takeWhile.1, dropWhile.1
(x:ys, zs)    == (x1:x2:..xn:[], dropWhile p [])
...
(x1:x2:..xn:ys, zs) == (x1:x2:..xn:[], dropWhile p [])
(x1:x2:..xn:([],[]) == (x1:x2:..xn:[], dropWhile p []) -- span.1

-- 7. Aufgabe
map f [] = [] -- map.1
map f (x:xs) = (f x): map f xs -- map.2

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f Nil = Nil -- mapTree.1
mapTree f (Leaf x) = Leaf (f x) -- mapTree.2
mapTree f (Node x lt rt) = (Node (f x) (mapTree f lt) (mapTree f rt)) -- mapTree.3

tree2List :: Tree a -> [a]
tree2List Nil = [] -- tree2List.1
tree2List (Leaf x) = [x] -- tree2List.2
tree2List (Node x rt lt) = tree2List rt ++ [x] ++ tree2List lt -- tree2List.3
-- Induktionsvoraussetzung
map f (tree2List t) == tree2List (mapTree f t)
-- Induktionsanfang
t = Nil
map f (tree2List Nil) == tree2List (mapTree f Nil)
map f ([])			  == tree2List (mapTree f Nil) -- tree2List.1
[]					  == tree2List (mapTree f Nil) -- map.1
[]					  == tree2List (Nil)           -- mapTree.1
[]					   = []                        -- tree2List.1

t = Leaf a
map f (tree2List (Leaf a)) == tree2List (mapTree f (Leaf a))
map f ([a])                == tree2List (mapTree f (Leaf a)) -- tree2List.2
map f ([a])				   == tree2List (Leaf (f a)) -- mapTree.2
map f ([a])                == [f a] -- tree2List.2
(f a): map f []            == [f a] -- map.2
(f a): []				   == [f a] -- map.1
[f a]					    = [f a]
-- Induktionsschritt
t = (Node a lt rt)
map f (tree2List (Node a lt rt)) == tree2List (mapTree f (Node a lt rt))
map f (tree2List rt ++ [a] ++ tree2List lt) == tree2List (mapTree f (Node a lt rt)) -- tree2List.3
map f (tree2List rt ++ [a] ++ tree2List lt) == tree2List (Node (f a) (mapTree f lt) (mapTree f rt)) -- mapTree.3

