algoritmo "Projeto Final 2021-Quarteto fantastico"
//MATHEUS JOAQUIM BALAN RA:21110925-2
//MARIA EDUARDA DUTRA SANCHES RA:21174887-2
//GUILHERME RICARDO HOREMBALA PUPIM RA:21109533-2
//CAROLINA SATO RA:21109579-2
var

x,y,total_clientes,total_parcelas:inteiro
linha,op1,op2,op3,op4,op5:caracter
parcela_importada,clientes_importado:logico

Codigo_Cliente:VETOR[1..160] de caracter
Nome:VETOR[1..160] de caracter
Cidade:VETOR[1..160] de caracter
Estado:VETOR[1..160] de caracter
CPF_CNPJ:VETOR[1..160] de caracter
Status_Cliente:VETOR[1..160] de logico

Codigo_parcela:VETOR[1..90] de caracter
Cod_Clie_Parcela:VETOR[1..90] de caracter
Data_Venci:VETOR[1..90] de caracter
Data_Recebido:VETOR[1..90] de caracter
Banco:VETOR[1..90] de caracter
Valor:VETOR[1..90] de real
Status_Parcela:VETOR[1..90] de logico

CodBan:VETOR[1..15] de caracter
NomBan:Vetor[1..15] de caracter
//------------------------------------------------------------------------------
Funcao Copi_Arq (var c:inteiro):caracter
var
a,b:caracter
inicio
a:=""
b:=copia(linha,c,1)
Enquanto (asc(b)<>34) faca
   a:=a+b
   c:=c+1
   b:=copia(linha,c,1)
fimenquanto
c:=c+3
retorne a
fimfuncao
//-----------------------------------------------
funcao Confirmacao(S:caractere):caractere
var
res:caractere
inicio
escreva(s)
leia(res)
retorne res
fimfuncao
//-----------------------------------------------------------------------------------------------
funcao Busca_cliente (cod:caractere): inteiro
var
posvet:inteiro

inicio
posvet<-0
repita
   posvet<-posvet+1
ate (posvet>=total_clientes) ou ((cod=Codigo_Cliente[posvet]) e (Status_Cliente[posvet]=verdadeiro))
se (cod=Codigo_Cliente[posvet]) e (Status_Cliente[posvet]=verdadeiro) entao
   retorne posvet
senao
   retorne 0
fimse
fimfuncao
//------------------------------------------------------------------------------------------------
funcao buscar_parcela(par:caracter):inteiro
var
PosiVetor:inteiro
inicio
PosiVetor:=0
Repita
   PosiVetor:=PosiVetor+1
Ate (PosiVetor>=total_parcelas) ou ((par=Codigo_parcela[PosiVetor]) e (Status_Parcela[PosiVetor]=verdadeiro))
Se (par=Codigo_parcela[PosiVetor]) e (Status_Parcela[PosiVetor]=verdadeiro) ENTAO
   retorne PosiVetor
SENAO
   retorne 0
fimse
fimfuncao
//------------------------------------------------------------------------------
procedimento Mostra_cliente(x:inteiro)
inicio
escreval("Nome: ", Nome[x])
escreval("Cidade: ", Cidade[x])
escreval("UF: ", Estado[x])
escreval("CPF/CNPJ: ", CPF_CNPJ[x])
fimprocedimento
//------------------------------------------------------------------------------
Procedimento Mostra_Parcela(p:inteiro)
inicio
Escreval("Código Cliente: ",Cod_Clie_Parcela[p])
Escreval("Nome Cliente: ",Nome[Busca_cliente(Cod_Clie_Parcela[p])])
Escreval("Banco: ",NomBan[buscar_banco(Banco[p])])
Escreval("Valor: ",Valor[p]:1:2)
Escreval("Data Vencimento: ",Data_Venci[p])
Escreval("Data Recebimento: ",Data_Recebido[p])
Escreval
fimprocedimento
//------------------------------------------------------------------------------
Procedimento Mostra_Bancos
inicio
limpatela
Escreval("-----------Bancos-----------")
Escreval
Para x de 1 ate 10 faca
   Se CodBan[x]<>"" entao
      Escreval(CodBan[x]:3," ",NomBan[x])
   fimse
fimpara
Escreval("---------------------------------------------------------------")
continua("Pressione < ENTER > para retornar ao Menu",verdadeiro,verdadeiro)
fimprocedimento
//------------------------------------------------------------------------------
Procedimento continua(frase:caracter; espera:logico; limpa:logico)
var
parada:caracter
inicio
Escreva(frase)
Se espera ENTAO
   leia(parada)
fimse
se limpa ENTAO
   limpatela
