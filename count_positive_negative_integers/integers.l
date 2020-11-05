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
    printf("Enter the data: "); 
    yylex(); 
    printf("\nNumber of negative integers = %d\npositive integers = %d\nnegative fractions = %d\npositive fractions = %d\n",ni,pi,nf,pf); 
} 
int yywrap(){ 
    return 1;   
}
