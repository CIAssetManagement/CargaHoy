rem 1. actualiza y corre el batch que pide el layout de AM de totalclientes y carteras modelo para la ultima fecha
rem 2. corre los scripts de R que limpian los datos
rem 3. carga los datos en sql

"%rutar%\R" CMD BATCH --vanilla --slave layoutAM.R
call layoutAM.bat

"%rutar%\R" CMD BATCH --vanilla --slave totalclienteshoy.R cargahoy_log.log
"%rutar%\R" CMD BATCH --vanilla --slave carteramodelohoy.R cargahoy_log.log
"%rutar%\R" CMD BATCH --vanilla --slave posicionbloqueadahoy.R cargahoy_log.log

"%rutasql%\mysql" -hCISM21 -u%sqluser%cism -p%sqlpwd%  < cargahoy.sql
