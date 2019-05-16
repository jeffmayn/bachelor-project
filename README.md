# Bachelor-project

Gruppe 2:
---------------------------------------
* Andreas Holm Jørgensen, andjo16
* Mads Kempf, makem16
* Jeff Gyldenbrand Skov Jørgensen, jegyl16

Oversætteren findes som binær fil på topniveu i denne mappe.

Oversætteren køres almindeligt med kommandoen  
```
./compiler  
```
Input programmet, der skal oversættes, læses fra standard input.  
Output assembler programmet skrives til standard output.  
Evt. fejlmeddelelser skrives til standard error.  

Oversætteren kan køres med følgende flag  
-dBODY (printer det abstrakte syntakstræ for programmet, genereret under oversættelsen, med typer)  
-dASM (printer den interne repræsentation af det genererede assemblerprogram)  
-noRUNCHECK (oversætter programmet uden at indsætte runtimecheck)  
-noOPTIMIZE (oversætter programmet uden at udføre liveness analyse og peephole optimering)  

Alle flag kan bruges i den kombination der ønskes.

Ønskes oversætteren oversat til binær på ny, kan dette gøres med de følgende kommandoer fra mappen compiler (topniveau)`
```
make parser  
make
```
Kommandoen 'make parser' oversætter scanneren og parseren til lex.yy.c, y.tab.h og y.tab.c og lægger dem i mappen src/scanParse  
Kommandoen 'make' genererer en build-mappe på top-niveau med oversætteren som binær fil kaldet compiler


Ønskes oversætteren oversat på ny fra bunden kan dette gøres med  
```
make cleanParser  
make clean  
```
efterfulgt af de før beskrevne kommandoer

Egne Tests  
Der medfølger et udkast til en test suite som ligger i mappen test.  
Det kan køres ved at stå i mappen test og køre kommandoen:  
```
./testSuite.sh
```  
Det crasher en gang imellem så vi anbefaler man køre  
```
./testSuite.sh clean
```  
efter hver kørsel.