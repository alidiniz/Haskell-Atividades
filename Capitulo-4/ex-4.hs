--4.4) Filtre os números primos de uma lista recebida por parâmetro.

    verificaPrimo :: Int -> Bool
    verificaPrimo n = length [x | x <- [1 .. n], n `mod` x == 0] == 2

    filtraPrimos :: [Int] -> [Int]
    filtraPrimos = filter verificaPrimo