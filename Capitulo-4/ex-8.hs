--4.8) Implemente o tipo `Dinheiro` que contenha os campos `valor` e `correncia` (Real ou Dolar), e uma função que converta todos os "dinheiros" de uma lista para dólar (e outra para real). Com isso, implemente funções para:

-- Filtrar todos os `Dolares` de uma lista de `Dinheiro`.
-- Somar todos os `Dolares` de uma lista.
-- Contar a quantidade de `Dolares` de uma lista.

data Dinheiro =
  Dinheiro
    { valor     :: Double
    , correncia :: String
    }
  deriving (Show)

converteDolarParaReal :: [Dinheiro] -> [Dinheiro]
converteDolarParaReal = map (\dn -> Dinheiro (valor dn * 4.18) "Real")

converteRealParaDolar :: [Dinheiro] -> [Dinheiro]
converteRealParaDolar = map (\dn -> Dinheiro (valor dn * 0.24) "Dolar")

filtraDolar :: [Dinheiro] -> [Dinheiro]
filtraDolar = filter (\dn -> correncia dn == "Dolar")

somaDolares :: [Dinheiro] -> Double
somaDolares d = foldl (\soma dn -> soma + valor dn) 0 $ filtraDolar d

contaDolares :: [Dinheiro] -> Int
contaDolares d = length $ filtraDolar d