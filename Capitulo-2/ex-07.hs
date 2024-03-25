--2.7 Faça uma função	 que receba	 um	 inteiro e	 retorne uma tupla,	contendo:	o	dobro	deste	número	na	primeira coordenada, o triplo na segunda, o	quádruplo na terceira e	o	quíntuplo na quarta.

    tuplaGen :: Int -> (Int, Int, Int, Int)
    tuplaGen number = (number*2, number*3,number*4,number*5)