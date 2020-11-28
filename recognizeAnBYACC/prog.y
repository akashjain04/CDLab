%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char* msg);
%}
%token A B NL
%%
stmt: A A A A A A A A A A S B NL {printf("Valid String\n"); exit(0);};
S: S A |
 ;
%%
int yyerror(char* msg){
	printf("Invalid String\n");
	exit(0);
}
int main(){
	printf("Enter the Statement here:\n");
	yyparse();
	return(0);
}

