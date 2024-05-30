--8.1) Faça um tipo Caixa com um type parameter a e três construtores chamados Um , Dois e Tres possuindo um, dois e três campos de tipo a , respectivamente. 
--Faça uma instância de Functor para o tipo Caixa . 
--A função deve ser aplicada em todas as coordenadas dos valores ( Um , Dois ou Tres ). 
--Crie uma instância de Monad para o tipo Caixa . Seu return deve ser o value constructor de Um . 
--Observação: quando definir >>= para Caixa , o valor a entrar em f segue as regras: Um : o único campo entra na função (análogo ao
--Maybe ); Dois : o segundo campo entra; Tres : o terceiro campo entra.

--8.2) Crie uma função mult234 :: Double -> Caixa Double que receba uma parâmetro x e 
--devolva o dobro de x na primeira coordenada, 
--o triplo na segunda e o quádruplo na terceira usando o operador >>= . 

--8.3) Determine o valor das expressões a seguir (caso seja possível), 
--sem usar o GHCi: Tres 1 2 3 >>= mult234 >>= mult234 Dois 2 4 >>= mult234 :kind Coisa Dois 2 3 >>= \_ -> Dois 7 7 

--8.4) Faça um exemplo, usando a notação do , 
--de um trecho qualquer de código usando sua Monad Caixa .


module PrimeiroESegundoETerceiroEQuarto where

    import Control.Monad

    data Caixa a = Um a | Dois a a | Tres a a a deriving Show

    instance Functor Caixa where
        fmap f (Um x) = Um (f x)
        fmap f (Dois x y) = Dois (f x) (f y)
        fmap f (Tres x y z) = Tres (f x) (f y) (f z)
    
    instance Applicative Caixa where
        pure = Um
        (<*>) (Um f) (Um y) = Um (f y) 
        (<*>) (Um f) (Dois x y) = Dois (f x) (f y) 
        (<*>) (Um f) (Tres x y z) = Tres (f x) (f y) (f z) 

    instance Monad Caixa where
        return = Um
        (Um x) >>= f = f x
        (Dois x y) >>= f = f y
        (Tres x y z) >>= f = f z

    func :: Int -> Caixa Int
    func x = return (2*x) 

    tiraDaCaixa :: Caixa a -> a
    tiraDaCaixa (Um x) = x 

    mult234 :: Double -> Caixa Double
    mult234 x = Tres ( tiraDaCaixa (Um x >>= (\x -> return(x*2))) ) ( tiraDaCaixa (Dois x x >>= (\x -> return(x*3))) ) ( tiraDaCaixa (Tres x x x >>= (\x -> return(x*4))) ) 

    -- EX8.3
    -- DETERMINAR O VALOR DAS EXPRESSOES:
    -- Tres 1 2 3 >>= mult234 >>= mult234
    -- Resposta: Tres 24.0 36.0 48.0

    -- Dois 2 4 >>= mult234
    -- Resposta: Tres 8.0 12.0 16.0

    -- :kind Caixa
    -- Resposta: * -> *
    
    -- Dois 2 3 >>= \_ -> Dois 7 7
    -- Resposta: Dois 7 7

    mult456 :: Double -> Caixa Double
    mult456 x = do
        w <- return x
        x <- return (w*4)
        y <- return (x*5)
        z <- return (y*6)
        return z