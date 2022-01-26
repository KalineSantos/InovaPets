programa
{	
	/*  -----------------------------------------------------------
	   | BIBLIOTECAS PARA FUNCIONAMENTO DAS FUNﾃ�ﾃ髭S			  |
	   ----------------------------------------------------------- */
		inclua biblioteca Calendario --> c
		inclua biblioteca Matematica --> mat
	
	/*  -----------------------------------------------------------
	   | VARIﾃ〃EIS GLOBAIS PARA SEREM APLICADAS AS DEMAIS FUNﾃ�ﾃ髭S |
	   -----------------------------------------------------------  
		legenda: [termo entre colchete ﾃｩ vetor] 
		codigoi => Recebe o cﾃｳdigo de dos produtos que serﾃ｣o escolhidos.
		Por possuir colchetes "[]", essa variﾃ｡vel se comporta como vetor. */
		inteiro codigoi[20]
		//pedido[] ﾃｩ um vetor em branco que recebera os valores de texto correspondente aos pedidos feitos.
		cadeia pedido[20]
		//qtd = Esta declaraﾃｧﾃ｣o armazena a quantidade de itens por porduto em um vetor.
		inteiro qtdp[20]
		//custoi armazena os valores individual de cada produto solicitado para compra
		real custoi[20]
		// custot= corresponde ao valor total da compra / comissao(v -vendedor)= comiss total do vendedor.
		real custot=0.0, comissaov=0.0
		
		/* As declaraﾃｧﾃｵes abaixo, correspondem a valores constantes para informar cﾃｳdigo, produto, valor e comissao
		   do vendedor.
		   Essa declaraﾃｧﾃ｣o contﾃｩm o cﾃｳdigo de cada produto. */
		inteiro codigo[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}
		//produto [] ={vetor que contﾃｩm todos os produtos ofertados}.
		cadeia produto[]={"Bandeja Higiﾃｪnica para Gato G","CLEAN PERFUME - BLUE PUPPY 500ML",
	"Pente Duplo Antipulga para Cﾃ｣es e Gatos","Condicionador Famous Pet Argan Dr. Rey 500ml",
	"Hidratante educador de Cﾃ｣es para xixi Sanitﾃ｡rio","Creme Dental Pet Clean para Cﾃ｣es e Gatos 60gr",
	"Escova Dental Care Dupla para Cﾃ｣es","Raﾃｧﾃ｣o Golden Gatos Filhotes Sabor Frango 3kg",
	"Biscoito Golden Cookie para Cﾃ｣es Filhotes 400g",
	"Raﾃｧﾃ｣o Golden Fﾃｳrmula Mini Bits para Cﾃ｣es Adultos de Pequeno Porte Sabor Salmﾃ｣o e Arroz 1kg",
	"DOG PELUCIA FOFINHOS ANIMAIS","Caminha Iglu Cubo para Cﾃ｣es","Brinquedo Mordedor para Cﾃ｣es - Bolinho Patinha 12cm",
	"Bolsa de transporte para Pet Cﾃ｣es e Gatos - Fﾃｪmea","Roupinhas para Cﾃ｣es - Vestidos em Soft",
	"Manta SOFT para Cﾃ｣es e Gatos","Fantasia Chapolin Colorado - Tam G","Peitoral Confort para Cﾃ｣es M - The Pets Brasil",
	"Guia Coleira Refletﾃｭvel Ajustﾃ｡vel para Cﾃ｣es","Guia e Peitoral para Gatos Moderna Ajustﾃ｡vel"}
		// valor[] = {informa o valor de casda produto respectivamente}
		real valor[]={21.50,120.00,9.90,14.90,29.90,14.00,4.90,55.90,16.10,21.90,34.80,99.00,14.90,54.90,29.90,19.90,26.90,
	34.90,69.90,49.90}
		//comissao[] vetor que contem a % de comissao de cada produto.
		real comissao[]={0.15,0.15,0.10,0.10,0.15,0.1,0.1,0.15,0.1,0.15,0.15,0.15,0.1,0.15,0.15,0.15,0.15,0.15,0.15,0.15}
		// DadosVendedorX = ﾃｩ uma variﾃ｡vel auxiliar para localizar um dos trﾃｪs vendedores da loja.
		cadeia DadosVendedorX="N"
	
	
	// Essa funﾃｧﾃ｣o inicio ﾃｩ a que vai adm todas as outras funﾃｧoes (a que chama e mostra o resultado de tudo).
	funcao inicio(){
	//resposta = recebe um numero inteiro e responde o dado solicitado por este numero
	inteiro resposta, cod
	// Cabecalho chama a funﾃｧﾃ｣o cabeﾃｧalho
	cabecalho()
	//Condiﾃｧﾃ｣o para verificar qual vendedor estﾃ｡ executando o atendimento.
	enquanto(DadosVendedorX=="N"){
		escreva("Digite o código do vendedor: ")
		leia(cod)
		limpa()
		DadosVendedorX=id_vendedor(cod)
		se(DadosVendedorX=="N"){
		   escreva("O cﾃｳdigo para o vendedor nﾃ｣o foi encontrado!\nInforme um cﾃｳdigo vﾃ｡lido.\n")
		   espere()
		   limpa()
		}senao{}
	}
	limpa()
	
	cabecalho()
	escreva(DadosVendedorX) 
	espere()
	
		/* Estrutura de repetiﾃｧﾃ｣o para mostrar a lista de produtos da loja alﾃｩm de tambﾃｩm chamar outras funﾃｧﾃｵes
		   como a funﾃｧﾃ｣o para registrar pedido, exibir a lista de compras  e finalizar a compra.		 */
		
		logico continuar=verdadeiro
		//enquanto (condiﾃｧﾃ｣o) - enquanto continuar for verdadeiro escreva:
		enquanto(continuar){
		//MOSTRAR LISTA DE PEDIDOS
			escreva("\nGESTﾃグ DE PRODUTOS\n")
		/*para(condiﾃｧﾃ｣o com inicio e fim - determinada) i= signfica posiﾃｧﾃ｣o dos vetores codigo[i],produto[i],valor[i]
		Essa condiﾃｧﾃ｣o irﾃ｡ exibir a lista de produtos.	*/
		para(inteiro i=0; i < 20 ; i=i+1){
			escreva("(",codigo[i],") ",produto[i],"  R$ ",valor[i],"\n")
		/*i determina os valores que comeﾃｧa em 0 e a cada repetiﾃｧﾃ｣o da condiﾃｧﾃ｣o "i" aumenta em 1 atﾃｩ chegar em 20.
		 se i=0 entao i=i+1; i=0+1; i=1 1ﾂｺ repetiﾃｧﾃ｣o /
		Agora i=1 entao i=i+1; i=1+1; i=2 2ﾂｺ repetiﾃｧﾃ｣o e etc. ate i ser =20 
		Assim o programa vai escrevendo os produtos que estﾃ｣o dentro dos vetores, um a um ate que a condiﾃｧﾃ｣o seja
		satisfeita.	*/		
			}
		// se o custo for =0 irﾃ｡ chamar a funﾃｧﾃ｣o registrar pedido
		se(custot==0){
			registrarPedido()
			espere()

	     // Agora senao (se tiver produtos diferentes de 0 ira dar a opﾃｧﾃ｣o de add produtos...
		}senao{
			escreva("\nAdicionar mais produtos?\n\n(1) SIM\t\t(2) Exibir lista de pedidos\t\t(3) FINALIZAR COMPRA\n")
			leia(resposta)
			limpa()
		//escolha = com base na resposta inserida; caso escolha registrar pedido
		//ira ate a funﾃｧﾃ｣o referente a ele. (ir na funﾃｧﾃ｣o)
		//MENU ESCOLHA
			escolha(resposta){
				caso 1:
					cabecalho()
			          escreva(DadosVendedorX,"\n") 
					registrarPedido()
					espere()
				pare
				caso 2:
					cabecalho()
	    			     escreva(DadosVendedorX,"\n") 
					exibirLista()
					escreva("\nTotal parcial: R$ ",mat.arredondar(custot, 2))
					espere()
				pare
				caso 3:
					limpa()
					cabecalho()
					escreva(DadosVendedorX,"\n")
					//escreva("\n")
	     		     //escreva("============================================================================================================\n")
	     		     escreva("------------------------------------------------------------------------------------------------------------\n")
					escreva("Valor total da compra: R$ ",mat.arredondar(custot, 2),"\n")
					//escreva("------------------------------------------------------------------------------------------------------------\n")
					escreva("Comissﾃ｣o do vendedor: R$ ",mat.arredondar(comissaov, 2))
					//escreva("\n------------------------------------------------------------------------------------------------------------\n")
					escreva("\n")
					exibirLista()
					continuar=falso
				}
			}
		}
	}

	//FUNﾃ�ﾃグ QUE IDENTIFICA O VENDEDOR
	funcao cadeia id_vendedor(inteiro idv){
		
		inteiro idv1=012021, idv2=022021, idv3=032021
		cadeia idv1n, idv2n, idv3n
		//Nomes dos vendedores
		idv1n= "Judite Silva"
		idv2n= "Kaline Santos"
		idv3n= "Leonardo Di Caprio"

		/*Se o cﾃｳdigo informado for correspondente ao cﾃｳdigo cadastrado, a funﾃｧﾃ｣o trarﾃ｡ como resultado
		  o ID e o nome do funcionﾃ｡rio. */
		se (idv==idv1){
		cadeia Resposta="ID Vendedor: "+ idv1+"\n" + "Vendedor: "+idv1n
		retorne Resposta  
		    
	   }senao se (idv==idv2){
		   cadeia Resposta="ID Vendedor: "+ idv2+"\n" + "Vendedor: "+idv2n 
		   retorne Resposta 
		   
		}senao se (idv==idv3){
		   cadeia Resposta="ID Vendedor: "+ idv3+"\n" + "Vendedor: "+idv3n
		   retorne Resposta  
		
		}senao{
		
	          cadeia Resposta="N"
	          retorne Resposta 
		}
		
	}

	/* FUNﾃ�ﾃグ CABEﾃ�ALHO
	  Essa funﾃｧﾃ｣o escreve em tela informaﾃｧﾃｵes sobre a loja.  */
	funcao cabecalho(){
		inteiro dia=c.dia_mes_atual(), mes=c.mes_atual(), ano=c.ano_atual(), dsa=c.dia_semana_atual()
		inteiro h=c.hora_atual(falso), min=c.minuto_atual(), s=c.segundo_atual()
		  escreva("------------------------------------------------- INOVA PETS -----------------------------------------------\n")
	       escreva("                                         www.petshopinovapets.com.br\n"             ) 
	       escreva("\nCaixa aberto!\n")
	       escreva("Data de abertura: ",dia,"/",mes,"/",ano," - ",c.dia_semana_completo(dsa, falso, falso),"\n") 
	       escreva("Hora: ",h,":",min,":",s,"\n")
	}
	
	//Essa funﾃｧﾃ｣o escreve a lista de pedidos que foram adicionados ao carrinho.
	funcao exibirLista(){
	// arredodamento de numeros reais
		real arredondamento
		inteiro qtd
		
	//para(condiﾃｧﾃ｣o para exibir os produtos ja registrados na memoria
	
	escreva("\n============================================================================================================\n")
	escreva("COD.                                              PRODUTOS                                                    \n")
	escreva("============================================================================================================\n\n")
		para(inteiro i=0;i<20;i++){
	//se(condiﾃｧﾃ｣o
			se(pedido[i]==""){
			
			}senao{
				arredondamento=mat.arredondar(custoi[i],2)
				escreva("(",codigoi[i],") ",pedido[i],"\nQuantidade: ",qtdp[i],"\t\tR$ ",custoi[i],"\n")
	escreva("------------------------------------------------------------------------------------------------------------\n")
			}
		}
		
	}

	// Essa funﾃｧﾃ｣o faz o registro dos pedidos nos vetores globais declarados no inﾃｭcio do programa.	
	funcao registrarPedido(){
		inteiro npedido, qtd
		//ci= custo individual
		real ci
		//Inserir cﾃｳdigo e nﾃｺmero do pedido
			escreva("\nInsira o nﾃｺmero do pedido: ")
			leia(npedido)
		 /*pedido= recebe o nome do produto[npedido-1] recebe 
             o nome do produto =produto[npedido-1] */
			pedido[npedido-1]=produto[npedido-1]
			limpa()
			cabecalho()
			escreva(DadosVendedorX,"\n\n")
			escreva(pedido[npedido-1],"\n")
			escreva("Insira a quantidade: ")
			leia(qtd)
         		
			qtdp[npedido-1]+=qtd
			limpa()
		//ci= custo indivdual; ci recebe o valor
		// valor[busca o valor do pedido -1 multiplicado pela qtd.
		// ci= assume o valor total da multiplicaﾃｧﾃ｣o feita .
			cabecalho()
			escreva(DadosVendedorX,"\n\n")
			ci = valor[npedido-1]*qtd
			escreva(pedido[npedido-1],"\n")
        		escreva("Quantidade: ",qtd,"\t\t\tValor do produto: R$ ",mat.arredondar(valor[npedido-1], 2))
		//custoi= recebe o valor do produto informado anteriormente
			custoi[npedido-1]+=ci
		//codigoi= recebe o codigo do produto informado anteriormente
			codigoi[npedido-1]=codigo[npedido-1]
		//custot= custo total de todos os produtos +=significa pegar seu valor atual
		// e somar com mais 1 valor adicional e assumir esse novo valor.
			custot+=ci
		//comissaov= comissao total do vendedor. 
		//ci= custo ind. *multiplicado pelo valor da comissao do produto
		//novo valor anterior multiplicado agora sera somado com a comissao antiga =comissaov
		comissaov+=ci*comissao[npedido-1]
		escreva("\n\nO produto foi registrado com sucesso!\n")
		escreva("\nTotal da compra: R$ ",mat.arredondar(custot, 2))
			
	}
	
	//Funﾃｧao de pausa. Ela permite uma pausa com o propﾃｳsito de melhor visualizar as informaﾃｧﾃｵes em tela.
	funcao espere(){
		cadeia _
		escreva("\n\nPressione enter para continuar...")
		leia(_)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3368; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */