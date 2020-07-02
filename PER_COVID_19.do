********* An�lise dos dados da pesquisa de percep��o sobre COVID-19

********* IMPORTAR A BASE DE DADOS 

. import excel "C:\Users\Carlos Eduardo\Dropbox\PESQUISA E EXTENS�O\GRUPO DE PESQUISA IFPE\COVID 19\DADOS\BASE FINAL\BASENOVAAJUST.xlsx", sheet("PER_COVID_FIN_BASE_COMP_NOVATOT")
>  firstrow

********* Ajustando dados para trabalhar com o pacote Survey - SVYSET

**** Ajustando os pesos


. generate pop_size = 209000000

*** Necess�rio modificar o numero de observa��es da amostragem

. generate weight = pop_size/16440

. generate fpc = 17254/pop_size


. svyset ESCOL [pweight = weight], fpc (fpc)

**** Propor��o de Pessoas em Isolamento:

** Fun��o propor��o
. svy: proportion ISOLAM
. svy: proportion RENDA

** Selecionando uma amostra de subgrupo dentro da sua amostra
svy, sub(if ESTADO == 2 ): proportion ISOLAM

. svy, sub(if RENDA == 0): proportion ISOLAM


*** Selecionando as propor��es por estrado

. svy: proportion ISOLAM, over (ESTADO)

*** Relacionando duas vari�veis pela fun��o tab


. tab STRES_FAM RENDA

*** Relacionando duas vari�veis pela fun��o tab dentro de um survey
. svy: tab STRES_FAM RENDA

*** Relacionando duas vari�veis pela fun��o tab dentro de um survey e apresentando os percentuais nas linhas

. tab STRES_FAM QTD_PES, row

*** Relacionando duas vari�veis pela fun��o tab dentro de um survey e apresentando os percentuais nas colunas

. svy: tab STRES_FAM QTD_PES, col

*** Relacionando duas vari�veis pela fun��o tab, apresentando os percentuais nas colunas
. tab STRES_FAM QTD_PES, col

. svy: proportion SEXO
. svy: proportion RENDA
. svy: tab ISOLAM REDUZ_VIT, col
tab ISOLAM REDUZ_VIT, col
tab REDUZ_VIT ISOLAM , col
tab IMPAC_ISO AFET_REND , col
tab AFET_REND REDUZ_VIT , col
tab REDUZ_VIT AFET_REND , col
tab IMPAC_ISO STRES_FAM , col
. svy: proportion IMPAC_ISO
proportion IMPAC_ISO
. svy: proportion IMPAC_ISO, over (RENDA)
tab IMPAC_ISO RENDA , col
tab AFET_REND SEXO , col
tab SEXO AFET_REND , col
tab IMPAC_ISO SEXO , col
tab SEXO IMPAC_ISO , col
. svy: proportion IMPAC_ISO, over(SEXO)
. svy: proportion AFET_REND , over(SEXO)
. svy: proportion IMPAC_ISO, over( RENDA )
tab AFET_REND RENDA , col
. svy: proportion AFET_REND , over( RENDA )
. svy: proportion ESTADO , over( IMPAC_ISO )
. svy: proportion ESTADO , over( REDUZ_VIT )
proportion ESTADO , over( REDUZ_VIT )
tab ESTADO REDUZ_VIT , col
tab ESTADO REDUZ_VIT , row
tab IMPAC_ISO STRES_FAM , row
tab IMPAC_ISO STRES_FAM , col
tab STRES_FAM IMPAC_ISO , col
. svy: proportion STRES_FAM , over( IMPAC_ISO )
. svy: proportion STRES_FAM , over( AFET_REND )
tab STRES_FAM AFET_REND , col
tab AFET_REND STRES_FAM , col
. svy: proportion STRES_FAM , over( QTD_PES )
. svy: proportion STRES_FAM , over( QUAL_RES )
. svy: proportion STRES_FAM , over( TEMP_MAIS )
. svy: proportion TEMP_MAIS , over( QUAL_RES )
. svy: proportion TEMP_MAIS , over( RENDA )
. svy: proportion SONO , over( STRES_FAM )
. svy: proportion ATIV_FIS , over( QUAL_RES )
. svy: proportion ATIV_FIS , over( RENDA )
