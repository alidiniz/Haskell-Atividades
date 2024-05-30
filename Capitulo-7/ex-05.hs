--7.5) Escreva uma instância de Functor para o tipo data Fantasma a = Fantasma .

module Quinto where

    data Fantasma a = Fantasma deriving Show

    instance Functor Fantasma where
        fmap g Fantasma = Fantasma