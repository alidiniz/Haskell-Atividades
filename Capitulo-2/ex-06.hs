--2.6) Faça	uma	função	que	receba uma	String	e retorne True se esta	for	um	palíndromo;	caso contrário,	 False.

    verificaPalindromo :: String -> Bool
    verificaPalindromo possivelPalindromo = possivelPalindromo == reverse possivelPalindromo