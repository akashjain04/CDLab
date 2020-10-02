%{ 
    #include<stdio.h> 
    int p=0,s=0; 
%} 

%% 
"printf" {fprintf(yyout,"writef"),p++;} 
"scanf" {fprintf(yyout,"readf"),s++;} 
%% 

int main(int argc,char *argv[]) 
{ 
    if(argc!=3) 
    { 
        printf("no sufficient arguments\n"); 
        exit(0); 
    } 
    yyin = fopen(argv[1],"r"); 
    yyout = fopen(argv[2],"w"); 
    yylex(); 
    printf("no of printf=%d\n",p); 
    printf("no of scanf=%d\n",s); 
} 
int yywrap() 
{ 
    return 1; 
}
