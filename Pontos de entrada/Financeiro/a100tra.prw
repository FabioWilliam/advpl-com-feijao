#include "rwmake.ch"        // Ajustado
#include "ed3.ch"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³A100TRA  ºAutor  ³Fabio William        º Data ³  16/08/2017 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Atualiza a conta Credido e Debito do Lancamento     a      º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ Especifico Cliente                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
/*
  Ponto de entrada que grava os campos E5_DEBITO E E5_CREDITO com o conteudo
  do campo A6_CONTA
*/
  
/*
TAGS 
#FINA100
#A100TRA
*/
User function A100TRA()

local cDebito   := ""
local cCredido 	:= ""
Local _aArea 	:= GetArea()  		// Salva a Area Corrente do Programa
Local _aAreaSA6	:= SA6->(GetArea())	// Salva a Area do Arquivo de bancos
Local _aParam 	:= paramixb			// Parametros vindos do fontes
Local _lEst  	:= paramixb[1]		// Estorno 
Local _cBOrig 	:= paramixb[2]
Local _cBDest	:= paramixb[3]
Local _cAgOrig 	:= paramixb[4]
Local _cAgDest	:= paramixb[5]
Local _cCtOrig	:= paramixb[6]
Local _cCtDest	:= paramixb[7]
Local _cNatOri	:= paramixb[8]
Local _cNatrDes	:= paramixb[9]
Local _cDoc		:= paramixb[10]
Local _cHist	:= paramixb[11]

//
// Traz a cpmta comtabil do banco pagar
//
DbSelectArea("SA6") 
DbSeek(xFilial()+_cBOrig+_cAgOrig+_cCtOrig  )
cCredito := SA6->A6_CONTA  		

//
// Traz a cpmta comtabil do banco Receber
//
DbSelectArea("SA6") 
DbSeek(xFilial()+_cBDest+_cAgDest+_cCtDest  )
cDebito:= SA6->A6_CONTA

//
// Atualiza a conta Credito e Debito do SE5
//
RecLock("SE5",.F.)
SE5->E5_CREDITO :=cCredito
SE5->E5_DEBITO := cDebito
msunlock() 

RestArea(_aAreaSA6)	
RestArea(_aArea) 

Return
