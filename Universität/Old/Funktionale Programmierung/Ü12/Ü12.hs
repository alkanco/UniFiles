--Funktionale Programmierung
--Übung 12
--William Djalal
import Data.Char

--1.Aufgabe
--a)
data Expr = Var String | App Expr Expr | Lambda String Expr | Nil
instance Show Expr 
	where
		show = expr2String
	
expr2String :: Expr -> String
expr2String (Var x) = x
expr2String (App l r) = "(" ++ (expr2String l) ++ ")(" ++ (expr2String r) ++ ")"
expr2String (Lambda y z) = "/" ++ (expr2String y) ++ "." ++ (expr2String z)

--b)
string2Num :: String -> Int
string2Num xs = reverse2Num (reverse xs)
	where
		reverse2Num [] = 0
		reverse2Num (x:xs) = (digitToInt x) + (10 * (reverse2Num xs))

--c)
nat2lambda :: Int -> String
nat2lambda n = "(/s./z." ++ (lambdaBody n) ++ ")"
	where
		lambdaBody 0 = "z"
		lambdaBody n = "s(" ++ (lambdaBody (n-1)) ++ ")"
