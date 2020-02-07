%{
    #include "translator.tab.h"
    #include <string.h>
    #include <stdlib.h>
void yyerror (char *s);
int yylex();
%}
%%
koul|kolou|n3es|n3so|fi9|fi9ou|chrb|chrbo|d7k|d7ko|hrb|hrbo|l3b|l3bo|drb|drbo|ktb|ktbo|sm3|sm3o|ch3l|ch3lo|tfi|tfiw|7sb|7sbo|3awd|3awdo|lbss|lbssou|7bs|7bsou|glss|glssou {yylval.stringValue=strdup(yytext);return VERBE;}
atansiou|attanssiyou|aurjou3|babor|balcone|baliza|ballone|balone|balto|banda|banka|barabole|barassioun|barbrise|bariziana|barmeta|barra|barteyya|bart9iz|barwita {yylval.stringValue=strdup(yytext);return NOM;}
knt|knti|kan|kant|knna|kntou|kanou {yylval.stringValue=strdup(yytext);return ETRE_IMPARFAIT;}
ana|howa|hia|nta|ntia|7na|houma|ntouma|nti {yylval.stringValue=strdup(yytext);return PRONOM;}
ghayb|ghayba|ghaybin|ghaybat|ji3an|ji3ana|ji3anin|ji3anate|m3etel|m3etela|m3telin|m3etelat|9dim|9dima|9damin|9damat|momil|momila|momilin|momilate|fr7an|fr7ana|fr7anin|fr7anat|mchoki|mchokia|mchokin|zwin|zwina|zwinin|zwinat {yylval.stringValue=strdup(yytext);return ADJECTIF;}
[ \t\n]                ;
.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap () {
    return 1;
}