fimse
fimprocedimento
//------------------------------------------------------------------------------
procedimento Org_Vetores_Clientes (R1,R2:inteiro)
var
Trq:caracter
TrqL:Logico
inicio
Trq:=Codigo_Cliente[R1]
Codigo_Cliente[R1]:=Codigo_Cliente[R2]
Codigo_Cliente[R2]:=Trq

Trq:=Nome[R1]
Nome[R1]:=Nome[R2]
Nome[R2]:=Trq

Trq:=Cidade[R1]
Cidade[R1]:=Cidade[R2]
Cidade[R2]:=Trq

Trq:=Estado[R1]
Estado[R1]:=Estado[R2]
Estado[R2]:=Trq

Trq:=CPF_CNPJ[R1]
CPF_CNPJ[R1]:=CPF_CNPJ[R2]
CPF_CNPJ[R2]:=Trq

TrqL:=Status_Cliente[R1]
Status_Cliente[R1]:=Status_Cliente[R2]
Status_Cliente[R2]:=TrqL

fimprocedimento
//---------------------------------------------
procedimento Org_Vetores_Parcelas (R1,R2:inteiro)
var
Trq:caracter
TrqR:real
TrqB:logico
inicio
Trq:=Codigo_parcela[R1]
Codigo_parcela[R1]:=Codigo_parcela[R2]
Codigo_parcela[R2]:=Trq

Trq:=Cod_Clie_Parcela[R1]
Cod_Clie_Parcela[R1]:=Cod_Clie_Parcela[R2]
Cod_Clie_Parcela[R2]:=Trq

Trq:=Data_Venci[R1]
Data_Venci[R1]:=Data_Venci[R2]
Data_Venci[R2]:=Trq

Trq:=Data_Recebido[R1]
Data_Recebido[R1]:=Data_Recebido[R2]
Data_Recebido[R2]:=Trq

Trq:=Banco[R1]
Banco[R1]:=Banco[R2]
Banco[R2]:=Trq

TrqR:=Valor[R1]
Valor[R1]:=Valor[R2]
Valor[R2]:=TrqR

TrqB:=Status_Parcela[R1]
Status_Parcela[R1]:=Status_Parcela[R2]
Status_Parcela[R2]:=TrqB

fimprocedimento
//------------------------------------------
procedimento Ler_Clientes
arquivo "CLIENTES.TXT"
var
Coluna:inteiro
L:caracter
inicio
para x de 1 ate 147  faca
   leia(linha)
   Coluna:=2
   total_clientes:=total_clientes+1
   Codigo_Cliente[x]:=Copi_Arq(Coluna)
   Nome[x]:=Copi_Arq(Coluna)
   Cidade[x]:=Copi_Arq(Coluna)
   Estado[x]:=Copi_Arq(Coluna)
   L:=Copi_Arq(Coluna)
   L:=Copi_Arq(Coluna)
   L:=Copi_Arq(Coluna)
   CPF_CNPJ[x]:=Copi_Arq(Coluna)
   Status_cliente[x]<-verdadeiro
fimpara
clientes_importado:=verdadeiro
fimprocedimento
//---------------------------------------------
Procedimento Ler_Parcelas
arquivo "PARCELAS.TXT"
var
Coluna:inteiro
y:caracter
inicio
para x de 1 ate 76 faca
   leia(linha)
   Coluna:=2
   total_parcelas:=total_parcelas+1
   Codigo_Parcela[x]:=Copi_Arq(Coluna)
   Cod_Clie_Parcela[x]:=Copi_Arq(Coluna)
   Data_Venci[x]:=Copi_Arq(Coluna)
   Data_Recebido[x]:=Copi_Arq(Coluna)
   y:=Copi_Arq(Coluna)
   Valor[x]:=caracpnum(y)
   Banco[x]:=Copi_Arq(Coluna)
   Status_Parcela[x]<-verdadeiro
fimpara
parcela_importada:=verdadeiro
fimprocedimento
//------------------------------------------------------------------------------
Procedimento Carrega_Banco
inicio
CodBan[1]:="0"
NomBan[1]:="Carteira               "
CodBan[2]:="001"
NomBan[2]:="Banco do Brasil        "
CodBan[3]:="237"
NomBan[3]:="Bradesco               "
CodBan[4]:="104"
NomBan[4]:="Caixa Econômica Federal"
CodBan[5]:="341"
NomBan[5]:="Itau                   "
CodBan[6]:="260"
NomBan[6]:="Nubank                 "
fimprocedimento

