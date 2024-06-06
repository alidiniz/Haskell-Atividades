--9.8) Leia um arquivo que tenha o seguinte formato: 
--1 2 
--2 4 
--9 7 
--455 300 
--E verifique o maior número de cada linha e, ao final, o maior número entre todos. 
--Estes números devem ser mostrados em um arquivo.

import System.IO
import Data.List

-- Função para ler o conteúdo do arquivo e retornar uma lista de linhas
readFileLines :: FilePath -> IO [String]
readFileLines path = do
    contents <- readFile path
    return (lines contents)

-- Função para converter uma linha de string para uma lista de inteiros
lineToNumbers :: String -> [Int]
lineToNumbers line = map read (words line)

-- Função para encontrar o maior número de uma lista
maxOfList :: [Int] -> Int
maxOfList = maximum

-- Função principal
main :: IO ()
main = do
    -- Lendo as linhas do arquivo de entrada
    lines <- readFileLines "input.txt"
    
    -- Convertendo cada linha para uma lista de inteiros
    let numberLists = map lineToNumbers lines
    
    -- Encontrando o maior número de cada linha
    let maxNumbers = map maxOfList numberLists
    
    -- Encontrando o maior número entre todos
    let overallMax = maximum maxNumbers
    
    -- Criando o conteúdo a ser escrito no arquivo de saída
    let outputLines = map show maxNumbers ++ ["Maior número de todos: " ++ show overallMax]
    
    -- Escrevendo o resultado no arquivo de saída
    writeFile "output.txt" (unlines outputLines)
    
    putStrLn "Resultados escritos no arquivo output.txt"
