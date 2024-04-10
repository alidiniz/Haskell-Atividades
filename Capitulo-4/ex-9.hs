--4.9) Usando a função `foldl`, crie lambdas para:

-- Contar números negativos de uma lista de `Int`.
-- Contar letras 'P' de uma `String`.
-- Para contar Sabados em uma lista de um `[DiaSemana]`.
-- Para, a partir de uma lista de `[DiaSemana]`, retornar a soma dos dias. Exemplo: `[Segunda, Segunda, Quarta]` deve retornar `5`. Use uma função auxiliar para converter `DiaSemana` para `Int`.

data DiaSemana
  = Domingo
  | Segunda
  | Terca
  | Quarta
  | Quinta
  | Sexta
  | Sabado
  deriving (Show)

contaNegativos :: [Int] -> Int
contaNegativos =
  foldl
    (\cont n ->
       if n < 0
         then cont + 1
         else cont)
    0

contaLetraP :: String -> Int
contaLetraP =
  foldl
    (\cont letra ->
       if letra == 'P'
         then cont + 1
         else cont)
    0

contaSabados :: [DiaSemana] -> Int
contaSabados =
  foldl
    (\cont dia ->
       case dia of
         Sabado -> cont + 1 
         _ -> cont)
    0