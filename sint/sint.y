
%{
	/* Definition section */
	#include<stdio.h> 
	#include<stdlib.h> 

	extern void yyerror();
	extern int yylineno;
%}

%union {
  int intVal;
  char* dataType;
  char* strVal;
  float realVal;
  char charVal;
}

%token  COMMA   SINGLE_QUOTES   SEMI_COLON   ASSIGN 
%token  BRACKET_OPEN  BRACKET_CLOSE   CURLY_BRACE_OPEN  CURLY_BRACE_CLOSE BIG_BRACKET_OPEN  BIG_BRACKET_CLOSE

%token <strVal> ADDOP
%token <strVal> RELOP
%token <strVal> MULOP

%token <strVal> IDENTIFIER
%token <intVal> INTEGER_C
%token <realVal> REAL_C
%token <charVale> CHAR_C
%token <strVal> BOOL_C

/* Rule Section */
%%

program  :  expr  {printf("done\n"); exit(0);}
		 ;

expr  :  simple_expr	{printf("simple_expr\n");}
	  |  simple_expr RELOP simple_expr	{printf("simple_expr RELOP simple_expr\n");}
	  ;

simple_expr  :  term	{printf("term\n");}
			 |  simple_expr ADDOP term	{printf("simple_expr ADDOP term\n");}
			 ;

term  :  factor_a	{printf("factor_a\n");}
 	  |  term MULOP factor_a	{printf("term MULOP factor_a\n");}
 	  ;

factor_a  :  factor 	{printf("factor\n");}
		  ;

factor 	:  IDENTIFIER  	{printf("identifier\n");}
 		|  constant		{printf("constant\n");}
 		|  BRACKET_OPEN expr BRACKET_CLOSE {printf("(expr)\n");}
		;

constant  :  INTEGER_C	{printf("integer_constant\n");}
		  |  REAL_C		{printf("real_constant\n");}
		  |  CHAR_C		{printf("char_constant\n");}
		  |  BOOL_C		{printf("bool_constant\n");}
		  ;

%%

//driver code
main()
{
	yyparse();
	printf("Acceptd\n");
	return 0;
}