//-------------------------------------------------------------
Procedimento Menu_principal
inicio
Repita
   limpatela
   Escreval("-----------Menu principal-----------")
   Escreval
   Escreval("1 - Cliente")
   Escreval("2 - Parcelas")
   Escreval("3 - Consultas")
   Escreval("4 - Importar Parcelas e Clientes")
   Escreval("5 - Creditos ")
   Escreval("6 - Fim ")
   Escreval
   Escreva("Escolha uma opcao: ")
   Leia(op1)
   Escolha op1
   Caso("1")
      menu_clientes
   Caso("2")
      menu_parcelas
   Caso("3")
      menu_consultas
   Caso("4")
      Se (clientes_importado=verdadeiro) e (parcela_importada=verdadeiro) ENTAO
         continua("ATENÇÃO: Arquivos já importados",verdadeiro,verdadeiro)
      SENAO
         Se clientes_importado=falso ENTAO
            Ler_Clientes
         fimse
         Se parcela_importada=falso ENTAO
            Ler_Parcelas
         fimse
      fimse
   Caso("5")
      menu_creditos
   fimescolha
ate (op1="6")
fimprocedimento
//------------------------------------------------------------------------------
Procedimento menu_clientes
inicio
Repita
   limpatela
   Escreval("-----------Menu Clientes-----------")
   Escreval
   Escreval("1 - Importar")
   Escreval("2 - Classificar por codigo")
   Escreval("3 - Classificar por nome")
   Escreval("4 - Consultar")
   Escreval("5 - Adicionar cliente")
   Escreval("6 - Editar cliente")
   Escreval("7 - Excluir cliente")
   Escreval("8 - Finalizar")
   Escreval
   Escreva("Escolha uma opcao: ")
   leia(op2)
   Escolha op2
   Caso("1")
      Se clientes_importado=falso entao
         Ler_Clientes
      Senao continua("parcela ja importada",verdadeiro,verdadeiro)
      fimse
   Caso("2")
      Classificar_Cod_Cliente
   Caso("3")
      Classificar_Nome_Cliente
   Caso("4")
      Consultar_cliente
   Caso("5")
      add_cliente
   Caso("6")
      edit_cliente
   Caso("7")
      exclir_cliente
   fimescolha
ate op2="8"
fimprocedimento
//------------------------------------------------------------------------------
Procedimento Classificar_Cod_Cliente
Var
y:inteiro
inicio
Se total_clientes=0 entao
   continua("ATENÇÃO: Tabela de Clientes está vazia. Pressione ENTER",verdadeiro,verdadeiro)
fimse
Para x de 1 ate total_clientes-1 faca
   Para y de x+1 ate total_clientes faca
      Se (Codigo_Cliente[y]<Codigo_Cliente[x]) entao
         Org_Vetores_Clientes(y,x)
      fimse
   fimpara
fimpara
fimprocedimento
//------------------------------------------------------------------------------
Procedimento Classificar_Nome_Cliente
Var
y:inteiro
inicio
Se total_clientes=0 entao
   continua("ATENÇÃO: Tabela de Clientes está vazia. Pressione ENTER",verdadeiro,verdadeiro)
fimse
Para x de 1 ate total_clientes-1 faca
   Para y de x+1 ate total_clientes faca
      Se (Nome[y]<Nome[x]) entao
         Org_Vetores_Clientes(y,x)
      fimse
   fimpara
fimpara
fimprocedimento
//------------------------------------------------------------------------------
procedimento Consultar_cliente
var
CodCli:caractere
BCli:inteiro
inicio
limpatela
escreva("-----------Consulta Cliente-----------")
escreval(" ")
escreva("Digite o código do cliente que deseja consultar: ")
leia(CodCli)
BCli<-Busca_cliente(CodCli)
SE BCli<>0 ENTAO
   Mostra_cliente(BCli)
   continua("pressione <enter> para retornar ao menu principal",verdadeiro,verdadeiro)
SENAO
   ESCREVAL("Cliente não existe")
   continua("pressione <enter> para retornar ao menu principal",verdadeiro,verdadeiro)
fimse

fimprocedimento
//------------------------------------------------------------------------------
procedimento add_cliente
var
CodCli, Confirm:caractere
BCod:inteiro
inicio
limpatela
repita
   Escreval("-----------Cadastro de Cliente-----------")
   Escreval(" ")
   Escreva ("Digite o Código do cliente: ")
   leia(CodCli)
   BCod<-Busca_cliente(CodCli)
   se BCod<>0 entao
      Mostra_cliente(BCod)
      escreval("Cliente digitado já existe!")
   fimse
