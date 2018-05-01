--Funktionale Programmierung Übung 7
--Bearbeitet von Nils Kerk, William Djalal

--Aufgabe 1
--a)

data ZInt = Z Nat Nat
data B = T | F deriving Show
data Nat = Zero | S Nat

predN :: Nat -> Nat
predN Zero = Zero
predN (S n) = n

subN :: Nat -> Nat -> Nat
subN m Zero = m
subN m (S n) = predN (subN m n)

ltN :: Nat -> Nat -> B
ltN Zero (S _) = T
ltN (S a) (S b) = ltN a b
ltN _ _ = F

simplifyZ :: ZInt -> ZInt
simplifyZ (Z a b) = iff (ltN a b) (Z Zero (subN b a)) (Z (subN a b) Zero)

iff :: B -> a -> a -> a
iff T a _ = a
iff F _ b = b

--Funktion absZ
absZ :: ZInt -> ZInt
absZ (Z a b) = iff (ltN a b) (simplifyZ (Z a b)) (simplifyZ (Z b a))

--Funktion maxZ
maxZ :: ZInt -> ZInt -> ZInt
maxZ (Z a b) (Z c d) = iff (ltN (Z a b)(Z c d)) (Z b a)

--Aufgabe 2

data SimpleBT = L | N SimpleBT SimpleBT deriving Show

insertLeafs :: Integer -> SimpleBT -> SimpleBT
insertLeafs 0 rump = rump
insertLeafs n rump = insertLeafs (n-1) (helper_leaf rump)

helper_leaf :: SimpleBT -> SimpleBT
helper_leaf L = (N L L)
helper_leaf (N a b) | (size a) <= (size b) = N (helper_leaf a) b
                    | otherwise = N a (helper_leaf b)

size :: SimpleBT -> Int
size L = 0
size (N a b) = (max (size a) (size b)) + 1

deleteLeafs :: Integer -> SimpleBT -> SimpleBT
deleteLeafs 0 rump = rump
deleteLeafs n rump =deleteLeafs (n-1) (delete_helper rump)

delete_helper :: SimpleBT -> SimpleBT
delete_helper L = error "Nothing there to delete!"
delete_helper(N L L) = L
delete_helper(N a b) | (size b) >= (size a) = N a (delete_helper b)
                     | otherwise = N (delete_helper a) b


--Aufgabe 3
data BSearchTree a = Nil | Node a (BSearchTree a) (BSearchTree a) deriving (Show, Eq)
 
foldTree x f Nil = x
foldTree x f (Node a ltree rtree) = f a (foldTree x f ltree) (foldTree x f rtree)

--Aufgabe 4
--a)

data Queue a = Queque [a] [a]
