
%{
	/* Definition section */
	#include<stdio.h> 
	#include<stdlib.h>
	#include "symbolTable.c"

	extern void yyerror();
	extern int yylineno;
	extern int yylex();

	char* ftoa(float number);
	char* itoa(int number);
	char* ctoa(char number);
%}

%union {
  int intVal;
  float realVal;
  char* strVal;
  char charVal;
  short boolVal;
}

%type <strVal> expr
%type <strVal> simple_expr
%type <strVal> term
%type <strVal> factor_a
%type <strVal> factor
%type <strVal> constant

%token PROGRAM
%token  COMMA   SINGLE_QUOTES   SEMI_COLON   ASSIGN 
%token  BRACKET_OPEN  BRACKET_CLOSE   CURLY_BRACE_OPEN  CURLY_BRACE_CLOSE BIG_BRACKET_OPEN  BIG_BRACKET_CLOSE
%token COLON

%token <strVal> ADDOP
%token <strVal> RELOP
%token <strVal> MULOP

%token <strVal> READ
%token <strVal> WRITE
%token <strVal> IF
%token <strVal> DO
%token <strVal> BEGIN_
%token <strVal> END
%token <strVal> WHILE
%token <strVal> UNTIL

%token <strVal> IDENTIFIER
%token <intVal> INTEGER_C
%token <realVal> REAL_C
%token <charVal> CHAR_C
%token <strVal> BOOL_C

%nonassoc <strVal> THEN
%nonassoc <strVal> ELSE

/* Rule Section */
%%

program  :  PROGRAM IDENTIFIER SEMI_COLON decl_list compound_stmt {;}
		 ;

decl_list  :  decl_list SEMI_COLON decl 	{;}
		   |  decl 	{;}
		   ;

decl  :  ident_list COLON type	{;}

type  : INTEGER_C	{;}
      | REAL_C	{;}
      | BOOL_C	{;}
      | CHAR_C	{;}
      ;

ident_list  :  ident_list COMMA IDENTIFIER	{;}
			|  IDENTIFIER	{;}
			;

compound_stmt  :  BEGIN_ stmt_list END	{;}
			   ;

stmt_list  :  stmt_list SEMI_COLON stmt	{;}
		   |  stmt 	{;}
		   ;

stmt  :  assign_stmt	{;}
	  |  if_stmt	{;}
	  |  loop_stmt	{;}
	  |  read_stmt	{;}
	  |  write_stmt	{;}
	  |  compound_stmt	{;}
	  ;

assign_stmt  :  IDENTIFIER ASSIGN expr	{Instala($1, $3);}
			 ;

if_stmt  :  IF cond THEN stmt	{;}
		 |  IF cond THEN stmt ELSE stmt 	{;}
		 ;

cond  :  expr {;}
	  ;

loop_stmt  :  stmt_prefix DO stmt_list stmt_suffix	{;}
		   ;

stmt_prefix  :  WHILE cond	{;}
			 |  /* empty */	{;}
			 ;

stmt_suffix  :  UNTIL cond	{;}
			 |  END	{;}
			 ;

read_stmt  :  READ BRACKET_OPEN ident_list BRACKET_CLOSE	{;}
		   ;

write_stmt  :  WRITE BRACKET_OPEN expr_list BRACKET_CLOSE	{;}
			;

expr_list  :  expr	{;}
		   |  expr_list COMMA expr	{;}
		   ;

expr  :  simple_expr	{$$ = $1;}
	  |  simple_expr RELOP simple_expr	{;}
	  ;

simple_expr  :  term	{$$ = $1;}
			 |  simple_expr ADDOP term	{$$ = ftoa(atof($1) + atof($3));}
			 ;

term  :  factor_a	{$$ = $1;}
 	  |  term MULOP factor_a	{$$ = ftoa(atof($1) * atof($3));}
 	  ;

factor_a  :  factor 	{$$ = $1;}
		  ;

factor 	:  IDENTIFIER  	{int index = Get_Entry($1); /*if (!index) return 0*/; $$ = TabelaS[index].atributo;}
 		|  constant		{$$ = $1;}
 		|  BRACKET_OPEN expr BRACKET_CLOSE {$$ = $2;}
		;

constant  :  INTEGER_C	{$$ = itoa($1);}
		  |  REAL_C		{$$ = ftoa($1);}
		  |  CHAR_C		{$$ = ctoa($1);}
		  |  BOOL_C		{$$ = $1;}
		  ;

%%

char* ftoa(float number){
	static char buffer[33];
	snprintf(buffer, sizeof(buffer), "%f", number);
	return buffer;
}

char* itoa(int number){
	static char buffer[33];
	snprintf(buffer, sizeof(buffer), "%d", number);
	return buffer;
}

char* ctoa(char number){
	static char buffer[33];
	snprintf(buffer, sizeof(buffer), "%c", number);
	return buffer;
}

//driver code
int main()
{
	L = 1;    /* Considera-se que a primeira posicao da tabela eh a de indice 1. L eh o final da arvore binaria */
	Raiz = 0;
	nivel = 1;           /* O primeiro nivel ‚ o 1 */
	escopo[nivel] = 1;		/* escopo[1] contem o indice do primeiro elemento */

	yyparse();
	printf("Acceptd\n");
	imprimir();
	return 0;
}
