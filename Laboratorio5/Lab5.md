``` r
library(nycflights13)
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

``` r
library(readr)
library(readxl)
library(knitr)
library(DescTools)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

Inciso 1
========

Predecir un eclipse solar

Requisitos:

1.  Variable con la fecha del eclipse histórico.
2.  Variable que sea un Saros.
3.  Variable que sea un Synodic Month.
4.  La fecha del siguiente eclipse solar

``` r
# (1) El eciplse comenzó el 21 de agosto del 2017 a las 18:26:40

inicio <- dmy_hms('21/august/2017 18:26:40')

# (2) Un Synodic Month equivale a 29 días con 12 horas, con 44 minutos y 3 segundos

synodic <- ddays(29) + dhours(12) + dminutes(44) + dseconds(3)

# (3) Un Saros equivale a 223 Synodic Months

saros <- 223*synodic

# (4) La fecha del siguiente eclipse solar

prediccion <- inicio + saros

paste("La fecha del siguiente eclipse solar sera: ", prediccion)
```

    ## [1] "La fecha del siguiente eclipse solar sera:  2035-09-02 02:09:49"

Inciso 2
========

Utilizando la data adjunta “data.xlsx” y el paquete “Lubridate”,
responda a las siguientes preguntas:

1.  ¿En qué meses existe una mayor cantidad de llamadas por código?
2.  ¿Qué día de la semana es el más ocupado?
3.  ¿Qué mes es el más ocupado?
4.  ¿Existe una concentración o estacionalidad en la cantidad de
    llamadas?
5.  ¿Cuántos minutos dura la llamada promedio?
6.  Realice una tabla de frecuencias con el tiempo de llamada.

Inciso 3
========

Realice una función que reciba como input su fecha de nacimiento y
devuelva como output su signo zodiacal.

``` r
zodiaco <- function(x, stringsAsFactors = TRUE){
  signos <- c("Capricornio", "Aquario", "Pisces", "Aries", "Tauro", 
      "Geminis", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", 
      "Sagitario", "Capricornio")
    i <- cut(DescTools::Month(x) * 100 + DescTools::Day(x), 
    breaks = c(0, 120, 218, 320, 420, 520, 621, 722, 822, 
      923, 1023, 1122, 1221, 1231))
      if (stringsAsFactors) {
    res <- i
    levels(res) <- signos
  }
  else {
    res <- signos2[i]
  }
  return(res)
}

calcular_signo <- function(){
  input = readline(prompt = "Ingrese su fecha de nacimiento en el formato 'DD/MM/AAAA' sin comas ni diagnoales. Ejemplo: 23011998: ")
  nacimiento = dmy(input)
  signo = zodiaco(nacimiento)
  paste(signo)
}
```

``` r
calcular_signo()
```

    ## Ingrese su fecha de nacimiento en el formato 'DD/MM/AAAA' sin comas ni diagnoales. Ejemplo: 23011998:

    ## [1] "NA"

Inciso 4
========

1.  Genere 4 nuevas columnas para cada variable con formato fecha y
    hora.
2.  Encuentre el delay total que existe en cada vuelo. El delay total se
    puede encontrar sumando el delay de la salida y el delay de la
    entrada.

``` r
vuelos <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time))

# (1) Cuatro nuevas columnas

vuelos_columnas <- vuelos %>% 
  mutate(
    salida = ymd_hm(paste(year, month, day, dep_time %/% 100, ':', dep_time %% 100)),
    entrada = ymd_hm(paste(year, month, day, arr_time  %/% 100, ':', arr_time  %% 100)),
    salida_sched = ymd_hm(paste(year, month, day, sched_dep_time  %/% 100, ':', sched_dep_time  %% 100)),
    entrada_sched = ymd_hm(paste(year, month, day, sched_arr_time  %/% 100, ':', sched_arr_time  %% 100)),
  )

# (2) Encontrar el Delay

vuelos_delay <- vuelos %>% 
  mutate(
    delay = dep_delay + arr_delay
  )

head(vuelos_delay$delay, 10)
```

    ##  [1]  13  24  35 -19 -31   8  14 -17 -11   6
