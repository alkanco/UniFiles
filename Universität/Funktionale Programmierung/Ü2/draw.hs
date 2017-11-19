{-- 
    Funktionale Programmierung, U2, 2017/2018
    Author: M. Esponda
--}

paintChars f size = putStrLn (genChars f size)
                      
genChars :: ((Int, Int, Int) -> Char) -> Int -> [Char]
genChars f size = paint size (map f [(x,y,size) | y <- [1..size], x <- [1..size]])
                      where
                        paint 0  []     = []
                        paint 0 (c:cs)  = '\n' : (paint size (c:cs))
                        paint n (c:cs)  = c: (paint (n-1) cs)

-- Beispielsfunktionen für die 2. Aufgabe des 2. Übungsblatt

diag (x,y,size) = if (x==y) then 'a' else ' '

quad (x,y,size) = if (x>s && x<3*s && y>s && y<3*s) then ' ' else '+'
                  where
                    s = div size 4

gitter (x,y,size) = if k || p  then ' ' else '0'
                    where
                         k = (mod x space)==0
                         p = (mod y space)==0
                         space = div size 4
						
{--
    Aufgabe 2
--}

diags ( x , y , size ) = if ( isDiagonalPoint == 0 ) then ' ' else '0'
                         where
                           s = 20
                           isDiagonalPoint = mod (x + y) s

squares (x,y,size) = if ((x > 19 && x < 41) && (y > 4 && y < 16) || (x > 19 && x < 41) && (y > 24 && y < 36) || (x > 19 && x < 41) && (y > 44 && y < 56)) then ' ' else '*'

triangles (x,y,size) | y < size `div`2 = if x >= y && x <= (size - y) then '#' else '.'
                     | otherwise       = if x >= (size - y) && x <= y then '#' else '.'

squares2 (x,y,size) | x == size || y == size = '#'
                    | isInside rectBig x y = ' '
					| isInside rectMed x y = ' '
					| isInside rectSmall x y = ' '
					| otherwise = '+'
					where
					  isInside p x y = p x && p y
					  
					  rectBig a = a > size `div`3
					  rectMed a = a < size `div`2 && a > size `div` 6
					  rectSmall a = a < size `div` 4 && a > size `div` 12
					  