
%{
	/* Definition section */
	#include<stdio.h> 
	#include<stdlib.h> 

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

program  :  PROGRAM IDENTIFIER SEMI_COLON decl_list compound_stmt  {printf("done\n"); exit(0);}
		 ;

decl_list  :  decl_list SEMI_COLON decl
		   |  decl
		   ;

decl  :  ident_list COLON type

type            : INTEGER_C
                | REAL_C
                | BOOL_C
                | CHAR_C ;

ident_list  :  ident_list COMMA IDENTIFIER
			|  IDENTIFIER
			;

compound_stmt  :  BEGIN_ stmt_list END
			   ;

stmt_list  :  stmt_list SEMI_COLON stmt
		   |  stmt
		   ;

stmt  :  assign_stmt
	  |  if_stmt
	  |  loop_stmt
	  |  read_stmt
	  |  write_stmt
	  |  compound_stmt
	  ;

assign_stmt  :  IDENTIFIER ASSIGN expr;

if_stmt  :  IF cond THEN stmt
		 |  IF cond THEN stmt ELSE stmt
		 ;

cond  :  expr
	  ;

loop_stmt  :  stmt_prefix DO stmt_list stmt_suffix
		   ;

stmt_prefix  :  WHILE cond
			 |  /* empty */
			 ;

stmt_suffix  :  UNTIL cond
			 |  END
			 ;

read_stmt  :  READ BRACKET_OPEN ident_list BRACKET_CLOSE
		   ;

write_stmt  :  WRITE BRACKET_OPEN expr_list BRACKET_CLOSE
			;

expr_list  :  expr
		   |  expr_list COMMA expr
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
int main()
{
	yyparse();
	printf("Acceptd\n");
	return 0;
}
