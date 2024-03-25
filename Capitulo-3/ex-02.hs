-- 3.2)	Faça o tipo Temperatura	que	pode ter valores Celsius, Farenheit	ou	Kelvin.	Implemente	as	funções: converterCelsius:	recebe	um	valor double e	uma temperatura,	e faz a	conversão para Celsius. converterKelvin: recebe	um	valor double e	uma temperatura,	e	faz	a conversão	para Kelvin. converterFarenheit: recebe	 um	 valor double e uma	temperatura, e	faz	a conversão	para Farenheit.

    data Temperatura = Celsius | Farenheit | Kelvin

    converterCelsius :: Double -> Temperatura -> Double
    converterCelsius x Farenheit = 9/5 * x + 32
    converterCelsius x Kelvin = x + 273.15
    converterCelsius x _ = x

    converterKelvin :: Double -> Temperatura -> Double
    converterKelvin x Celsius = x - 273.15
    converterKelvin x Farenheit = 9/5 * (x - 273.15) + 32
    converterKelvin x _ = x

    converterFarenheit :: Double -> Temperatura -> Double
    converterFarenheit x Celsius = 5/9 * (x - 32)
    converterFarenheit x Kelvin = 5/9 * (x - 32) + 273.15
    converterFarenheit x _ = x