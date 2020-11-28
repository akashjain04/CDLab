%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char* msg);
%}
%token NUMBER NL
%left '+''-'
%left '*''/'
%%
stmt:exp NL {printf("value=%d\n",$1);exit(0);};
exp: exp '+' exp {$$ = $1 + $3;}
   | exp '-' exp {$$ = $1 - $3;}
   | exp '*' exp {$$ = $1 * $3;}
   | exp '/' exp {if($3 == 0){
			printf("Divide by zero\n");
			exit(0);
			}
		 else $$ = $1 / $3;}
   | '('exp')' {$$ = $2;}
   | NUMBER {$$ = $1;};

%%
int yyerror(char* msg){
	printf("Invalid expression!\n");
	exit(0);
}
int main(){
	printf("Enter the Expression:\n");
	yyparse();
	return(0);
}
