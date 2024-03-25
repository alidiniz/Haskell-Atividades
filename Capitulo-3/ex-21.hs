--3.21) Crie a função maxMoeda que recebe uma lista de moedas e retorna o valor máximo absoluto (sem conversão alguma) dentre os campos val desta lista. Exemplo: Prelude> maxMoeda [Moeda 3 Real, Moeda 7 Dollar, Moeda 1 Euro] 7 Use a função maximum.
    
    data Cambio = Euro | Real | Dollar deriving Show
    data Moeda = Moeda {val :: Double, cur :: Cambio} deriving Show

    converteMoedas :: Moeda -> Cambio -> Moeda
    converteMoedas (Moeda x Real) Euro = Moeda (x * 0.22) Euro
    converteMoedas (Moeda x Dollar) Euro = Moeda (x * 0.91) Euro
    converteMoedas (Moeda x Dollar) Real = Moeda (x * 4.16) Real
    converteMoedas (Moeda x Euro) Real = Moeda (x * 4.58) Real
    converteMoedas (Moeda x Real) Dollar = Moeda (x * 0.24) Dollar
    converteMoedas (Moeda x Euro) Dollar = Moeda (x * 1.1) Dollar
    converteMoedas (Moeda x y) z = Moeda x z

    converterTodosReal :: [Moeda] -> [Moeda]
    converterTodosReal mdList = [ converteMoedas md Real | md <- mdList ]
    
    maxMoeda :: [Moeda] -> Double
    maxMoeda mdList = maximum [ val md | md <- mdList ]