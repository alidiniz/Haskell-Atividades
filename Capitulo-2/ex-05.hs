--2.5)	Escreva	a função head como	composição	de	duas outras.

    headRewritten :: [Int] -> Int 
    headRewritten arr = (last . reverse) arr