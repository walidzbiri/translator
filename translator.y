%{
void yyerror (char *s);
int yylex();
#include <stdlib.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
void translate1(char* one);
char * printFrenchEq(char *klma);
char * klma;

%}

%start line
%token exit_command
%token ADJECTIF VERBE PRONOM ADVERBE NOM ETRE_IMPARFAIT

%union {
	char* stringValue;
}
%type<stringValue> ETRE_IMPARFAIT ADJECTIF VERBE PRONOM ADVERBE NOM

%%

/* descriptions of expected inputs     corresponding actions (in C) */

line    : phrase1 		{;}
		| phrase2		{;}
		| exit_command		{exit(EXIT_SUCCESS);}
		| line phrase1 	{;}
		| line phrase2 	{;}
		| line exit_command 	{exit(EXIT_SUCCESS);}
        ;
phrase1	: VERBE {translate1($1);}
        | PRONOM {translate1($1);}
        | ADVERBE {translate1($1);}
		| ADJECTIF {translate1($1);}
		| NOM {translate1($1);}
		| ETRE_IMPARFAIT {translate1($1);}
        ;
phrase2 : phrase1 phrase1 {printf("\n");}
		;

%%                     /* C code */

void translate1(char *one) {
	klma = one;
	printFrenchEq(klma);
}

char * printFrenchEq(char *klma){
	FILE *file;
	char buffer[255];
	file = fopen("kalimat.txt", "r");
	

	while (fgets(buffer, 255, file)) {
		if (strstr(buffer, klma) != NULL) {
			int length = strlen(klma);
			char *start = &buffer[length + 3];
			char *end = &buffer[253];
			char mot[255], actualMot[255];
			memcpy(mot, start, end - start);int i;
			for(i = 0; i < strlen(mot); i++) {
				if(mot[i] == '\n') {
					break;
				}
				printf("%c", mot[i]);
				
			}
			printf(" ");
			fclose(file);
			break;
		}
	}
}


int main (void) {
	return yyparse();
	/*
		phrase3	: PRONOM phrase2 {translate1($1);printf("\n");}
        ;
phrase4	: phrase3 ADJECTIF {translate1($2);printf("\n");}
	    ;
phrase5	: phrase4 ADVERBE {translate1($2);printf("\n");}
        ;
	*/
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 