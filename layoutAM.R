### ### dia de la semana anterior
fechaN=Sys.Date()
fechabase=as.Date("2013-12-29")
if (as.integer(fechaN-fechabase) %% 7 ==1 ){fechaN=fechaN-3} else {fechaN=fechaN-1}
fecha=format(fechaN,"%Y%m%d")	
### ###

### ### determina los comandos para un batch
cmd <- "rem batch generado automaticamente por layoutAM.R\n"
cmd <- c(cmd, "del totalclienteshoy.txt", "del carteramodelohoy.txt", "del posicionbloqueadahoy.txt")
cmd <- c(cmd, paste0("\"C:/Program Files (x86)/FIDEM/AM/AmConsola.exe\" \"2|%AMUSER%|%PWD%|2|", fecha,",",fecha,"|%ruta%/CI_master/cargahoy|totalclienteshoy.txt|CSV|PIPE|\""))
cmd <- c(cmd, "\"C:/Program Files (x86)/FIDEM/AM/AmConsola.exe\" \"2|%AMUSER%|%PWD%|8|carteraModelo|%ruta%/CI_master/cargahoy|carteramodelohoy.txt|\"")
cmd <- c(cmd, "\"C:/Program Files (x86)/FIDEM/AM/AmConsola.exe\" \"2|%AMUSER%|%PWD%|8|posicionBloqueada|%ruta%/CI_master/cargahoy|posicionbloqueadahoy.txt|\"")

### ###

### ### escribe el batch
conn <- file("layoutAM.bat", open="w")
writeLines(cmd, conn)
close(conn)
### ###

