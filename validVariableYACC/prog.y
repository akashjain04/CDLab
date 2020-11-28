%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char* msg);
%}
%token DIGIT LETTER NL UND
%%
stmt:variable NL {printf("Valid Variable\n"); exit(0);};
variable:LETTER an;
an:LETTER an
  |DIGIT an
  |UND an
  |LETTER
  |DIGIT
  |UND;
%%
int yyerror(char* msg){
	printf("Invalid Variable\n");
	exit(0);
}
int main(){
	printf("Enter the Variable:\n");
	yyparse();
	return(0);
}
