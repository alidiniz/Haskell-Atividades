--7.3) Crie a função mult234 :: Double -> Coisa Double que multiplica por 2 a primeira coordenada, por 3 a segunda, e por 4 a terceira. Use a instância de Applicative feita no exercício anterior.

data Coisa a = ZeroCoisa
             | UmaCoisa a
             | DuasCoisas a a
             | TresCoisas a a a
             deriving Show

instance Functor Coisa where
    fmap  ZeroCoisa = ZeroCoisa
    fmap f (UmaCoisa a) = UmaCoisa (f a)
    fmap f (DuasCoisas a b) = DuasCoisas (f a) (f b)
    fmap f (TresCoisas a b c) = TresCoisas (f a) (f b) (f c)

instance Applicative Coisa where
    pure a = UmaCoisa a

    ZeroCoisa <*>  = ZeroCoisa
     <> ZeroCoisa = ZeroCoisa
    (UmaCoisa f) <> (UmaCoisa a) = UmaCoisa (f a)
    (DuasCoisas f g) <> (DuasCoisas a b) = DuasCoisas (f a) (g b)
    (TresCoisas f g h) <> (TresCoisas a b c) = TresCoisas (f a) (g b) (h c)
     <> _ = ZeroCoisa  -- Combine other cases as necessary

mult234 :: Double -> Coisa Double
mult234 x = TresCoisas (x 2) (x * 3) (x * 4)

main :: IO ()
main = do
    let x = 5.0
    print $ mult234 x  -- Deve imprimir TresCoisas 10.0 15.0 20.0