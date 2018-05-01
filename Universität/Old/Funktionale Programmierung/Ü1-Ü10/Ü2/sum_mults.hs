{--
   Aufgabe 4
--}

sum_mults :: Int -> Int -> Int -> Int
sum_mults x y n = sum [(if(mod n x == 0 && mod n y == 0) then n else 0) |n <- [0..n]] 