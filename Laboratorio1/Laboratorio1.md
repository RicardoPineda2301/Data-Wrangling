Lab1
================
RicardoPineda
8/5/2020

### Problema 1

``` r
library(readr)
library(readxl)
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

``` r
ene <- read_excel("data/01-2018.xlsx")
ene$fecha="01-2018"
feb <- read_excel("data/02-2018.xlsx")
feb$fecha="02-2018"
mar <- read_excel("data/03-2018.xlsx")
mar$fecha="03-2018"
abr <- read_excel("data/04-2018.xlsx")
abr$fecha="04-2018"
may <- read_excel("data/05-2018.xlsx")
may$fecha="05-2018"
jun <- read_excel("data/06-2018.xlsx")
jun$fecha="06-2018"
jul <- read_excel("data/07-2018.xlsx")
jul$fecha="07-2018"
ago <- read_excel("data/08-2018.xlsx")
```

    ## New names:
    ## * `` -> ...10

``` r
ago$fecha="08-2018"
sep <- read_excel("data/09-2018.xlsx")
sep$fecha="09-2018"
oct <- read_excel("data/10-2018.xlsx")
oct$fecha="10-2018"
nov <- read_excel("data/11-2018.xlsx")
nov$fecha="11-2018"

ago$...10 <- NULL
ago$TIPO <- NULL
jul$TIPO <- NULL
nov$TIPO <- NULL
oct$TIPO <- NULL
sep$TIPO <- NULL

final <- rbind(ene, feb, mar,abr,may,jun,jul,ago,sep,oct,nov)

write_excel_csv2(final, "final.xlsx", delim = ",")

print(final)
```

    ## # A tibble: 2,180 x 9
    ##    COD_VIAJE CLIENTE     UBICACION CANTIDAD PILOTO        Q CREDITO UNIDAD fecha
    ##        <dbl> <chr>           <dbl>    <dbl> <chr>     <dbl>   <dbl> <chr>  <chr>
    ##  1  10000001 EL PINCHE ~     76002     1200 Fernando~ 300        30 Camio~ 01-2~
    ##  2  10000002 TAQUERIA E~     76002     1433 Hector A~ 358.       90 Camio~ 01-2~
    ##  3  10000003 TIENDA LA ~     76002     1857 Pedro Al~ 464.       60 Camio~ 01-2~
    ##  4  10000004 TAQUERIA E~     76002      339 Angel Va~  84.8      30 Panel  01-2~
    ##  5  10000005 CHICHARRON~     76001     1644 Juan Fra~ 411        30 Camio~ 01-2~
    ##  6  10000006 UBIQUO LAB~     76001     1827 Luis Jai~ 457.       30 Camio~ 01-2~
    ##  7  10000007 CHICHARRON~     76002     1947 Ismael R~ 487.       90 Camio~ 01-2~
    ##  8  10000008 TAQUERIA E~     76001     1716 Juan Fra~ 429        60 Camio~ 01-2~
    ##  9  10000009 EL GALLO N~     76002     1601 Ismael R~ 400.       30 Camio~ 01-2~
    ## 10  10000010 CHICHARRON~     76002     1343 Fernando~ 336.       90 Camio~ 01-2~
    ## # ... with 2,170 more rows

### Problema 2

``` r
x1 <- sample.int(10,100, replace = TRUE)

x2 <- sample.int(50,100, replace = TRUE)

x3 <- sample.int(100,100, replace = TRUE)

df <- data.frame(x1,x2,x3)

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}


moda <- lapply(df, Mode)

print(moda)
```

    ## $x1
    ## [1] 10
    ## 
    ## $x2
    ## [1] 14
    ## 
    ## $x3
    ## [1] 46

### Problema 3

``` r
vehiculos <- read_delim("data/INE_PARQUE_VEHICULAR_080720.txt", delim = "|")
```

    ## Warning: Missing column names filled in: 'X11' [11]

    ## Parsed with column specification:
    ## cols(
    ##   ANIO_ALZA = col_double(),
    ##   MES = col_character(),
    ##   NOMBRE_DEPARTAMENTO = col_character(),
    ##   NOMBRE_MUNICIPIO = col_character(),
    ##   MODELO_VEHICULO = col_character(),
    ##   LINEA_VEHICULO = col_character(),
    ##   TIPO_VEHICULO = col_character(),
    ##   USO_VEHICULO = col_character(),
    ##   MARCA_VEHICULO = col_character(),
    ##   CANTIDAD = col_double(),
    ##   X11 = col_character()
    ## )

    ## Warning: 2639139 parsing failures.
    ## row col   expected     actual                                   file
    ##   1  -- 11 columns 10 columns 'data/INE_PARQUE_VEHICULAR_080720.txt'
    ##   2  -- 11 columns 10 columns 'data/INE_PARQUE_VEHICULAR_080720.txt'
    ##   3  -- 11 columns 10 columns 'data/INE_PARQUE_VEHICULAR_080720.txt'
    ##   4  -- 11 columns 10 columns 'data/INE_PARQUE_VEHICULAR_080720.txt'
    ##   5  -- 11 columns 10 columns 'data/INE_PARQUE_VEHICULAR_080720.txt'
    ## ... ... .......... .......... ......................................
    ## See problems(...) for more details.

``` r
print(vehiculos)
```

    ## # A tibble: 2,639,132 x 11
    ##    ANIO_ALZA MES   NOMBRE_DEPARTAM~ NOMBRE_MUNICIPIO MODELO_VEHICULO
    ##        <dbl> <chr> <chr>            <chr>            <chr>          
    ##  1      2007 05    EL PROGRESO      "EL JICARO"      2007           
    ##  2      2007 05    ESCUINTLA        "SAN JOS\xc9"    2006           
    ##  3      2007 05    JUTIAPA          "MOYUTA"         2007           
    ##  4      2007 05    GUATEMALA        "FRAIJANES"      1997           
    ##  5      2007 05    QUETZALTENANGO   "QUETZALTENANGO" 2007           
    ##  6      2007 05    HUEHUETENANGO    "CUILCO"         1999           
    ##  7      2007 05    SUCHITEPEQUEZ    "CHICACAO"       2007           
    ##  8      2007 05    ESCUINTLA        "ESCUINTLA"      2007           
    ##  9      2007 05    GUATEMALA        "MIXCO"          2007           
    ## 10      2007 05    GUATEMALA        "GUATEMALA"      2003           
    ## # ... with 2,639,122 more rows, and 6 more variables: LINEA_VEHICULO <chr>,
    ## #   TIPO_VEHICULO <chr>, USO_VEHICULO <chr>, MARCA_VEHICULO <chr>,
    ## #   CANTIDAD <dbl>, X11 <chr>
