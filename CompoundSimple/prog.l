%{
	#include<stdio.h>
	int is_simple=1;
%}

%%
[ \t\n]+[aA][nN][dD][ \t\n]+ {is_simple=0;}
[ \t\n]+[oO][rR][ \t\n]+ {is_simple=0;}
[ \t\n]+[bB]+[uU]+[tT]+ {is_simple=0;}
. {;}
%%

int yywrap()
{
	return 1;
}
int main()
{
	int k;
	printf("Enter the sentence...at the end press ^d\n");
	yylex();
	if(is_simple == 1)
	{
		printf("\nGiven sentence is simple\n");
	}
	else
	{
		printf("\nGiven sentence is compound\n");
	}
}

