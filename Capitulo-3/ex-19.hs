--3.19) Tendo como base o exercício de conversão de medidas, crie uma função que faça conversão de câmbio. Você deve criar o tipo Cambio contendo os value constructors Euro , Real e Dollar . Crie também o tipo Moeda que possui os campos val :: Double e cur :: Cambio . Use record syntax e as taxas de conversão do dia no qual você fez o exercício.
    
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