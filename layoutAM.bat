rem batch generado automaticamente por layoutAM.R

del totalclienteshoy.txt
del carteramodelohoy.txt
del posicionbloqueadahoy.txt
"C:/Program Files (x86)/FIDEM/AM/AmConsola.exe" "2|%AMUSER%|%PWD%|2|20170810,20170810|%ruta%/CI_master/cargahoy|totalclienteshoy.txt|CSV|PIPE|"
"C:/Program Files (x86)/FIDEM/AM/AmConsola.exe" "2|%AMUSER%|%PWD%|8|carteraModelo|%ruta%/CI_master/cargahoy|carteramodelohoy.txt|"
"C:/Program Files (x86)/FIDEM/AM/AmConsola.exe" "2|%AMUSER%|%PWD%|8|posicionBloqueada|%ruta%/CI_master/cargahoy|posicionbloqueadahoy.txt|"
