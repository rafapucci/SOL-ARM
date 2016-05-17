#Include 'Protheus.ch'

// ############################################################################################
// Modulo : SigaEst
// Fonte  : RecEmail.prw
// -------------+-------------------+-----------------------------------------------------------
// Data     	| Autor             | Descricao
// -------------+-------------------+-----------------------------------------------------------
// 22/07/15 	| Rafael Pucci		| Rotina respons�vel por recuperar o e-mail do usu�rio 
//				|					| cadastrado no PROTHEUS
// -------------+-------------------+-----------------------------------------------------------
//	Parametro	| cCod				| C�digo do usu�rio cadastrado no PROTHEUS
// -------------+-------------------+-----------------------------------------------------------

User Function RecEmail(cCod)
Local cEmail := ""

PswOrder(1) 
If PswSeek(cCod)
   cEmail := Upper(AllTrim(PswRet(1)[1][14]))
EndIf 

Return cEmail
