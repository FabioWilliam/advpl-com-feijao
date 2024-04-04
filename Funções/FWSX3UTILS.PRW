#INCLUDE "rwmake.ch"        // Ajustado
#INCLUDE "ed3.ch"
#INCLUDE "protheus.ch"

/*/{Protheus.doc} getheader
	Esta funcão retorna o Aheader do dicionario usando
	sem acesso direto ao dicionario
	@type  Function
	@author Fábio William
	@since 11/10/2023
	@version 1.0
	@param _cAlias, String, Alias que será coletado o Aheader
	@param _cCampos, String, Campos que se deseja coletar o aheader, separados por /
	@param _cNaoIncluir, String, Campos que se deseja não coletar o aheader, separados por /
	@param _lTodosCposdoBrowse, Logical, Determina se coleta todos os campos ou somente os do browse
	@param _lNaoUsados, Logical, Determina se coleta todos os campos ou somente os do browse
	@param cNivel, String, Nivel do Usuário
	@return _aHeader, Array, Conteudo do sx3 em formato para modelo3
	@example
	(examples)
	@see (links_or_references)
	/*/

user function getheader(_cAlias, _cCampos, _cNaoIncluir, _lTodosCposdoBrowse, _lNaoUsados, cNivel )
LOCAL 	_aHeader := {}
LOCAL 	i := 1
DEFAULT _cCampos := ""
DEFAULT _cNaoIncluir := ""
DEFAULT _lTodosCposdoBrowse = .f.
DEFAULT _lNaoUsados := .f.
DEFAULT cNivel := cNivel

_aCpoSX3 := FwSX3Util():GetAllFields(_cAlias)

For i := 1 To Len(_aCpoSX3)

	IF _cCampos = "" .OR. AllTrim(GetSx3Cache(_aCpoSX3[i], 'X3_CAMPO')) $ _cCampos 
		IF X3Uso(GetSx3Cache(_aCpoSX3[i], 'X3_USADO')) .or. _lNaoUsados
			IF  !(AllTrim(GetSx3Cache(_aCpoSX3[i], 'X3_CAMPO')) $ _cNaoIncluir)
				IF _lTodosCposdoBrowse .or. AllTrim(GetSx3Cache(_aCpoSX3[i], 'X3_BROWSE')) = 'S'
					aAdd(_aHeader, {AllTrim(GetSx3Cache(_aCpoSX3[i], 'X3_TITULO')),;
						AllTrim(GetSx3Cache(_aCpoSX3[i], 'X3_CAMPO')),;
						GetSx3Cache(_aCpoSX3[i], 'X3_PICTURE'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_TAMANHO'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_DECIMAL'),;
						"AllWaysTrue()",;
						GetSx3Cache(_aCpoSX3[i], 'X3_USADO'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_TIPO'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_F3'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_CONTEXT'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_CBOX'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_RELACAO'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_WHEN'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_VISUAL'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_VLDUSER'),;
						GetSx3Cache(_aCpoSX3[i], 'X3_PICTVAR'),;
						If(GetSx3Cache(_aCpoSX3[i], 'X3_OBRIGAT') == "€", .T., .F.)} )
				ENDIF
			ENDIF
		ENDIF
    Endif
NEXT
return(_aHeader)
