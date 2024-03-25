--3.3) Implemente uma função que simule o vencedor de uma partida de pedra, papel e tesoura usando tipos criados. Casos de empate devem ser considerados em seu tipo.
    
    data Jogada = Pedra | Papel | Tesoura

    jogo :: Jogada -> Jogada -> String

    jogo Papel Pedra = "Jogador 1 Venceu!"
    jogo Pedra Tesoura = "Jogador 1 Venceu!"
    jogo Tesoura Papel = "Jogador 1 Venceu!"
    
    jogo Pedra Papel = "Jogador 2 Venceu!"
    jogo Tesoura Pedra = "Jogador 2 Venceu!"
    jogo Papel Tesoura = "Jogador 2 Venceu!"
    
    jogo _ _ = "Empate"