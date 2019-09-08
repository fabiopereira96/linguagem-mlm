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
{addop}         		{printf("ADDOP ");}
{relop}         		{printf("RELOP ");}
{mulop}         		{printf("MULOP ");}
{type}          		{printf("TYPE ");}
{if}    				{printf("IF ");}
{else}    				{printf("ELSE ");}
{then}    				{printf("THEN ");}
{while}    				{printf("WHILE ");}
{begin}    				{printf("BEGIN ");}
{until}    				{printf("UNTIL ");}
{end}    				{printf("END ");}
{do}    				{printf("DO ");}
{identifier}    		{printf("IDENTIFIER ");}
{integer_constant}    	{printf("INTEGER_CONSTANT ");}
{real_constant}	    	{printf("REAL_CONSTANT ");}
{char_constant}    		{printf("CHAR_CONSTANT ");}
%%
#include<stdio.h>

int yywrap(){
    return 1;
}

int main(int argc, char** argv){
    yylex();
    return 0;
}