ate (BCod = 0)
total_clientes<-total_clientes+1
Codigo_Cliente[total_clientes]<-CodCli
Escreva("Nome: ")
leia(Nome[total_clientes])
escreva("Cidade: ")
Leia(Cidade[total_clientes])
escreva("Estado(UF): ")
leia(Estado[total_clientes])
escreva("CPF/CNPJ: ")
leia(CPF_CNPJ[total_clientes])
Status_Cliente[total_clientes]<-verdadeiro
Escreval
Confirm<-Confirmacao("Concluiu? (S/N)")
se Confirm<>"S" entao
   total_clientes<-total_clientes-1
fimse
fimprocedimento
//------------------------------------------------------------------------------
procedimento edit_cliente
var
BCod: inteiro
CodCli, opcao:caractere
val:logico
inicio
limpatela
escreva("Digite o código do cliente que pretende alterar: ")
leia(CodCli)
BCod<-Busca_cliente(CodCli)
Mostra_cliente(BCod)
Se BCod<>0 entao
   escreval("QUAL DADO DESEJA ALTERAR?")
   escreval("1. NOME")
   escreval("2. CIDADE")
   ESCREVAL("3. ESTADO")
   ESCREVAL("4. CPF")
   ESCREVAL("5. VOLTAR")
   escreval
   escreval("Digite a sua opção: ")
   leia(opcao)
   Escolha opcao
   caso("1")
      edit_cliente_nome
   caso("2")
      edit_cliente_cidade
   caso("3")
      edit_cliente_estado
   caso("4")
      edit_cliente_cpf_cnpj
   caso("5")
      menu_clientes
   fimescolha
senao
   escreval("Cliente não existe")
fimse
fimprocedimento
//------------------------------------------------------------------------------
procedimento edit_cliente_nome
var
x: inteiro
nome, Nnome:caractere
val:logico
inicio
escreval("Digite o novo nome: ")
leia(nome)
nome[PosiVetor]<-nome
fimprocedimento
//-------------------------------------------------------------
procedimento edit_cliente_cidade
var
cidade:caractere
inicio
escreval("Digite a nova cidade: ")
leia(cidade)
cidade[PosiVetor]<-cidade
fimprocedimento
//-------------------------------------------------------------
procedimento edit_cliente_estado
var
estado:caractere
inicio
escreval("Digite o estado: ")
leia(estado)
estado[PosiVetor]<-estado
fimprocedimento
//-------------------------------------------------------------
procedimento edit_cliente_cpf_cnpj
var
cpf_cnpj
inicio
escreval("Digite o novo CPF ou CNPJ: ")
leia(cpf_cnpj)
CPF_CNPJ[PosiVetor]<-cpf_cnpj
fimprocedimento
//------------------------------------------------------------------------------
procedimento exclir_cliente
var
CodCli, confirm:caractere
BCli:inteiro
inicio
limpatela
escreval("-----------Consulta Cliente-----------")
escreva("Digite o código do cliente que deseja excluir: ")
leia(CodCli)
BCli<-Busca_Cliente(CodCli)
Mostra_cliente(BCli)
confirm<-confirmacao("Deseja excluir este cliente? (S/N)")
se confirm="S" ENTAO
   Status_cliente[BCli]<-falso
fimse
fimprocedimento
//------------------------------------------------------------------------------
Procedimento menu_parcelas
inicio
repita
   limpatela
   Escreval("-----------Menu Parcelas-----------")
   Escreval
   Escreval("1 - Importar")
   Escreval("2 - Classificar por vencimento")
   Escreval("3 - Classificar por numero parcela")
   Escreval("4 - Incluir parcela")
   Escreval("5 - Alterar parcela")
   Escreval("6 - Consultar")
   Escreval("7 - Retornar")
   Escreval
   Escreva("Escolha uma opcao:")
   Leia(op3)
   Escolha op3
   Caso ("1")
      Se parcela_importada=falso entao
         Ler_Parcelas
      Senao continua("parcela ja importada",verdadeiro,verdadeiro)
      fimse
   Caso("2")
      Classificar_data_Venc
   Caso("3")
      Classificar_Cod_Parcela
   Caso("4")
      add_parcela
   Caso("5")
      Alterar_Parcela
   Caso("6")
      Menu_consulta_parcela
   fimescolha
ate (op3=7)
fimprocedimento
//------------------------------------------------------------------------------
procedimento Classificar_data_Venc
var
y:inteiro
datax,datay:caracter
trq:caracter
inicio
Se total_parcelas=0 entao
   continua("ATENÇÃO: Tabela de Parcelas está vazia. Pressione ENTER",verdadeiro,verdadeiro)
fimse
Para x de 1 ate total_parcelas-1 faca
   Para y de x+1 ate total_parcelas faca
      datax:=COPIA(Data_Venci[x],7,2)+COPIA(Data_Venci[x],4,2)+COPIA(Data_Venci[x],1,2)
      datay:=COPIA(Data_Venci[y],7,2)+COPIA(Data_Venci[y],4,2)+COPIA(Data_Venci[y],1,2)
      Se (datay<datax) entao
         Org_Vetores_Clientes(y,x)
      fimse
   fimpara
