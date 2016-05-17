#Include 'Protheus.ch'

// ############################################################################################
// Modulo : SigaEst
// Fonte  : RecEmail.prw
// -------------+-------------------+-----------------------------------------------------------
// Data     	| Autor             | Descricao
// -------------+-------------------+-----------------------------------------------------------
// 22/07/15 	| Rafael Pucci		| Rotina responsável por recuperar o e-mail do usuário 
//				|					| cadastrado no PROTHEUS
// -------------+-------------------+-----------------------------------------------------------
//	Parametro	| cCod				| Código do usuário cadastrado no PROTHEUS
// -------------+-------------------+-----------------------------------------------------------

User Function RecEmail(cCod)
Local cEmail := ""

PswOrder(1) 
If PswSeek(cCod)
   cEmail := Upper(AllTrim(PswRet(1)[1][14]))
EndIf 

Return cEmail
