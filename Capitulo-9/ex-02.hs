--9.2) Faça um programa que mostre uma palavra em ordem reversa a partir de uma digitada pelo usuário.

module Main where

main :: IO ()
main = do
  putStrLn "Digite uma palavra"
  x <- getLine
  putStrLn $ "A palavra ao contrário é: "++ reverse x