fimpara

fimprocedimento
//------------------------------------------------------------------------------
procedimento Classificar_Cod_Parcela
Var
Trq:caracter
y:inteiro
inicio
Se total_parcelas=0 entao
   continua("ATENÇÃO: Tabela de Parcelas está vazia. Pressione ENTER",verdadeiro,verdadeiro)
fimse
Para x de 1 ate total_parcelas-1 faca
   Para y de x+1 ate total_parcelas faca
      Se (Codigo_parcela[y]<Codigo_parcela[x]) entao
         Org_Vetores_Clientes(y,x)
      fimse
   fimpara
fimpara
fimprocedimento
//------------------------------------------------------------------------------
Procedimento add_parcela
var
CodCli,CodPar,Codban,tmp,confirma:caracter
iBan,iCli,iPar:inteiro
inicio
Se (Total_Clientes>0) ENTAO
   limpatela
   Repita
      limpatela
      Escreval("-----------Cadastro de Parcela-----------")
      Escreval
      Escreva ("Informe o Código da parcela: ")
      Leia(Codpar)
      ipar:=buscar_parcela(Codpar)
      Se (ipar<>0) ENTAO
         Mostra_Parcela(ipar)
         continua("Parcela já existente. Pressione < ENTER >",verdadeiro,verdadeiro)
      fimse
   Ate (iPar=0)
   Total_Parcelas:=Total_Parcelas+1
   Codigo_parcela[total_parcelas]:=Codpar
   Repita
      limpatela
      Escreval  ("-----------Cadastro de Parcela-----------")
      Escreval
      Escreval  ("Parcela: ",Codpar)
      Escreva  ("Informe o Código do Cliente: ")
      Leia(Codcli)
      Icli:=Busca_cliente(Codcli)
      Se (iCli<>0) ENTAO
         Mostra_cliente(icli)
      fimse
   Ate (iCli<>0)
   Cod_Clie_Parcela[total_parcelas]:=Codcli
   Escreva ("Informe qual o Banco do cliente: ")
   Leia(Codban)
   iBan:=buscar_banco(Codban)
   Se (iBan<>0) ENTAO
      Escreval("Banco: ",NomBan[iBan])
      Banco[total_parcelas]:=Codban
   fimse

   Escreva ("Valor da parcela: ")
   Leia(tmp)
   Valor[total_parcelas]:=caracpnum(tmp)
   Escreva ("Data do Vencimento: ")
   Leia(Data_Venci[total_parcelas])
   Escreva ("Data do Pagamento: ")
   Leia(Data_Recebido[total_parcelas])

   Status_Parcela[total_parcelas]:=verdadeiro
   Escreval
   confirma:=Confirmacao("Confirma inclusão? (S/N) ")
   Se confirma<>"S" ENTAO
      total_clientes:=total_clientes-1
   fimse
SENAO
   continua("ATENÇÃO: Tabela de Clientes está vazio. Pressione < ENTER >",verdadeiro,verdadeiro)
