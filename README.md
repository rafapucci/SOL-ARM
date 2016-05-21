# SOL-ARM
Ponto de entrada para envio de e-mail na baixa de uma Solicitação ao Armazém (SA) para o ERP TOTVS Protheus.
Os e-mails são enviados para duas pessoas configuradas no cadastro do Centro de Custo do item que foi baixado.

Exemplo de e-mail recebido:

![Exemplo de e-mail](https://cloud.githubusercontent.com/assets/2446399/15449850/beeafb62-1f5f-11e6-8140-24c5937a6637.jpg)


####Fontes
  * **M185GRV.prw**: Ponto de entrada ativado na baixa de uma SA.
  * **RecEmail.prw**: Rotina responsável por recuperar o e-mail do usuário cadastrado no Protheus.
  * **RecValorMovi.prw**: Rotina responsável por recuperar o último valor de compra do produto baixado na SA.
  * **EnvEmail.prw**: Rotina responsável por enviar os e-mails.
  
####Lista de tabelas envolvidas
  * **CTT** - Centros de custo
  * **SRA** - Funcionários
  * **SB1** - Descrição genérica de produto
  * **SCP** - Solicitações ao armazém
