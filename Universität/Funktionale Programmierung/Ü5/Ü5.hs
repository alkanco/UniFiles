import Data.List (sort)

-- Aufgabe 1
funktion b xs = foldl multBase 0 xs
  where
    multBase x y = x * b + y

--3. Aufgabe
potenzSeq :: Int -> Int -> [Int]
potenzSeq n m = sort [b^e|b<-[2,3..n],e<-[2,3..m]]
--potenzSeq ist eine quadratische Funktion

--4. Aufgabe
-- minNatNotIn [n] = [x|x<-[1..