fimse
fimprocedimento
//------------------------------------------------------------------------------
Procedimento Alterar_Parcela
Var
N,tmp,op,CPar,confirma: caracter
Iban,ICli,Ipar: inteiro
v: real
r: logico
inicio
Se (Total_Parcelas>0) e (Total_Clientes>0) ENTAO
   Repita
      limpatela
      Escreval("-----------Alteração de Parcela-----------")
      Escreval
      Escreva ("informe o código da parcela: ")
      Leia(Cpar)
      Ipar:=buscar_parcela(Cpar)
      Se (ipar=0) e (Cpar<>"") ENTAO
         continua("ERRO! Parcela Inexistente. Pressione < ENTER > para voltar",verdadeiro,verdadeiro)
      fimse
   Ate (Ipar<>0) ou (Cpar="")
   Se (Cpar<>"") ENTAO
      Icli:=Busca_cliente(Cod_Clie_Parcela[Ipar])]
      Mostra_Parcela(Ipar)
      Repita
         Escreval
         Escreval("1 - Alterar Cliente")
         Escreval("2 - Alterar Banco")
         Escreval("3 - Alterar Valor")
         Escreval("4 - Alterar Data Vencimento")
         Escreval("5 - Lançar Recebimento")
         Escreval("6 - Excluir")
         Escreval("9 - Retornar")
         Escreval
         Escreva("Opção: ")
         Leia(op)
         Escreval
         Escolha op
         caso "1"
            Escreva ("Informe o novo Cliente: ")
            Leia(tmp)
            iCli:=Busca_cliente(tmp)
            Se (iCli<>0) ENTAO
               Escreval(Nome[iCli])
               confirma:=confirmacao("Confirma Alteração (S/N)? ")
               Se confirma="S" ENTAO
                  Cod_Clie_Parcela[Ipar]:=tmp
               fimse
            SENAO
               continua("Cliente inexistente. Pressione < ENTER >",verdadeiro,verdadeiro)
            fimse
         caso "2"
            op:="9"
            Escreva ("Informe o novo Banco: ")
            Leia(tmp)
            iBan:=Buscar_banco(tmp)
            Se (iBan<>0) ENTAO
               Escreval(NomBan[iBan])
               confirma:=confirmacao("Confirma Alteração (S/N)? ")
               Se confirma="S" ENTAO
                  Banco[iPar]:=tmp
               fimse
            SENAO
               continua("Banco inexistente. Pressione < ENTER >",verdadeiro,verdadeiro)
            fimse
         caso "3"
            Escreva ("Informe o novo Valor: ")
            Leia(v)
            Escreval
            confirma:=confirmacao("Confirma Alteração (S/N)? ")
            Se confirma="S" ENTAO
               valor[iPar]:=v
            fimse
         caso "4"
            Repita
               Escreva ("Informe a Data de Vencimento: ")
               Leia(tmp)
               r:=valida_data(tmp)
               Se (r=falso) entao
                  continua("Data inválida. Informe outra no formato DD/MM/AA",falso,falso)
               fimse
            Ate r=verdadeiro
            Escreval
            confirma:=confirma("Confirma Alteração (S/N)? ")
            Se confirma="S" ENTAO
               Venpar[iPar]:=tmp
            fimse
         caso "5"
            Escreva ("Informe a Data de Recebimento: ")
            Leia(tmp)
            Repita
               r:=valida_data(tmp)
               Se (r=falso) entao
                  continua("Data inválida. Informe outra no formato DD/MM/AA",falso,falso)
               fimse
            Ate r=verdadeiro
            Escreval
            confirma:=confirmacao("Confirma Recebimento (S/N)? ")
            Se confirma="S" ENTAO
               Data_Recebido[iPar]:=tmp
            fimse
         caso "6"
            confirma:=confirmacao("Confirma Exclusão (S/N)? ")
            Se confirma="S" ENTAO
               status_parcela[iPar]:=falso
            fimse
         fimescolha
      Ate (op>="1") e (op<="9")
   fimse
SENAO
   continua("ATENÇÃO: Tabela(s) de Parcelas e/ou Clientes vazio(s). Pressione < ENTER >",verdadeiro,verdadeiro)
fimse
fimprocedimento
//------------------------------------------------------------------------------
Procedimento consulta_Parcela_Geral
var
cli,Ncli,ban,Nban,tip,ordem:caracter
mostra:logico
Iban,iCli,lin:inteiro
total:real
inicio
Se (total_clientes>0) E (total_parcelas>0) ENTAO
   Repita
      limpatela
      lin:=0
      total:=0
      Escreval("-----------Busca Detalhada-----------")
      Escreval
      Escreva("Informe o código do cliente? <ENTER> para todos: ")
      Leia(cli)
      iCli:=Busca_Cliente(cli)
      Se (iCli=0) e (cli<>"") ENTAO
         continua("Cliente não existe! Pressione < ENTER > para voltar",verdadeiro,verdadeiro)
      fimse
   Ate (iCli<>0) ou (cli="")
   Se cli="" ENTAO
      Ncli:="Todos"
   SENAO
      Ncli:=Nome[iCli])
   fimse
   Escreval(Ncli)
   Repita
      Escreva("Informe o Código do Banco ou <ENTER> para todos: ")
      Leia(ban)
      iBan:=buscar_banco(ban)
      se ban="" ENTAO
         Nban:="Todos"
      SENAO
         Nban:=Nomban[Iban]
      fimse
   Ate (iBan<>0) ou (ban="")

   escreval(Nban)
   Repita
      Escreva("Mostrar parcelas em (A)berto ou (R)ecebidas ou <ENTER> para mostrar todas: ")
      Leia(tip)
   Ate (tip="A") ou (tip="") ou (tip="R")
   Repita
      Escreva("Mostrar por ordem de (1)-Parcela  (2)-Vencimento): ")
      Leia(ordem)
   Ate (ordem="1") ou (ordem="2") ou (ordem="")
   Se ordem="" ENTAO
      ordem:="2"
   fimse
   classifica_parcela(ordem)
   limpatela
   para x de 1 ate Total_Parcelas faca
      mostra:=verdadeiro
      se (Ncli<>"Todos") e (cli<>Cod_Clie_Parcela[x]) ENTAO
         mostra:=falso
      fimse

      se (Nban<>"Todos") e (ban<>banco[x]) ENTAO
         mostra:=falso
      fimse

      se (tip="A") e (Data_Recebido[x]<>"") ENTAO
         mostra:=falso
      fimse

      se (tip="R") e (Data_Recebido[x]="") ENTAO
         mostra:=falso
      fimse

      Se (mostra) e (status_parcela[x]=verdadeiro) ENTAO
         Se (lin=0) ENTAO
            continua("PARCELA    VENC.   RECEB.     VALOR  BAN    COD CLIENTE" ,falso,falso)
            continua("____________________________________________________________________",falso,falso)
            Escreval
         fimse
         Escreval(Codigo_Parcela[x]:7," ",Data_Venci[x]:8," ",Data_Recebido[x]:8," ",valor[x]:9:2,"  ",banco[x]:3,"   ",Cod_Clie_Parcela[x]," ",Nome[Busca_cliente(Cod_Clie_Parcela[x])])
         lin:=lin+1
         total:=total+valor[x]
         Se lin=21 ENTAO
            continua("____________________________________________________________________",falso,falso)
            continua("< Pressione < ENTER > para continuar >",verdadeiro,verdadeiro)
            lin:=0
         fimse
      fimse
   fimpara
   continua("____________________________________________________________________",falso,falso)
   Escreval("         T O T A L .....: ",total:9:2)
   continua("Pressione <ENTER> para retornar ao Menu.",verdadeiro,verdadeiro)
