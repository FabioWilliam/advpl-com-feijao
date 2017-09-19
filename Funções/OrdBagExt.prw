#INCLUDE "TOTVS.CH"
 
User Function OrdBagExt()

/*
Tag #OrdBagExt
*/

/* Retorna a extensao do arquivo de indice baseado no RDD utilizado pelo dicionario da dados 

por ex 
RDD DBFCDX/DBFCDXAX  Retorno --> .IDX
RDD CTREE   Retorno --> .IDX


Uso mais comum
*/
cArquivo := CriaTrab(nil,.f.)  // Nome gerado aleatoriamente sc090290.dbf 
ferase(cArquvivo+OrdBagExt())
// equivale ao comando

ferase("sc090290.idx")   // para dbf/ads
ferase("sc090290.idx")   // para ctree

return  
/*
veja o comando  IndexExt()
*/

