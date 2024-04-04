#include "ed3.ch"
#include "rwmake.ch"
#include "totvs.ch"

User function FWGetSX5(_cTabela, _cChave)
Local _cDescricao := ""
Local _aDados := {}
Local x

if _cChave == nil 
	_aDados := FWGetSX5( _cTabela )
	for x := 1 to len(_aDados)
		_cDescricao += Alltrim(_aDados[x][4]) + '/'
	next
else
	_aDados := FWGetSX5( _cTabela, _cChave )
	if empty(_aDados)
		return ""
	Endif
	_cDescricao := _aDados[1][4]
endif

Return _cDescricao
