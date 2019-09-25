/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    COMMA = 258,
    SINGLE_QUOTES = 259,
    SEMI_COLON = 260,
    ASSIGN = 261,
    BRACKET_OPEN = 262,
    BRACKET_CLOSE = 263,
    CURLY_BRACE_OPEN = 264,
    CURLY_BRACE_CLOSE = 265,
    BIG_BRACKET_OPEN = 266,
    BIG_BRACKET_CLOSE = 267,
    ADDOP = 268,
    RELOP = 269,
    MULOP = 270,
    IDENTIFIER = 271,
    INTEGER_C = 272,
    REAL_C = 273,
    CHAR_C = 274,
    BOOL_C = 275
  };
#endif
/* Tokens.  */
#define COMMA 258
#define SINGLE_QUOTES 259
#define SEMI_COLON 260
#define ASSIGN 261
#define BRACKET_OPEN 262
#define BRACKET_CLOSE 263
#define CURLY_BRACE_OPEN 264
#define CURLY_BRACE_CLOSE 265
#define BIG_BRACKET_OPEN 266
#define BIG_BRACKET_CLOSE 267
#define ADDOP 268
#define RELOP 269
#define MULOP 270
#define IDENTIFIER 271
#define INTEGER_C 272
#define REAL_C 273
#define CHAR_C 274
#define BOOL_C 275

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 11 "sint.y" /* yacc.c:1909  */

  int intVal;
  char* dataType;
  char* strVal;
  float realVal;
  char charVal;

#line 102 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
