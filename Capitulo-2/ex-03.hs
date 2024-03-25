--2.3)Escreva uma função que receba um vetor de Strings e retorne uma lista com todos os elementos	em	ordem	reversa.

    stringReverse :: [String] -> [String]
    stringReverse strls = [ reverse x | x <- strls]