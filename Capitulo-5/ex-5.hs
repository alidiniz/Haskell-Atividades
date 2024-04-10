--5.5) Crie o tipo `Paridade` com os values constructors `Par` e `Impar`. Crie o typeclass `ParImpar` que contém a função `decide :: a -> Paridade` e possui as instâncias:
-- Para `Int`: noção de Par/Impar de `Int`.
-- Para `[a]`: uma lista de elementos qualquer é `Par` se o número de elementos o for.
-- `Bool`: `False` como `Par`, `True` como `Impar`.

data Paridade
  = Par
  | Impar
  deriving Show

class ParImpar a where
    decide :: a -> Paridade

instance ParImpar Int where
    decide x = if even x then Par else Impar

instance ParImpar [a] where
    decide x = if even $ length x then Par else Impar

instance ParImpar Bool where
    decide x = if x then Impar else Par

-- class SimNao a where
--   simnao :: a -> Bool

-- instance SimNao Int where
--     simnao x
--         | x < 18 = False
--         | otherwise = True