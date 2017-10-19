#INCLUDE "TOTVS.CH"
 
User Function GetExtension()

Local _aEstru

/*
Tag #OrdBagExt
*/

/* Retorna a extensao do arquivo de indice baseado no RDD utilizado pelo dicionario da dados 

por ex 
RDD DBFCDX/DBFCDXAX  Retorno --> .IDX
RDD CTREE   Retorno --> .IDX


Uso mais comum
*/
DbSelectArea("SA2")
_aEstru := DbStruct()  // Traz a estrutura do arquivo e aloca na matriz _aEstru

//
// Cria um arquivo na pasta system ou sigaadv conforme 
//
cArquivo := CriaTrab(_aEstru,.t.)  // Cria um arquivo na pasta /sigaadv oy system   

ferase(cArquvivo+GetExtension())   //

// equivale ao comando

ferase("sc090290.cdx")   // para dbf/ads
ferase("sc090290.dtc")   // para ctree


return  
/*
veja o comando  IndexExt()
*/

