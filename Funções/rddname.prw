#INCLUDE "TOTVS.CH"
 
User Function rddname()

/*
Tag #formatIn
*/

/* Parametros 
 param1  String a ser separada
 param2  Caracteres separador de string
 */
  
Local cDriver 	:= ""

cDriver := RddName()
/* Retorno esperado para retorno

RDD
DBFCDX
DBFCDXTTS
DBFCDXAX
BTV
BTVCDX
CTREECDX
TOPCONN
CODEBCDX
CODEBCDXTTS
DBFCDXADS
MEMORY
SQLITE
CTREETMP
*/

 // "DBFCDX" Este é o padrao para ambientes DBF/CDXJMN