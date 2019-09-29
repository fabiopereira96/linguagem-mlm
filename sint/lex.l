%option noinput nounput
%{
	/* Definition section */
	#include <string.h>
    #include <stdlib.h>
	#include "y.tab.h"

	void extern yyerror(char*);
%}

linefeed    	\n
whitespace      [ \t\r\v\f]

addop   "+"|"-"|"or"
relop   "="|"<"|"<="|">"|">="|"!="|"NOT"
mulop   "*"|"/"|"div"|"mod"|"and"

digit 		[0-9]
letter 		[a-zA-Z]
identifier 	{letter}({letter}|{digit})*

unsigned_integer 	{digit}+
sign 				[+-]?
scale_factor 		"E"{sign}{unsigned_integer}
unsigned_real   	{unsigned_integer}("."{digit}*)?{scale_factor}?
integer_constant	{unsigned_integer}
real_constant		{unsigned_real}
ascii				[\40-\176]
char_constant		"'"{ascii}"'"
boolean_constant	"true"|"false"

/* Rule Section */
%%

{addop}					{yylval.strVal = strdup(yytext); return ADDOP;}
{relop}					{yylval.strVal = strdup(yytext); return RELOP;}
{mulop}					{yylval.strVal = strdup(yytext); return MULOP;}

"program" 				{yylval.strVal = strdup(yytext); return PROGRAM;}
"integer" 				{yylval.strVal = strdup(yytext); return INTEGER_C;}
"real"	  				{yylval.strVal = strdup(yytext); return REAL_C;}
"char"	  				{yylval.strVal = strdup(yytext); return CHAR_C;}
"boolean" 				{yylval.strVal = strdup(yytext); return BOOL_C;}

"read"					{yylval.strVal = strdup(yytext); return READ;}
"write"					{yylval.strVal = strdup(yytext); return WRITE;}
"if"					{yylval.strVal = strdup(yytext); return IF;}
"then"					{yylval.strVal = strdup(yytext); return THEN;}
"else"					{yylval.strVal = strdup(yytext); return ELSE;}
"do"					{yylval.strVal = strdup(yytext); return DO;}
"begin"					{yylval.strVal = strdup(yytext); return BEGIN_;}
"end"					{yylval.strVal = strdup(yytext); return END;}
"while"					{yylval.strVal = strdup(yytext); return WHILE;}
"until"					{yylval.strVal = strdup(yytext); return UNTIL;}

"'"						{return SINGLE_QUOTES;}
","						{return COMMA;}
";"						{return SEMI_COLON;}
":"						{return COLON;}
":="					{return ASSIGN;}
"("						{return BRACKET_OPEN;}
")"						{return BRACKET_CLOSE;}
"{"						{return CURLY_BRACE_OPEN;}
"}"						{return CURLY_BRACE_CLOSE;}
"["						{return BIG_BRACKET_OPEN;}
"]"						{return BIG_BRACKET_CLOSE;}

{integer_constant}		{yylval.intVal = atoi(yytext); return INTEGER_C;}
{real_constant}			{yylval.realVal = atof(yytext); return REAL_C;}
{char_constant}			{yylval.charVal = yytext[1]; return CHAR_C;}
{boolean_constant}		{yylval.strVal = strdup(yytext); return BOOL_C;}
{identifier}   			{yylval.strVal = strdup(yytext); return IDENTIFIER;}

{linefeed}				{yylineno++;}
{whitespace}            ;
.						{yyerror(yytext);}

%%

int yywrap()
{
	return 1;
}

void yyerror(char *s) {
    printf("ERROR ON LINE %d : \n %s\n", yylineno, s);
    exit(0);
}