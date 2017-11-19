{--
   Aufgabe 3
--}

pi_l :: Int -> Double
pi_l 0 = error "Error: Don't use 0!"
pi_l n = 4 * sum [((-1)**(fromIntegral x)/(2*(fromIntegral x) +1)) | x <- [0..n]]