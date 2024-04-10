--5.4) Crie uma função `minAll` que recebe um `[Min]` e retorna um `Min` contendo o menor valor.


import           Data.Monoid

newtype Min =
  Min Int
  deriving (Ord, Eq, Show)

instance Semigroup Min where
    (Min x) <> (Min y)
        | Min x < Min y = Min x
        | Min x > Min y = Min y
        | otherwise = Min x

instance Monoid Min where
    mempty = Min (maxBound :: Int)

-- Ex04

minAll :: [Min] -> Min
minAll = mconcat