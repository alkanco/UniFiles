{--
    Aufgabe 6
--}
delSpaces :: [Char] -> [Char]
delSpaces [] = []
delSpaces (testCase:rest)
  | testCase == ' ' = delSpaces rest
  | otherwise = [testCase] ++ delSpaces rest
