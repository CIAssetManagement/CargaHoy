use portafolio;

LOAD DATA local INFILE 'carteramodelohoy.csv'
INTO TABLE carteraModelo
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA local INFILE 'posicionbloqueadahoy.csv'
INTO TABLE posicionBloqueada
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA local INFILE 'totalclienteshoy.csv'
INTO TABLE posiciones
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


show warnings;