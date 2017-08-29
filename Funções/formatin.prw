#INCLUDE "TOTVS.CH"
 
User Function FormatIn()

/*
Tag #formatIn
*/

/* Parametros 
 param1  String a ser separada
 param2  Caracteres separador de string
 */
  
Local cSeparados 	:= ""
Local cString		:= 'NF#DPCH#DOC'
Local cSeparador 	:= '#'
Local cQuery

// Separa a variavel ctring e deixa pronta para uma query
cSeparados := FormatIn(cString,cSeparador)
//
// resultado do cstring ('NF','DP','DOC')
//

cQuery := " select  * from " + RetSqlName("SE1")
cQuery += "   Where d_d_l_e_t_='' " 
cQuery += "     and E1_TIPO IN " + cSeparados

// Resultado do cQuery

/* 
select * from se1990 where d_e_l_e_t_ = ' ' and E1_TIPO IN ('NF','DP','DOC')
/*
