%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror(char* msg);
	int count = 0;
%}
%token IF RELOP S NUMBER ID
%%
stmt:if_stmt{printf("The number of nested if statements = %d\n", count); exit(0);};
if_stmt: IF '(' cond ')' if_stmt{count++;}
       | S;
cond:x RELOP x;
x:ID
 |NUMBER;
%%

int yyerror(char* msg){
	printf("Invalid if statement\n");
	exit(0);
}
int main(){
	printf("Enter the Statement:\n");
	yyparse();
	return(0);
}
