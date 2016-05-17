#include 'Protheus.ch'
#include 'Topconn.ch'

// ############################################################################################
// Modulo : SigaEst
// Fonte  : M185GRV.prw
// -------------+-------------------+-----------------------------------------------------------
// Data     	| Autor             | Descricao
// -------------+-------------------+-----------------------------------------------------------
// 22/07/15 	| Rafael Pucci		| Ponto de entrada ativado no momento da baixa da SA
// -------------+-------------------+-----------------------------------------------------------

User Function M185GRV()

Local cQuery 	:= ""
Local cNum		:= ""
Local cHTML 	:= ""
Local cCabec 	:= ""
Local cRodap 	:= ""
Local cCC 		:= ""

DbSelectArea("SCP")
cNum := SCP->CP_NUM
cItem := SCP->CP_ITEM

cQuery += "SELECT CP_NUM, CP_ITEM, CP_QUANT, CP_CC, CP_PRODUTO, CP_SOLICIT, CP_MAT "
cQuery += "FROM " + RetSqlName("SCP") + " SCP "
cQuery += "WHERE CP_NUM = '" + cNum + "' AND CP_ITEM = '" + cItem + "' ORDER BY CP_CC" 

TCQUERY cQuery NEW ALIAS "BAIXA"
BAIXA->(DBGotop())

    cCabec +='<META http-equiv=Content-Type content="text/html; charset=windows-1252">'
    cCabec +='<BODY>'
    cCabec +='<img src=http://intranet/images/cabecalho.jpg>'
    cCabec +='<p>'
    cCabec +='<Font face="calibri"><b>Número da SA:</b> ' + SCP->CP_NUM

    cRodap +='</p><br>'
    cRodap +='_________________________________________________________'
    cRodap +='<br><font size="1" color="#FF0000">E-mail enviado automaticamente pelo sistema <b>PROTHEUS</b>'
    cRodap +='</BODY></HTML>'

    cHTML := ""
    cCC := BAIXA->CP_CC //Captura o centro de custo

Do While BAIXA->(!EOF())

    cHTML+='<br><br><Font face="calibri"><b>Item da SA:</b> ' + BAIXA->CP_ITEM
    cHTML+='<br><Font face="calibri"><b>Descrição do item:</b> ' + POSICIONE("SB1", 1, xFilial("SB1") + BAIXA->CP_PRODUTO, "B1_DESC")
    cHTML+='<br><Font face="calibri"><b>Custo:</b> ' + Transform(U_RecValorMovi(BAIXA->CP_PRODUTO),"@E 999,999.99")
    cHTML+='<br><Font face="calibri"><b>Quantidade:</b> ' + Str(BAIXA->CP_QUANT)
    cHTML+='<br><Font face="calibri"><b>Centro de custo:</b> ' + BAIXA->CP_CC
    cHTML+='<br><Font face="calibri"><b>Usuário solicitante:</b> ' + BAIXA->CP_SOLICIT
    cHTML+='<br><Font face="calibri"><b>Matrícula utilizada:</b> ' + BAIXA->CP_MAT + ' - ' + POSICIONE("SRA", 1, xFilial("SRA") + BAIXA->CP_MAT, "RA_NOME")

BAIXA->(DBSkip())
    If cCC <> BAIXA->CP_CC
      cHTML := cCabec+cHTML+cRodap
      u_EnvEmail("protheus@localhost",U_RecEmail(POSICIONE("CTT", 1, xFilial("CTT") + cCC, "CTT_MAT")),U_RecEmail(POSICIONE("CTT", 1, xFilial("CTT") + cCC, "CTT_MAT2")),"","Solicitação N°: " + SCP->CP_NUM,cHTML)
      cCC := BAIXA->CP_CC
      cHTML := ""
   EndIf
EndDo
    
BAIXA->(DBCloseArea())

Return 