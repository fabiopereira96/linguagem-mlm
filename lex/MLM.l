addop   "+"|"-"|"or"
relop   "="|"<"|"<="|">"|">="|"!="|"NOT"
mulop   "*"|"/"|"div"|"mod"|"and"

if 			"if"    
else		"else"
then		"then"
assign 		":="
begin		"begin"
while		"while"
until		"until"
end			"end"
do			"do"

ascii				[\40-\176]
char_constant		"'"{ascii}"'"
boolean_constant	"true"|"false"

digit 		[0-9]
letter 		[a-zA-Z]
identifier 	{letter}({letter}|{digit})*
ident_lsit	{ident_list}","{identifier}|{identifier}

type    			"integer"|"real"|"boolean"|"char"
unsigned_integer 	{digit}+
sign 				[+-]?
scale_factor 		"E"{sign}{unsigned_integer}
unsigned_real   	{unsigned_integer}("."{digit}*)?{scale_factor}?
integer_constant	{unsigned_integer}
real_constant		{unsigned_real}

%%
{assign}				{printf ("<%s, %s>\n", "ASSIGN", yytext);}
{addop}         		{printf ("<%s, %s>\n", "ADDOP", yytext);}
{relop}         		{printf ("<%s, %s>\n", "RELOP", yytext);}
{mulop}         		{printf ("<%s, %s>\n", "MULOP", yytext);}
{type}          		{printf ("<%s, %s>\n", "TYPE", yytext);}
{if}    				{printf ("<%s, %s>\n", "IF", yytext);}
{else}    				{printf ("<%s, %s>\n", "ELSE", yytext);}
{then}    				{printf ("<%s, %s>\n", "THEN", yytext);}
{while}    				{printf ("<%s, %s>\n", "WHILE", yytext);}
{begin}    				{printf ("<%s, %s>\n", "BEGIN", yytext);}
{until}    				{printf ("<%s, %s>\n", "UNTIL", yytext);}
{end}    				{printf ("<%s, %s>\n", "END", yytext);}
{do}    				{printf ("<%s, %s>\n", "DO", yytext);}
{boolean_constant}		{printf ("<%s, %s>\n", "BOOLEAN_CONSTANT", yytext);}
{integer_constant}    	{printf ("<%s, %s>\n", "INTEGER_CONSTANT", yytext);}
{real_constant}	    	{printf ("<%s, %s>\n", "REAL_CONSTANT", yytext);}
{char_constant}    		{printf ("<%s, %s>\n", "CHAR_CONSTANT", yytext);}
{identifier}    		{printf ("<%s, %s>\n", "IDENTIFIER", yytext);}

"("                     {printf ("<%s, %s>\n", "LPAREN", yytext);}
")"                     {printf ("<%s, %s>\n", "RPAREN", yytext);}
","                     {printf ("<%s, %s>\n", "COMMA", yytext);}
":"                     {printf ("<%s, %s>\n", "COLON", yytext);}
";"                     {printf ("<%s, %s>\n", "SEMI", yytext);}
%%

#include<stdio.h>
//#define TOKEN_ECHO(symbol) printf ("<%s, %s>\n", symbol, yytext)

int yywrap(){
    return 1;
}

int main(int argc, char** argv){
    yylex();
    return 0;
}