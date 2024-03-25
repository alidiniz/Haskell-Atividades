--3.10) Faça uma função chamada revNum , que receba uma String s e um Int n . Esta deverá retornar as n primeiras letras em ordem reversa e o restante em sua ordem normal. Exemplo: revNum 4 "FATEC" = "ETAFC"
    
    revNum :: Int -> String -> String
    revNum n s =  reverse (take n s) ++ drop n s