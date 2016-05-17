#include 'Protheus.ch'
#include 'Topconn.ch'

// ############################################################################################
// Modulo : SigaEst
// Fonte  : RecValorMovi.prw
// -------------+-------------------+-----------------------------------------------------------
// Data     	| Autor             | Descricao
// -------------+-------------------+-----------------------------------------------------------
// 29/09/15 	| Rafael Pucci		| Rotina responsável por último valor de compra do produto
// -------------+-------------------+-----------------------------------------------------------
//	Parametro	| cCod				| Código do produto cadastrado no PROTHEUS
// -------------+-------------------+-----------------------------------------------------------

User Function RecValorMovi(cCod)

Local cQuery := ""
Local cValor := ""
Default cCod := "1"

	cQuery += "SELECT B1_UPRC "
	cQuery += "FROM " + RetSqlName("SB1") + " SB1 "
	cQuery += "WHERE B1_COD = '" + AllTrim(cCod) + "' "
	
	If Select("MOVI") > 0
   		MOVI->(DbCloseArea())
	EndIF

	TCQUERY cQuery NEW ALIAS "MOVI"
	MOVI->(DBGotop())
	
	Do While MOVI->(!EOF())
		cValor := MOVI->B1_UPRC
	EndDo
	MOVI->(DBCloseArea())
	
Return cValor