library(plyr)

#### dia de la semana anterior ####
fechaN=Sys.Date()
fechabase=as.Date("2013-12-29")
if (as.integer(fechaN-fechabase) %% 7 ==1 ){fechaN=fechaN-3} else {fechaN=fechaN-1}
# fechaN <- as.Date("2017-04-19")

##### leer datos #####
pb <- read.csv("posicionbloqueadahoy.txt", header=FALSE, stringsAsFactors = FALSE)
names(pb) <- c("carteramodelo", "contrato", "tipo", "emisora", "serie", "monto", "tit", "titbloq", "precio")
pb$montobloq <- pb$titbloq*pb$precio
head(pb)

#### limpiar datos ####
pb <- pb[!(pb$emisora %in% c("Total por Moneda MXP-MXP")), ]
pb$carteramodelo <- gsub("﻿","", pb$carteramodelo)
pb$serie <- gsub("'","", pb$serie)
pb <- cbind(data.frame(fecha=fechaN), pb)
head(pb)

### quedarse solamente con las que son no cero ###
pb_short <- pb[pb$titbloq>0, c("fecha", "carteramodelo", "contrato", "tipo", "emisora", "serie", "titbloq", "montobloq")]
pb_short <- ddply(pb_short, .(fecha, carteramodelo, contrato, tipo, emisora, serie), summarize, tit=sum(titbloq), mon=sum(montobloq))

### guardar archivo ###
write.table(
  pb_short, 
  file="posicionbloqueadahoy.csv",
  sep=",",
  eol = "\n",
  quote = FALSE,
  row.names=FALSE,
  col.names=FALSE
)

