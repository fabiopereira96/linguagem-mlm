all:
	lex lex.l
	yacc -d sint.y
	cc lex.yy.c y.tab.c
free:
	rm a.out* lex.yy.c