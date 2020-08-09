---
title: "Lab1"
author: "RicardoPineda"
date: "8/5/2020"
output: rmarkdown::github_document
---

### Problema 1
````{r}
library(readr)
library(readxl)
library(dplyr)

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

head(final, 10)
````

### Problema 2
````{r}
x1 <- sample.int(10,100, replace = TRUE)

x2 <- sample.int(50,100, replace = TRUE)

x3 <- sample.int(100,100, replace = TRUE)

df <- data.frame(x1,x2,x3)

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}


moda <- lapply(df, Mode)

head(moda)
````

### Problema 3
````{r}
vehiculos <- read_delim("data/INE_PARQUE_VEHICULAR_080720.txt", delim = "|")
head(vehiculos)
````