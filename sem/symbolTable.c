#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define NMax 10     /* Numero maximo de niveis possiveis */

int escopo[10];
int TabHash[100];
int nivel;    /* inteiro que contem o numero do nivel atual */
int L;     	/* inteiro que contem o indice do ultimo elemento da Tabela de Simbolos */
int Raiz;   /* inteiro que contem o indice do primeiro elemento da Tabela de Simbolos */

char integer[] = "integer";
char real[] = "real";
char boolean[] = "boolean";
char charA[] = "char";
char error[] = "error";

struct {
	char nome[10];       /* Contem o nome do Simbolo */
	int  nivel;          /* Contem o nivel do Simbolo relacionado */
	char atributo[10];   /* Contem o atributo do  relacionado */
	int col;
	char tipo[10];
} TabelaS[100]; /* Vetor de struct que contem a tabela de simbolos */

int Hashing(char *chave);
void Entrada_Bloco();
void Erro(int numero);
void Saida_Bloco();
int  Get_Entry(char name[10]);
void Instala(char name[10], char tipo[10]);
void imprimir();
void Atribbui(char name[10], char atribut[10]);
void InstalaLista(char *lista, char tipo[10]);
char* ComparaTipo(char tipo[10]);


// void main(void)
// {
// 	L = 1;    /* Considera-se que a primeira posicao da tabela eh a de indice 1. L eh o final da arvore binaria */
// 	Raiz = 0;
// 	nivel = 1;           /* O primeiro nivel � o 1 */
// 	escopo[nivel] = 1;		/* escopo[1] contem o indice do primeiro elemento */
// }


/************  Funcao que calcula o hashing de um simbolo  **********/
int Hashing(char chave[10])
{
	int hash = 0;
	int i;
	for(i = 0; i < strlen(chave); i++)
	{
		hash += (int)chave[i];
	}
	return hash % 100;
}

/************  Funcao que define os erros provaveis de ocorrer  **********/
void Erro(int num)
{
	char opcao;
	switch (num) {
		case 1: printf("Tabela de Sibolos cheia\n"); 	break;
		case 2: printf("Este item nao foi encontrado\n");  break;
		case 3: printf("Este item ja foi inserido\n"); break;
		case 4: printf("Item sem tipo ou com tipo invalido\n"); break;
	}
}

/*******************     Funcao de entrada num bloco   ********************/
void Entrada_Bloco()
{
	//clrscr();
	nivel++;

	if (nivel > NMax)
		Erro(1);

	else
		escopo[nivel] = L;

	printf("\nEntrada no nivel  %d",nivel);
}

/********************  Funcao de saida de um bloco  ***********************/
void Saida_Bloco()
{
	int S, B, k;
	char ident[10];
	S = L;
	B = escopo[nivel];

	while (S > B)
	{
		S--;
		strcpy(ident,TabelaS[S].nome);
		k = ident[1];
		TabHash[k] = TabelaS[S].col;
	}

	printf("\nSaida do nivel %d",nivel);
	nivel--;
	L = B;
}

/****************  Funcao que pesquisa item na tabela  *******************/
int Get_Entry(char x[10])   /* Pesquisa o simbolo "x" e retorna o indice da Tabela de simbolos onde ele se encontra */
{
	int n, aux, achou, k;
	achou = 0;
	n = Hashing(x);
	k = TabHash[n];

	while ((k != 0)&&(achou == 0))
	{
		aux = strcmp(TabelaS[k].nome,x);
		if (aux == 0) achou = 1;
		else k = TabelaS[k].col;
	}

	if (achou == 1)
	{
		printf("\nO item %s esta no nivel  %d", x, TabelaS[k].nivel);
		printf("               Indice %u\n",k);
		return (k);  /* Retorna o indice no vetor TabelaS do elemento procurado*/
	}
	else
	{
		Erro(2);
		return(0);
	}
}

//Funcao que atribui valor a um item da tabela
void Atribui(char X[10], char atribut[10]){
	int n, aux, achou, k, i;
	achou = 0;
	n = Hashing(X);
	k = TabHash[n];

	while ((k != 0)&&(achou == 0))
	{
		aux = strcmp(TabelaS[k].nome,X);
		if (aux == 0) achou = 1;
		else k = TabelaS[k].col;
	}

	if (achou == 1)
	{
		aux = strlen(atribut);
		for (i = 0; i<= aux-1; i++)
			TabelaS[k].atributo[i] = atribut[i];


	}
	else Erro(2);
}

/***************  Funcao que instala o item na tabela  *****************/
void Instala(char X[10], char tipo[10]) /* Instala o simbolo "X" com o atributo atribut na Tabela de Simbolos */
{
	int n, igual, k, aux;
	//clrscr();
	igual = 0;
	n = Hashing(X); /* Calcula o hashing(X)*/
	k = TabHash[n];

	while (k >= escopo[nivel])
	{
		aux = strcmp(TabelaS[k].nome,X);
		if (aux == 0)
		{
			Erro(3);
			igual = 1;
		}
		k = TabelaS[k].col;
	}
	if (L == NMax + 1)	Erro(1);
	else if (igual ==0)
	{
		TabelaS[L].nivel = nivel;
		aux = strlen(X);
		for (k = 0; k<=(aux-1); k++)
			TabelaS[L].nome[k] = X[k];

		TabelaS[L].col = TabHash[n];
		TabHash[n] = L;

		//integer, real, boolean, char
		if (strcmp(ComparaTipo(tipo), error)){
				aux = strlen(tipo);
				for (k = 0; k<=(aux-1); k++)
					TabelaS[L].tipo[k] = tipo[k];
		}
		else Erro(4);

		L++;
	}

	//imprimir();
}

void InstalaLista(char *lista, char tipo[10]){
	char *found;
	while( (found = strsep(&lista,",")) != NULL )
			Instala(found, tipo);
}

//Funcao auxiliar para fazer a comparacao dos tipos
char* ComparaTipo(char tipo[10]){
	if (!strcmp(tipo, integer)) return integer;
	else if (!strcmp(tipo, real)) return real;
	else if (!strcmp(tipo, boolean)) return boolean;
	else if (!strcmp(tipo, charA)) return charA;
	else return error;
}

void imprimir()
{
	int i;
	for (i=1; i<=L-1; i++)
	{
		printf("\n\nNome : ");
		printf("%s", TabelaS[i].nome);
		printf("\n");
		printf("Atributo : ");
		printf("%s", TabelaS[i].atributo);
		printf("\n");
		printf("Tipo : ");
		printf("%s", TabelaS[i].tipo);
		printf("\n");
		printf("Nivel : ");
		printf("%i", TabelaS[i].nivel);
		printf("\n");
		printf("\n");
	}
}
