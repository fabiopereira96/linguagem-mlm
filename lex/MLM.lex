ADDOP   "+"|"-"|"OR"
RELOP   "="|"<"|"<="|">"|">="|"!="|"NOT"
MULOP   "*"|"/"|"DIV"|"MOD"|"AND"
INTEGER [0-9]+
FLOAT   [0-9]*"."[0-9]*
IDENTIFIER [a-zA-Z][a-zA-Z0-9_]*
%%
{INTEGER} {printf("INTEGER ");}
{FLOAT} {printf("FLOAT ");}
{ADDOP} {printf("ADDOP ");}
{RELOP} {printf("RELOP ");}
{MULOP} {printf("MULOP ");}
{IDENTIFIER} {printf("IDENTIFIER ");}
%%
#include<stdio.h>

int yywrap(){
    return 1;
}

int main(int argc, char** argv){
    yylex();
    return 0;
}