{-# LANGUAGE NPlusKPatterns #-}
{-- Vorlesungsbeispiel. Algebraische Datentypen --}
{-- Author: M. Esponda --}

module ANums where

data B = T | F deriving Show

orB :: B -> B -> B 
orB F F = F
orB _ _ = T

andB :: B -> B -> B 
andB T T = T  
andB _ _ = F 

notB :: B -> B 
notB T = F
notB F = T

data Nat = Zero | S Nat

instance Show Nat where
   show = showNats

showNats = show.nat2Int

{--  in/out functions for testing. 
     Only hier is allowed to use predefined types and functions 
     from the Prelude Modul
--}

nat2Int :: Nat -> Int
nat2Int  Zero = 0
nat2Int (S a) =  1 + (nat2Int a)

int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat (n+1) = (S (int2Nat n))

-------------------------------------------

succN :: Nat -> Nat
succN n = S n

predN :: Nat -> Nat
predN Zero = Zero
predN (S n) = n

eqN :: Nat -> Nat -> B
eqN Zero  Zero  = T
eqN (S a) (S b) = eqN a b
eqN  _     _    = F

add ::  Nat -> Nat -> Nat
add a Zero  = a
add a (S b) = S (add a b)

ebenN :: Nat -> B
ebenN Zero = T
ebenN (S a) = oddN a

oddN :: Nat -> B
oddN Zero = F
oddN (S a) = ebenN a

gerade :: Nat -> B  ---- the same as ebenN
gerade   Zero    = T
gerade (S (S a)) = gerade a
gerade _         = F

ungerade :: Nat -> B  ---- the same as oddN 
ungerade = notB.gerade 

multN :: Nat -> Nat -> Nat
multN _ Zero  = Zero
multN a (S b) = add a (multN a b) 

subN :: Nat -> Nat -> Nat  ----  a-b gleich 0, wenn b>a
subN m Zero = m
subN m (S n) = predN (subN m n)

subN' :: Nat -> Nat -> Nat  --- definition without predN
subN' a Zero = a
subN' (S a) (S b) = subN' a b
subN' Zero _ = Zero

ltN :: Nat -> Nat -> B
ltN Zero (S _)  = T
ltN (S a) (S b) = ltN a b
ltN   _    _    = F

gtN :: Nat -> Nat -> B
gtN (S _)  Zero = T
gtN (S a) (S b) = gtN a b
gtN   _    _    = F

maxN :: Nat -> Nat -> Nat
maxN a b = iff (ltN a b) b a

maxN' :: Nat -> Nat -> Nat
maxN' x y = add (subN y x) x

foldn :: (Nat -> Nat) -> Nat -> Nat -> Nat
foldn h c Zero  = c
foldn h c (S n) = h (foldn h c n)

plus' :: Nat -> Nat -> Nat 
plus' m n = foldn succN m n

plus :: Nat -> Nat -> Nat  -- equivalent to plus'
plus = foldn succN

prodN :: Nat -> Nat -> Nat
prodN m = foldn (plus m) Zero

iff :: B -> a -> a -> a 
iff T a _ = a
iff F _ b = b

factorial :: Nat -> Nat 
factorial Zero = S Zero
factorial (S a) = multN (S a) (factorial a)

powN :: Nat -> Nat -> Nat   -- the case 0^0 is not defined!
powN (S b)    Zero = S Zero
powN (S b)   (S e) = multN (S b) (powN b e)

fib :: Nat -> Nat
fib Zero = Zero
fib (S Zero) = S Zero
fib (S (S b)) = add (fib b) (fib (S b))

-- another definition of eqN ---------
eqN' :: Nat -> Nat -> B  
eqN' a b = andB (notB (ltN a b)) (notB (ltN b a))

{-- some naturals values as constant functions for testing --}
one = S Zero
two = S (one)
three = S (two)
four  = S (three)
five  = S (four)
six   = S (five)
seven = S (six)
eight = S (seven)
nine  = S (eight)
ten   = S (nine)


data ZInt = Z Nat Nat deriving Show
               
addZ :: ZInt -> ZInt -> ZInt
addZ (Z a b) (Z c d) = Z (add a c) (add b d)

subZ :: ZInt -> ZInt -> ZInt
subZ (Z a b) (Z c d) = Z (add a d) (add b c)

{-- (a,b)*(c,d) equiv. (b-a)*(d-c) = bd - ad - cb + ac
                                   equiv.  (ad + cd, bd + ac)     --}
multZ :: ZInt -> ZInt -> ZInt
multZ (Z a b) (Z c d) = Z (add (multN a d) (multN c b)) (add (multN a c) (multN b d)) 

simplifyZ :: ZInt -> ZInt
simplifyZ (Z a b) = iff (ltN a b) (Z Zero (subN b a)) (Z (subN a b) Zero)

{-- (a,b) kleiner gleich (c,d) <=>  (b-a) kleiner gleich (d-c)
                               <=>  (b+c) kleiner gleich (a+d)
--}

ltZ :: ZInt -> ZInt -> B
ltZ (Z a b) (Z c d) = ltN (add b c) (add a d)

eqZ :: ZInt -> ZInt -> B
eqZ (Z a b) (Z c d) = eqN (add b c) (add a d)

negZ :: ZInt -> ZInt
negZ (Z a b) = Z b a

{-- some positive ZInts for testing --}

zone   =  Z Zero (one)
ztwo   =  Z Zero (two)
zthree =  Z Zero (three)
zfour  =  Z Zero (four)
zfive  =  Z Zero (five)
zsix   =  Z Zero (six)
zseven =  Z Zero (seven)
zeight =  Z Zero (eight)
znine  =  Z Zero (nine)
zten   =  Z Zero (ten)

{-- some negative ZInts for testing --}

mzone   =  Z (one) Zero
mztwo   =  Z (two) Zero
mzthree =  Z (three) Zero
mzfour  =  Z (four) Zero
mzfive  =  Z (five) Zero
mzsix   =  Z (six) Zero
mzseven =  Z (seven) Zero
mzeight =  Z (eight) Zero
mznine  =  Z (nine) Zero
mzten   =  Z (ten) Zero

data QRat = Q ZInt ZInt deriving Show

{-- (z1,n1) + (z2,n2) equiv. z1/n1 + z2/n2 = (z1*n2 + z2*n1)/(n1*n2)
                      equiv. (z1*n2 + z2*n1, n1*n2)
--}

addR :: QRat -> QRat -> QRat
addR (Q z1 n1) (Q z2 n2) = Q (addZ (multZ z1 n2) (multZ z2 n1)) (multZ n1 n2)

eqR :: QRat -> QRat -> B
eqR (Q z1 n1) (Q z2 n2) = eqZ (multZ z1 n2) (multZ n1 z2)

{-- some rational numbers for testing --}

rzero = Q (Z Zero Zero) (Z Zero (S Zero))
rone  = Q (Z Zero (S Zero)) (Z Zero (S Zero))
rtwo  = Q (Z Zero (S (S Zero))) (Z Zero (S Zero))
rthree = Q (Z Zero (S (S (S Zero)))) (Z Zero (S Zero))

{-- (z1,n1) + (z2,n2) equiv. z1/n1 + z2/n2 = (z1*n2 + z2*n1)/(n1*n2)
                      equiv. (z1*n2 + z2*n1, n1*n2)
--}

addQ :: QRat -> QRat -> QRat
addQ (Q z1 n1) (Q z2 n2) = Q (addZ (multZ z1 n2) (multZ z2 n1)) (multZ n1 n2)


