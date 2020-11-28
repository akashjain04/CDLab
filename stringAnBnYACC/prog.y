%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char* msg);
%}
%token A B NL
%%
stmt:S NL {printf("Valid String\n"); exit(0);};
S: A S B
 |
 ;
%%
int yyerror(char* msg){
	printf("Invalid String\n");
	exit(0);
}
int main(){
	printf("Enter the statement here:\n");
	yyparse();
	return(0);
}

