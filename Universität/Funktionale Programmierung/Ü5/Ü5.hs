import Data.List (sort)
--3. Aufgabe
potenzSeq :: Int -> Int -> [Int]
potenzSeq n m = sort [b^e|b<-[2,3..n],e<-[2,3..m]]
--potenzSeq ist eine quadratische Funktion