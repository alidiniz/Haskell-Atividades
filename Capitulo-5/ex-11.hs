--5.11) Implemente os percursos pós-ordem e pré-ordem. Via comentário, faça os "testes de mesa" para os dois percursos da árvore `Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nula)) (Raiz 20 Nula (Raiz 22 (Folha 21) Nula))`.

data Arvore a
  = Nulo
  | Leaf a
  | Branch a (Arvore a) (Arvore a)
  deriving (Show)

posOrdem :: Show a => Arvore a -> [a]
posOrdem (Branch c l r) = posOrdem l ++ posOrdem r ++ [c] 
posOrdem (Leaf x) = [x]
posOrdem Nulo = []

-- teste de mesa para arvore: Branch 15 (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo)) (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo))

-- posOrdem Branch 15 (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo) (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) =  posOrdem (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo) ++ posOrdem (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) ++ [15]

-- posOrdem Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo) = posOrdem (Leaf 6) ++ posOrdem (Branch 12 (Leaf 10) Nulo) ++ [11]

-- posOrdem Leaf 6 = [6]

-- posOrdem Branch 12 (Leaf 10) Nulo = posOrdem (Leaf 10) ++ posOrdem Nulo ++ [12]

-- posOrdem Leaf 10 = [10]

-- posOrdem Nulo = []

-- posOrdem Branch 15 (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo) (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) = [6,10,12,11] ++ posOrdem (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) ++ [15]

-- posOrdem Branch 20 Nulo (Branch 22 (Leaf 21) Nulo) = posOrdem Nulo ++ posOrdem Branch 22 (Leaf 21) Nulo ++ [20]

-- posOrdem Nulo = []

-- posOrdem Branch 22 (Leaf 21) Nulo = posOrdem (Leaf 21) ++ posOrdem Nulo ++ [22]

-- posOrdem Leaf 21 = [21]

-- posOrdem Nulo = []

-- posOrdem Branch 15 (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo) (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) = [6,10,12,11] ++ [21,22,20] ++ [15]

-- [6,10,12,21,22,20,15]

preOrdem :: Show a => Arvore a -> [a]
preOrdem (Branch c l r) = [c] ++ preOrdem l ++ preOrdem r 
preOrdem (Leaf x) = [x]
preOrdem Nulo = []

-- teste de mesa para arvore: Branch 15 (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo)) (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo))

-- preOrdem Branch 15 (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo)) (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) = [15] ++ preOrdem (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo)) ++ preOrdem (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo))

-- preOrdem (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo)) = [11] ++ preOrdem (Leaf 6) ++ preOrdem (Branch 12 (Leaf 10) Nulo))

-- preOrdem Leaf 6 = 6

-- preOrdem (Branch 12 (Leaf 10) Nulo)) = [12] ++ preOrdem (Leaf 10) ++ preOrdem Nulo

-- preOrdem Leaf 10 = 10

-- preOrdem Nulo = []

-- preOrdem Branch 15 (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo)) (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) = [15] ++ [11, 6, 12, 10] ++ preOrdem (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo))

-- preOrdem (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) = [20] ++ preOrdem Nulo ++ preOrdem (Branch 22 (Leaf 21) Nulo)

-- preOrdem (Branch 22 (Leaf 21) Nulo) = [22] ++ preOrdem (Leaf 21) ++ preOrdem Nulo

-- preOrdem Leaf 21 = 21

-- preOrdem Branch 15 (Branch 11 (Leaf 6) (Branch 12 (Leaf 10) Nulo)) (Branch 20 Nulo (Branch 22 (Leaf 21) Nulo)) = [15] ++ [11, 6, 12, 10] ++ [20,22,21]

-- [15, 11, 6, 12, 10, 20, 22, 21]