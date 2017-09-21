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

/* outras informacoes
http://tdn.totvs.com/display/tec/RDDName
*/

DbSelectArea("SA2")
_aEstru := DbStruct()
_cArq := Criatrab(nil,.f.)

dbCreate(_cArq,_aEstru,"DBFCDX")    // Vai Criar um arquivo .DTC ou .DBF conforme dicionario
_cArq := soma1(_cArq)
dbCreate(_cArq,_aEstru,"DBFCDXAXS") // Vai Criar um arquivo .DTC ou .DBF conforme dicionario
''_cArq := soma1(_cArq)
dbCreate(_cArq,_aEstru,"DBFCDXADS")  // Vai criar um arquivo .DBF
''_cArq := soma1(_cArq)
dbCreate(_cArq,_aEstru,"TOPCONN")  // Vai criar uma nova tabela no banco de dados relacional



return 