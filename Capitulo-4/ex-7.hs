--4.7) Crie um tipo `Dia` contendo os dias da semana. Faça uma função que receba uma lista de `Dias` e filtre as `Terças`.

    data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado deriving Show

    ehTerca :: Dia -> Bool
    ehTerca Terca = True
    ehTerca _ = False

    filtraTercas :: [Dia] -> [Dia]
    filtraTercas = filter ehTerca