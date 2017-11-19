{--
    Aufgabe 1
--}
type Point = (Double, Double)
type Rect = (Point, Point)

area :: Rect -> Double
area ((x1,y1),(x2,y2)) = ((abs(x2 - x1))*(abs(y2-y1)))

contain :: Rect -> Rect -> Bool
contain ((x1,y1),(x2,y2))((x3,y3),(x4,y4)) = (((x1 < x3 && x3 < x2) && (x1 < x4 && x4 < x2)) && ((y1 < y3 && y3 < y2) && (y1 < y4 && y4 < y2))) || (((x1 < x3 && x3 < x4) && (x2 < x3 && x3 < x4)) && ((y1 < y3 && y3 < y4) && (y2 < y3 && y3 < y4)))

overlap :: Rect -> Rect -> Bool
overlap ((x1,y1),(x2,y2))((x3,y3),(x4,y4)) = ((x3 < x1 && x1 < x4) || (x3 < x2 && x2 < x4) || (y3 < y1 && y1 < y4) || (y3 < y2 && y2 < y4)) || ((x1 < x3 && x3 < x2) || (x1 < x4 && x4 < x2) || (y1 < y3 && y3 < y2) || (y1 < y4 && y4 < y2))
