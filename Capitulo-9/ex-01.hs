--9.1) Faça um programa que faça o usuário digitar um número, 
--e mostre na saída padrão se ele é par ou ímpar.

module Main where

main :: IO ()
main = do
  putStrLn "Digite um numero: "
  numero <- readLn
  if even numero
    then putStrLn "Ele eh PAR"
    else putStrLn "Ele eh IMPAR"