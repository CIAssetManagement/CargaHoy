#### #### dia de la semana anterior
fechaN=Sys.Date()
fechabase=as.Date("2013-12-29")
if (as.integer(fechaN-fechabase) %% 7 ==1 ){fechaN=fechaN-3} else {fechaN=fechaN-1}
fecha=format(fechaN,"%Y%m%d")
# fecha <- "20170419" # poner en dias festivos
#### ####

#### #### carga datos
col.names=c("Grupo", "SubGrupo", "Instrumento", "Porcentaje", "Participacion")
col.classes=c("character", "character", "character", "numeric", "numeric")
carteramodelo_Data <- read.csv(
  "carteramodelohoy.txt", 
  sep=",",
  quote="",
  header=FALSE,
  strip.white=TRUE,
  stringsAsFactors=FALSE
)
#### ####

#### #### escribe datos
carteramodelo <- carteramodelo_Data
names(carteramodelo) <- c("Grupo", "SubGrupo", "Instrumento", "Porcentaje", "Participacion")
carteramodelo$Grupo <- gsub("﻿","", carteramodelo$Grupo)
Fecha <- as.Date(fecha, format="%Y%m%d")
carteramodelo <- cbind(Fecha, carteramodelo)

write.table(carteramodelo, 
  file="carteramodelohoy.csv",
  sep=",",
  eol = "\n",
  quote = FALSE,
  row.names=FALSE,
  col.names=FALSE
)
#### ####