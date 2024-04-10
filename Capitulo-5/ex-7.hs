--5.7) Usando a estrutura de árvore, monte uma função `mapa`, que jogue uma função passada por parâmetro para todos os elementos de uma árvore. Deixe explícito o tipo desta função.

data Arvore a
  = Nulo
  | Leaf a
  | Branch a (Arvore a) (Arvore a)
  deriving (Show)

mapa :: (Int -> Int) -> Arvore Int -> [Int]
mapa f (Branch c l r) = mapa f l ++ [f c] ++ mapa f r
mapa f (Leaf c) = [f c]
mapa f Nulo = []

mapa2 :: (Int -> Int) -> Arvore Int -> Arvore Int
mapa2 f (Branch c l r) = Branch (f c) (mapa2 f l) (mapa2 f r)
mapa2 f (Leaf c) = Leaf (f c)
mapa2 f Nulo = Nulo


