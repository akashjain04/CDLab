%{
   #include<stdio.h>
   #include<stdlib.h>
%}
%token NUMBER ID NL
%left '+''-'
%left '*''/'
%%
stmt:exp NL {printf("Valid Expression!\n");exit(0);};
exp: exp'+'exp
   | exp'*'exp
   | exp'/'exp
   | '('exp')'
   | ID
   | NUMBER;
%%
void yyerror(char* msg){
	printf("Invalid Expression\n");
	exit(0);
}
int main(){
	printf("Enter the Expression:\n");
	yyparse();
	return(0);
}
