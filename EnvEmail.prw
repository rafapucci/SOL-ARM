#Include 'Protheus.ch'
#include 'ap5mail.ch'

// #############################################################################################
// Modulo : SigaEst
// Fonte  : EnvEmail.prw
// -------------+-------------------+-----------------------------------------------------------
// Data     	| Autor             | Descricao
// -------------+-------------------+-----------------------------------------------------------
// 22/07/15 	| Rafael Pucci		| Rotina responsável por enviar e-mails a partir do PROTHEUS 
// -------------+-------------------+-----------------------------------------------------------
//	Parametro	| cDe				| E-mail do rementente
//	Parametro	| cPara				| E-mail do destinatário
//	Parametro	| cCC				| E-mail com cópia
//	Parametro	| cCO				| E-mail com cópia oculta
//	Parametro	| cAssunto			| Assunto do e-mail
//	Parametro	| cMsg				| Conteúdo da mensagem do e-mail
// -------------+-------------------+-----------------------------------------------------------

User Function EnvEmail(cDe,cPara,cCC,cCO,cAssunto,cMsg)
    Local lResulConn := .T.
    Local lResulSend := .T.
    Local cError     := ""   
    Local cRet       := ""
    Local _cServidor := GetMV("MV_WFSMTP")                                         
    Local _cUsuario  := GetMV("MV_WFMAIL")
    Local _cSenha    := GetMV("MV_WFPASSW") 
    
    lResulConn := MailSmtpOn( _cServidor , _cUsuario, _cSenha)
    If !lResulConn
        cError := MailGetErr()
        cRet := "Falha na conexao: " + cError
        Return(cRet)
    EndIf

    SEND MAIL FROM cDe TO cPara CC cCC BCC cCO SUBJECT cAssunto BODY cMsg FORMAT TEXT RESULT lResulSend
    
    If !lResulSend
        cRet:= "Falha no envio!"
    Else
        cRet:= "E-mail enviado com sucesso!"
    EndIf

Return cRet
