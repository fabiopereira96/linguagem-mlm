
%{
	/* Definition section */
	#include<stdio.h> 
	#include<stdlib.h>
	#include "symbolTable.c"

	extern void yyerror();
	extern int yylineno;
	extern int yylex();
%}

%union {
  int intVal;
  char* dataType;
  char* strVal;
  float realVal;
  char charVal;
}

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
%token <charVale> CHAR_C
%token <strVal> BOOL_C

%nonassoc <strVal> THEN
%nonassoc <strVal> ELSE

/* Rule Section */
%%

program  :  PROGRAM IDENTIFIER SEMI_COLON decl_list compound_stmt {printf("program\n");}
		 ;

decl_list  :  decl_list SEMI_COLON decl 	{printf("decl_list\n");}
		   |  decl 	{printf("decl_list\n");}
		   ;

decl  :  ident_list COLON type	{printf("decl\n");}

type  : INTEGER_C	{printf("type\n");}
      | REAL_C	{printf("type\n");}
      | BOOL_C	{printf("type\n");}
      | CHAR_C	{printf("type\n");}
      ;

ident_list  :  ident_list COMMA IDENTIFIER	{printf("ident_list\n");}
			|  IDENTIFIER	{printf("ident_list\n");}
			;

compound_stmt  :  BEGIN_ stmt_list END	{printf("compound_stmt\n");}
			   ;

stmt_list  :  stmt_list SEMI_COLON stmt	{printf("stmt_list\n");}
		   |  stmt 	{printf("stmt_list\n");}
		   ;

stmt  :  assign_stmt	{printf("stmt\n");}
	  |  if_stmt	{printf("stmt\n");}
	  |  loop_stmt	{printf("stmt\n");}
	  |  read_stmt	{printf("stmt\n");}
	  |  write_stmt	{printf("stmt\n");}
	  |  compound_stmt	{printf("stmt\n");}
	  ;

assign_stmt  :  IDENTIFIER ASSIGN expr	{printf("assign_stmt\n");}
			 ;

if_stmt  :  IF cond THEN stmt	{printf("if_stmt\n");}
		 |  IF cond THEN stmt ELSE stmt 	{printf("if_stmt\n");}
		 ;

cond  :  expr {printf("cond\n");}
	  ;

loop_stmt  :  stmt_prefix DO stmt_list stmt_suffix	{printf("loop_stmt\n");}
		   ;

stmt_prefix  :  WHILE cond	{printf("stmt_prefix\n");}
			 |  /* empty */	{printf("stmt_prefix\n");}
			 ;

stmt_suffix  :  UNTIL cond	{printf("stmt_suffix\n");}
			 |  END	{printf("stmt_suffix\n");}
			 ;

read_stmt  :  READ BRACKET_OPEN ident_list BRACKET_CLOSE	{printf("read_stmt\n");}
		   ;

write_stmt  :  WRITE BRACKET_OPEN expr_list BRACKET_CLOSE	{printf("write_stmt\n");}
			;

expr_list  :  expr	{printf("expr_list\n");}
		   |  expr_list COMMA expr	{printf("expr_list\n");}
		   ;

expr  :  simple_expr	{printf("expr\n");}
	  |  simple_expr RELOP simple_expr	{printf("expr\n");}
	  ;

simple_expr  :  term	{printf("simple_expr\n");}
			 |  simple_expr ADDOP term	{printf("simple_expr\n");}
			 ;

term  :  factor_a	{printf("term\n");}
 	  |  term MULOP factor_a	{printf("term\n");}
 	  ;

factor_a  :  factor 	{printf("factor_a\n");}
		  ;

factor 	:  IDENTIFIER  	{printf("factor\n");}
 		|  constant		{printf("factor\n");}
 		|  BRACKET_OPEN expr BRACKET_CLOSE {printf("(factor)\n");}
		;

constant  :  INTEGER_C	{printf("constant\n");}
		  |  REAL_C		{printf("constant\n");}
		  |  CHAR_C		{printf("constant\n");}
		  |  BOOL_C		{printf("constant\n");}
		  ;

%%

//driver code
int main()
{
	L = 1;    /* Considera-se que a primeira posicao da tabela eh a de indice 1. L eh o final da arvore binaria */
	Raiz = 0;
	nivel = 1;           /* O primeiro nivel ‚ o 1 */
	escopo[nivel] = 1;		/* escopo[1] contem o indice do primeiro elemento */

	yyparse();
	printf("Acceptd\n");
	return 0;
}
