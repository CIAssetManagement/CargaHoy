#### ####
col.names <- c("CarteraModelo", "Contrato", "Fecha", "TotalCartera", "Reporto", "Tipo", "Emisora", "Serie", "Titulos", "Costo", "Precio", "Monto")
col.index <- c(32, 2, 1, 83, 5, 6, 7, 8, 10, 11, 12, 13)
col.classes <- c("character", "character", "character", "numeric", "character", "character", "character", "character", "numeric", "numeric", "numeric", "numeric")
totalclientes_Data <- read.csv(
  "totalclienteshoy.txt", 
  sep="|",
  quote="",
  header=FALSE,
  strip.white=TRUE,
  stringsAsFactors=FALSE,
  skipNul=TRUE
)
totalclientes <- totalclientes_Data[ ,col.index]
names(totalclientes) <- col.names
totalclientes <- totalclientes[which(!totalclientes$Reporto=="TM MXP-MXP"), ] 
# if(sum(is.na(totalclientes[nrow(totalclientes), ])) > 1)
totalclientes <- totalclientes[-nrow(totalclientes), ] # 
#### ####

#### #### dar formato a las columnas
for(i in which(col.classes=="numeric"))
  totalclientes[ ,i] <- as.numeric(gsub("\\$|,", "", totalclientes[ ,i]))
totalclientes$Fecha <- as.Date(totalclientes$Fecha, format="%d/%m/%Y")
totalclientes$Serie <- gsub("'","", totalclientes$Serie)
totalclientes$Perc <- totalclientes$Monto/totalclientes$TotalCartera
#### ####

#### #### escribir los datos
write.table(
  totalclientes, 
  file="totalclienteshoy.csv",
  sep=",",
  eol = "\n",
  quote = FALSE,
  row.names=FALSE,
  col.names=FALSE
)
#### ####