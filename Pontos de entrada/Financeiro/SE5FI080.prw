#include "rwmake.ch"        // Ajustado

/* Permite que sejam gravados campos auxiliares no arquivo SE5 */


/* 

Funciona at� a vers�o 11 a partir da vers�o 12 deve ser usado outro ponto de entreda F80GRVFK 

*/



User Function SE5FI080()



DBSELECTAREA("SE5")
if !se5->(eof())
	RECLOCK("SE5",.F.) // ajustado
	SE5->E5_DEBITO := SE2->E2_DEBITO
	MSUNLOCK()
Endif
Return()