SENAO
   continua("ERRO: Tabela de Parcelas não carregada. Pressione < ENTER > para voltar",verdadeiro,verdadeiro)
fimse
fimprocedimento
//------------------------------------------------------------------------------
Procedimento Resumo_Parcelas
var
parada:caracter
v1,v2:vetor[1..10] de real
t1,t2:real
inicio

Se (total_parcelas>0) ENTAO
   limpatela
   Escreval("-----------Resumo Parcelas por Banco-----------")
   Escreval
   continua("COD BANCO                      EM ABERTO   RECEBIDO      TOTAL" ,falso,falso)
   continua("____________________________________________________________________",falso,falso)
   Escreval
   para x de 1 ate total_parcelas faca
      Para y de 1 ate 6 faca
         Se (Banco[x]=CodBan[y]) e (status_parcela[x]=verdadeiro) ENTAO
            Se (Data_Recebido[x]="") ENTAO
               v1[y]:=v1[y]+valor[x]
               t1:=t1+valor[x]
            SENAO
               v2[y]:=v2[y]+valor[x]
               t2:=t2+valor[x]
            fimse
         fimse
      fimpara
   fimpara
   Para y de 1 ate 6 faca
      Escreval(codban[y]:3," ",nomban[y]:25," ",v1[y]:10:2," ",v2[y]:10:2," ",v1[y]+v2[y]:10:2)
   fimpara
   continua("____________________________________________________________________",falso,falso)
   Escreval("           T O T A L  = ",t1:10:2," ",t2:10:2," ",t1+t2:10:2)
   Escreval
   escreval
   continua("Pressione < ENTER > para retornar ao Menu.",verdadeiro,verdadeiro)
SENAO
   continua("ATENÇÃO: Tabela de Parcelas está vazia. Pressione < ENTER >",verdadeiro,verdadeiro)
fimse
fimprocedimento
//-------------------------------------------------------------
procedimento classifica_parcela(tp:caracter)
var
x1,x2:inteiro
R1,R2:inteiro
inicio
Se Total_Parcelas=0 ENTAO
   continua("ERRO: Parcelas está vazia. Pressione < ENTER > para voltar ",verdadeiro,verdadeiro)
SENAO
   Escreval
   Escreva("Carregando ")
   para x1 de 1 ate total_parcelas-1 faca
      Se x1 mod 3=0 ENTAO
         Escreva(".")
      fimse
      para x2 de x1+1 ate Total_Parcelas faca
         R1:=caracpnum(copia(Data_Venci[x1],7,2)+copia(Data_Venci[x1],4,2)+copia(Data_Venci[x1],1,2))
         R2:=caracpnum(copia(Data_Venci[x2],7,2)+copia(Data_Venci[x2],4,2)+copia(Data_Venci[x2],1,2))
         se ((tp="1") e (Codigo_Parcela[x2]<Codigo_Parcela[x1])) ou ((tp="2") e (R2<R1)) ENTAO
            Org_Vetores_Parcelas(x1,x2)
         fimse
      fimpara
   fimpara
