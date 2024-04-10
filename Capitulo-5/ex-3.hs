--5.3) A função `min` no Haskell retorna o menor entre dois números, por exemplo, `min 4 5 = 4`. Crie um tipo `Min` com um campo inteiro, que seja instância de `Ord`, `Eq` e `Show` (deriving). Crie uma instância de `Monoid` para `Min` (`maxBound` representa o maior inteiro existente no Haskell). Quanto vale a expressão `Min (-32) <> Min (-34) <> Min (-33)`? Explique sua escolha para o `mempty`.

import Data.Monoid

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
