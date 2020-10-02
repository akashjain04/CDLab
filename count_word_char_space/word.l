%{ 
    #include<stdio.h> 
    int c=0,w=0,s=0,l=0; 
%} 

word [^ \t\n,\:;]+ 
eol [\n] 
blank [ ] 

%% 
{word} {w++; c=c+yyleng;} 
{eol} {l++;} 
{blank} {s++;} 
. {c++;} 
%% 

int yywrap() 
{ 
    return 1; 
} 
int main(int argc,char *argv[]){ 
    if(argc!=2){ 
        printf("A textfile is needed as an input\n"); 
        exit(0); 
    } 
    yyin=fopen(argv[1],"r"); 
    yylex(); 
    printf("words=%d\ncharacters=%d\nspace=%d\nlines=%d",w,c,s,l); 
} 