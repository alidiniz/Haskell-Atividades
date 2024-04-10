--5.1) Crie o tipo `TipoProduto` que possui os values constructors `Escritorio`, `Informatica`, `Livro`, `Filme` e `Total`. O tipo `Produto` possui um value constructor - de mesmo nome - e os campos `valor` (Double), `tp` (TipoProduto) e um value constructor `Nada`, que representa a ausência de um Produto. Deseja-se calcular o valor total de uma compra, de modo a não ter nenhuma conversão para inteiro e de forma combinável. Crie uma instância de monoide para `Produto`, de modo que o retorno sempre tenha `Total` no campo `tp` e a soma dos dois produtos em `valor`. Explique como seria o exercício sem o uso de monoides. Qual(is) seria(m) a(s) diferença(s)?

import           Data.Monoid

data TipoProduto
  = Escritorio
  | Informatica
  | Livro
  | Filme
  | Total
  deriving (Show)

data Produto
  = Produto
      { valor :: Double
      , tp    :: TipoProduto
      }
  | Nada
  deriving (Show)

-- Solução com Monoide
instance Semigroup Produto where
    (Produto v1 t1) <> (Produto v2 t2) = Produto (v1 + v2) Total
    (Produto v1 t1) <> Nada = Produto v1 Total
    Nada <> (Produto v2 t2)  = Produto v2 Total
    Nada <> Nada = mempty

instance Monoid Produto where
    mempty = Nada
-- Testar com => mconcat [(Produto 10 Filme), (Produto 10 Filme), (Produto 10 Filme), Nada]

-- Solução sem Monoide
somaProduto :: [Produto] -> Produto
somaProduto =
  foldl (\pt pd -> Produto (valor pt + valor pd) Total) (Produto 0 Total)

