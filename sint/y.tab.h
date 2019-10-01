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
    PROGRAM = 258,
    COMMA = 259,
    SINGLE_QUOTES = 260,
    SEMI_COLON = 261,
    ASSIGN = 262,
    BRACKET_OPEN = 263,
    BRACKET_CLOSE = 264,
    CURLY_BRACE_OPEN = 265,
    CURLY_BRACE_CLOSE = 266,
    BIG_BRACKET_OPEN = 267,
    BIG_BRACKET_CLOSE = 268,
    COLON = 269,
    ADDOP = 270,
    RELOP = 271,
    MULOP = 272,
    READ = 273,
    WRITE = 274,
    IF = 275,
    DO = 276,
    BEGIN_ = 277,
    END = 278,
    WHILE = 279,
    UNTIL = 280,
    IDENTIFIER = 281,
    INTEGER_C = 282,
    REAL_C = 283,
    CHAR_C = 284,
    BOOL_C = 285,
    THEN = 286,
    ELSE = 287
  };
#endif
/* Tokens.  */
#define PROGRAM 258
#define COMMA 259
#define SINGLE_QUOTES 260
#define SEMI_COLON 261
#define ASSIGN 262
#define BRACKET_OPEN 263
#define BRACKET_CLOSE 264
#define CURLY_BRACE_OPEN 265
#define CURLY_BRACE_CLOSE 266
#define BIG_BRACKET_OPEN 267
#define BIG_BRACKET_CLOSE 268
#define COLON 269
#define ADDOP 270
#define RELOP 271
#define MULOP 272
#define READ 273
#define WRITE 274
#define IF 275
#define DO 276
#define BEGIN_ 277
#define END 278
#define WHILE 279
#define UNTIL 280
#define IDENTIFIER 281
#define INTEGER_C 282
#define REAL_C 283
#define CHAR_C 284
#define BOOL_C 285
#define THEN 286
#define ELSE 287

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "sint.y" /* yacc.c:1909  */

  int intVal;
  char* dataType;
  char* strVal;
  float realVal;
  char charVal;

#line 126 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
