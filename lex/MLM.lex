addop   "+"|"-"|"or"
relop   "="|"<"|"<="|">"|">="|"!="|"NOT"
mulop   "*"|"/"|"div"|"mod"|"and"

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
ascii				[\40-\176]
char_constant		"'"{ascii}"'"
boolean_constant	"true"|"false"

constant 			{integer_constant}|{real_constant}|{char_constant}|{boolean_constant}
factor 				{identifier}|{constant}|"("{expr}")"|"NOT"{factor}
factor_a			"-"{factor}|{factor}
term 				{factor_a}|{term}{mulop}{factor_a}
simple_expr			{term}|{simple_expr}{addop}{term}
expr 				{simple_expr}|{simple_expr}{relop}{simple_expr}
expr_list			{expr}|{expr_list}","{expr}
cond				{expr}

if 			"if"
else		"else"
then		"then"
assign 		":="
begin		"begin"
while		"while"
until		"until"
end			"end"
do			"do"

write_stmt 			"write("{expr_list}")"
read_stmt			"read("{ident_list}")"
stmt_prefix			({while}{cond})?
stmt_suffix			{until}{cond}|{end}
loop_stmt			{stmt_prefix}{do}{stmt_list}{stmt_suffix}
if_stmt				{if}{cond}{then}{stmt}|{if}{cond}{then}{stmt}{else}{stmt}
assign_stmt			{identifier}{assign}{expr}
stmt 				{assign_stmt}|{if_stmt}|{loop_stmt}|{read_stmt}|{write_stmt}|{compound_stmt}
stmt_list			{stmt_list}";"{stmt}|{stmt}
compound_stmt		{begin}{stmt_list}{end}
%%
{addop}         		{printf("ADDOP ");}
{relop}         		{printf("RELOP ");}
{mulop}         		{printf("MULOP ");}
{type}          		{printf("TYPE ");}
{identifier}    		{printf("IDENTIFIER ");}
{integer_constant}    	{printf("INTEGER_CONSTANT ");}
{real_constant}	    	{printf("REAL_CONSTANT ");}
{char_constant}    		{printf("CHAR_CONSTANT ");}
{if}    				{printf("IF ");}
{else}    				{printf("ELSE ");}
{then}    				{printf("THEN ");}
{while}    				{printf("WHILE ");}
{begin}    				{printf("BEGIN ");}
{until}    				{printf("UNTIL ");}
{end}    				{printf("END ");}
{do}    				{printf("DO ");}
{cond}    				{printf("COND ");}
%%
#include<stdio.h>

int yywrap(){
    return 1;
}

int main(int argc, char** argv){
    yylex();
    return 0;
}