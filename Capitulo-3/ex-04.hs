--3.4) Faça uma função que retorne uma string, com todas as vogais maiúsculas e minúsculas eliminadas de uma string passada por parâmetro usando list compreenshion.

    removeVogais :: String -> String
    removeVogais palavra = [ x | x <- palavra, x `notElem` "aeiouAEIOU" ]