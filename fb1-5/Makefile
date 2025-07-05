fb1-5: fb1-5.y fb1-5.l
       bison -d fb1-5.y
       flex fb1-5.l
       gcc -o $@ fb1-5.tab.c lex.yy.c -lfl