fimse
fimprocedimento
//--------------------------------------------------------------------
PROCEDIMENTO menu_consultas
inicio
repita
   limpatela
   Escreval("-----------Menu Consultas-----------")
   Escreval
   Escreval("1 - Clientes")
   Escreval("2 - Parcelas")
   Escreval("3 - Bancos")
   Escreval("4 - Retornar")
   Escreval
   Escreva("Escolha uma opcao:")
   leia(op4)
   Escolha op4
   Caso("1")
      Consultar_cliente
   Caso("2")
      Menu_consulta_parcela
   Caso("3")
      Mostra_bancos
   fimescolha
ate (op4=4)
fimprocedimento
//------------------------------------------------------------------------------
Procedimento Menu_consulta_parcela
inicio
Repita
   limpatela
   Escreval("-----------Consulta de Parcelas-----------")
   Escreval
   Escreval("1 - Detalhado")
   Escreval("2 - Resumo")
   Escreval("3 - Retornar")
   Escreval
   Escreva("Opção: ")
   Leia(op5)
   Escolha op5
   caso "1"
      consulta_Parcela_Geral
   caso "2"
      Resumo_Parcelas
   fimescolha
Ate (op5="3")
fimprocedimento
//------------------------------------------------------------------------------
PROCEDIMENTO menu_creditos
var
creditos: vetor[1..10]de caracter
x,y:inteiro
c: caracter
inicio
limpatela
creditos[1]:="-----------CRÉDITOS-----------"
creditos[2]:="programa desenvolvido com o intuito de aprimoramento do conteudo"
creditos[3]:="disciplina:Algoritmos e Lógicas de Programação"
creditos[4]:="Professor responsavél: Alexandre Moreno"
creditos[5]:="Unicesumar-2021"
creditos[6]:="Alunos:"
creditos[7]<-"Carolina Sato"
creditos[8]<-"Guilherme Pupim"
creditos[9]<-"Matheus Balan"
creditos[10]<-"Maria Eduarda"
Para x de 1 ate 10 faca
   Para y de 1 ate compr(creditos[x]) faca
      c:=copia(creditos[x],y,1)
      escreva(c)
   fimpara
   escreval
fimpara
escreval
continua("pressione <enter> para retornar ao menu principal",verdadeiro,verdadeiro)
fimprocedimento
//------------------------------------------------------------------------------
Funcao valida_data(dt:caracter):logico
var

diaI,mesI,anoI:inteiro
anovalido,mesvalido,diavalido:logico
inicio
diavalido:=falso
mesvalido:=falso
anovalido:=falso
diaI:=caracpnum(copia(dt,1,2))
mesI:=caracpnum(copia(dt,4,2))
anoI:=caracpnum(copia(dt,7,2))
SE (anoI >= 0) e (anoI <= 99) ENTAO
   anovalido:=verdadeiro
   SE (mesI >= 1) e (mesI <= 12) ENTAO
      mesvalido:=verdadeiro
      SE (mesI=2) e (anoI mod 4=0) e (diaI>=1) e (diaI<=29) ENTAO
         diavalido:=verdadeiro
      fimse
      SE (mesI=2) e (anoI mod 4<>0) e (diaI>=1) e (diaI<=28) ENTAO
         diavalido:=verdadeiro
      fimse
   fimse
   SE ((mesI=1) ou (mesI=3) ou (mesI=5) ou (mesI=7) ou (mesI=8) ou (mesI=10) ou (mesI=12)) e ((diaI>=1) e (diaI<=31)) ENTAO
      diavalido:=verdadeiro
   fimse
   SE ((mesI=4) ou (mesI=6) ou (mesI=9) ou (mesI=11)) e ((diaI>=1) e (diaI<=30)) ENTAO
      diavalido:=verdadeiro
   fimse
fimse
SE (diavalido) e (mesvalido) e (anovalido) ENTAO
   retorne verdadeiro
SENAO
   retorne falso
fimse
fimfuncao
//-------------------------------------------------------------
funcao buscar_banco(cod:caracter):inteiro
var
PosicaoVetor:inteiro
inicio
PosicaoVetor:=0
Repita
   PosicaoVetor:=PosicaoVetor+1
Ate (PosicaoVetor=10) ou (cod=Banco[PosicaoVetor])
Se cod=Banco[PosicaoVetor] ENTAO
   retorne PosicaoVetor
SENAO
   retorne 0
fimse
fimfuncao
//---------------------------------------------------------
inicio
carrega_banco
clientes_importado:=falso
parcela_importada:=falso

total_clientes:=0
total_parcelas:=0

Repita
   menu_principal
ate op1="6"

fimalgoritmo
