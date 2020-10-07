%{
	#include<stdio.h>
	int vowels = 0;
	int consonants = 0;
%}
%%
[aeiouAEIOU] { vowels++; }
[a-zA-Z] { consonants++; }
%%
int main(){
	printf("Enter the string: ");
	yylex(); // To start scanning process
	printf("Vowels = %d, Consonants = %d", vowels, consonants);
}
int yywrap(){
	return 1;
}
