--2.2)Crie uma função que verifique se o tamanho de	uma String é par ou	não. Use Bool como retorno.

stringEven :: String -> Bool
stringEven string = length string `mod` 2 == 0