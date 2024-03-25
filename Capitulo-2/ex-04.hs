--2.4)	 Escreva uma função	 que receba	 um	 vetor	de	Strings e retorne uma lista	 com o	tamanho	 de	 cada String. As palavras de tamanho par devem	ser	excluídas da resposta.

    stringLength :: [String] -> [Int]
    stringLength strls = [ length x | x <- strls, length x `mod` 2 /= 0]
