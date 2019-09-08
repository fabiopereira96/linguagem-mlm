ADDOP   "+"|"-"|"OR"
RELOP   "="|"<"|"<="|">"|">="|"!="|"NOT"
MULOP   "*"|"/"|"DIV"|"MOD"|"AND"
TYPE    "integer"|"real"|"boolean"|"char"
INTEGER [0-9]+
DECIMAL   [0-9]*"."[0-9]*
IDENTIFIER [a-zA-Z][a-zA-Z0-9_]*
%%
{INTEGER}       {printf("INTEGER ");}
{DECIMAL}       {printf("DECIMAL ");}
{ADDOP}         {printf("ADDOP ");}
{RELOP}         {printf("RELOP ");}
{MULOP}         {printf("MULOP ");}
{TYPE}          {printf("TYPE ");}
{IDENTIFIER}    {printf("IDENTIFIER ");}
%%
#include<stdio.h>

int yywrap(){
    return 1;
}

int main(int argc, char** argv){
    yylex();
    return 0;
}