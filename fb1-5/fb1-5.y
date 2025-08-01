%{
#include <stdio.h>
int yylex(void);
void yyerror(char *s);
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP

%%
calclist:
        /* empty */
        | calclist exp EOL { printf("= %d\n", $2); }
        ;

exp:
        factor { $$ = $1; }
        | exp ADD factor { $$ = $1 + $3; }
        | exp SUB factor { $$ = $1 - $3; }
        ;

factor:
        term { $$ = $1; }
        | factor MUL term { $$ = $1 * $3; }
        | factor DIV term { $$ = $1 / $3; }
        ;

term:
        NUMBER { $$ = $1; }
        | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
        ;
%%
int main(int argc, char **argv)
{
    yyparse();
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
