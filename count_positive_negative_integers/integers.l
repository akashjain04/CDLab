%{ 
    #include <stdio.h> 
    int ni=0,pi=0,nf=0,pf=0; 
%} 

%% 
-[0-9]+ {ni++;} 
[0-9]+ {pi++;} 
-[0-9]*\.[0-9]+ {nf++;} 
[0-9]*\.[0-9]+ {pf++;} 
%% 

int main() 
{ 
    printf("Enter the data:\t"); 
    yylex(); 
    printf("Number of negative integers=%d,positive integers=%d,negative fractions=%d,positive fractions=%d",ni,pi,nf,pf); 
} 
int yywrap(){ 
    return 1;   
}