#include "../header/symbol.h"
#include <stdio.h>
#include "../header/testp1.h"


SymbolTable *tables[tableCount]; //list of pointers to any symbolTable in the tree

void testTree(){
  //create a tree of 20 nodes/hashtables
  createTree();

  //Print the path from every node to the root
  for(int i=0; i<tableCount; i++){
    printf("/*******Table number %d*******\\\n\n", i);
    dumpSymbolTable(tables[i]);
    printf("\n\n\n\n\n\n\n");
  }

  //extract some things from the table
	SYMBOL* s = getSymbol(tables[17],"1y1y");
	if(s !=NULL)
	  printf("1y1y from table 17: (%s,%d)\n", s->name,s->value);
	else
    printf("No symbol found\n");
  s=getSymbol(tables[17],"0y0y");
	if(s !=NULL)
	  printf("0y0y from table 17: (%s,%d)\n", s->name,s->value);
	else
    printf("No symbol found\n");

	s=getSymbol(tables[17],"220y220y");
	if(s !=NULL)
	  printf("220y220y from table 17: (%s,%d)\n", s->name,s->value);
	else
    printf("No symbol found\n");

	s=getSymbol(tables[18],"220y220y");
	if(s !=NULL)
	  printf("220y220y from table 18: (%s,%d)\n", s->name,s->value);
	else
    printf("No symbol found\n");
	s=getSymbol(tables[1],"220y220y");
	if(s !=NULL)
	  printf("220y220y from table 1: (%s,%d)\n", s->name,s->value);
	else
    printf("No symbol found\n");
  s=getSymbol(tables[1],"220y2201y");
  	if(s !=NULL)
  	  printf("220y2201y from table 1: (%s,%d)\n", s->name,s->value);
  	else
      printf("220y2201y from table 1: No symbol found\n");



}


void createTree(){
  char* words[500] = {"0y0y", "1y1y", "2y2y", "3y3y", "4y4y", "5y5y", "6y6y", "7y7y", "8y8y", "9y9y", "10y10y", "11y11y", "12y12y", "13y13y", "14y14y", "15y15y", "16y16y", "17y17y", "18y18y", "19y19y", "20y20y", "21y21y", "22y22y", "23y23y", "24y24y", "25y25y", "26y26y", "27y27y", "28y28y", "29y29y", "30y30y", "31y31y", "32y32y", "33y33y", "34y34y", "35y35y", "36y36y", "37y37y", "38y38y", "39y39y", "40y40y", "41y41y", "42y42y", "43y43y", "44y44y", "45y45y", "46y46y", "47y47y", "48y48y", "49y49y", "50y50y", "51y51y", "52y52y", "53y53y", "54y54y", "55y55y", "56y56y", "57y57y", "58y58y", "59y59y", "60y60y", "61y61y", "62y62y", "63y63y", "64y64y", "65y65y", "66y66y", "67y67y", "68y68y", "69y69y", "70y70y", "71y71y", "72y72y", "73y73y", "74y74y", "75y75y", "76y76y", "77y77y", "78y78y", "79y79y", "80y80y", "81y81y", "82y82y", "83y83y", "84y84y", "85y85y", "86y86y", "87y87y", "88y88y", "89y89y", "90y90y", "91y91y", "92y92y", "93y93y", "94y94y", "95y95y", "96y96y", "97y97y", "98y98y", "99y99y", "100y100y", "101y101y", "102y102y", "103y103y", "104y104y", "105y105y", "106y106y", "107y107y", "108y108y", "109y109y", "110y110y", "111y111y", "112y112y", "113y113y", "114y114y", "115y115y", "116y116y", "117y117y", "118y118y", "119y119y", "120y120y", "121y121y", "122y122y", "123y123y", "124y124y", "125y125y", "126y126y", "127y127y", "128y128y", "129y129y", "130y130y", "131y131y", "132y132y", "133y133y", "134y134y", "135y135y", "136y136y", "137y137y", "138y138y", "139y139y", "140y140y", "141y141y", "142y142y", "143y143y", "144y144y", "145y145y", "146y146y", "147y147y", "148y148y", "149y149y", "150y150y", "151y151y", "152y152y", "153y153y", "154y154y", "155y155y", "156y156y", "157y157y", "158y158y", "159y159y", "160y160y", "161y161y", "162y162y", "163y163y", "164y164y", "165y165y", "166y166y", "167y167y", "168y168y", "169y169y", "170y170y", "171y171y", "172y172y", "173y173y", "174y174y", "175y175y", "176y176y", "177y177y", "178y178y", "179y179y", "180y180y", "181y181y", "182y182y", "183y183y", "184y184y", "185y185y", "186y186y", "187y187y", "188y188y", "189y189y", "190y190y", "191y191y", "192y192y", "193y193y", "194y194y", "195y195y", "196y196y", "197y197y", "198y198y", "199y199y", "200y200y", "201y201y", "202y202y", "203y203y", "204y204y", "205y205y", "206y206y", "207y207y", "208y208y", "209y209y", "210y210y", "211y211y", "212y212y", "213y213y", "214y214y", "215y215y", "216y216y", "217y217y", "218y218y", "219y219y", "220y220y", "221y221y", "222y222y", "223y223y", "224y224y", "225y225y", "226y226y", "227y227y", "228y228y", "229y229y", "230y230y", "231y231y", "232y232y", "233y233y", "234y234y", "235y235y", "236y236y", "237y237y", "238y238y", "239y239y", "240y240y", "241y241y", "242y242y", "243y243y", "244y244y", "245y245y", "246y246y", "247y247y", "248y248y", "249y249y", "250y250y", "251y251y", "252y252y", "253y253y", "254y254y", "255y255y", "256y256y", "257y257y", "258y258y", "259y259y", "260y260y", "261y261y", "262y262y", "263y263y", "264y264y", "265y265y", "266y266y", "267y267y", "268y268y", "269y269y", "270y270y", "271y271y", "272y272y", "273y273y", "274y274y", "275y275y", "276y276y", "277y277y", "278y278y", "279y279y", "280y280y", "281y281y", "282y282y", "283y283y", "284y284y", "285y285y", "286y286y", "287y287y", "288y288y", "289y289y", "290y290y", "291y291y", "292y292y", "293y293y", "294y294y", "295y295y", "296y296y", "297y297y", "298y298y", "299y299y", "300y300y", "301y301y", "302y302y", "303y303y", "304y304y", "305y305y", "306y306y", "307y307y", "308y308y", "309y309y", "310y310y", "311y311y", "312y312y", "313y313y", "314y314y", "315y315y", "316y316y", "317y317y", "318y318y", "319y319y", "320y320y", "321y321y", "322y322y", "323y323y", "324y324y", "325y325y", "326y326y", "327y327y", "328y328y", "329y329y", "330y330y", "331y331y", "332y332y", "333y333y", "334y334y", "335y335y", "336y336y", "337y337y", "338y338y", "339y339y", "340y340y", "341y341y", "342y342y", "343y343y", "344y344y", "345y345y", "346y346y", "347y347y", "348y348y", "349y349y", "350y350y", "351y351y", "352y352y", "353y353y", "354y354y", "355y355y", "356y356y", "357y357y", "358y358y", "359y359y", "360y360y", "361y361y", "362y362y", "363y363y", "364y364y", "365y365y", "366y366y", "367y367y", "368y368y", "369y369y", "370y370y", "371y371y", "372y372y", "373y373y", "374y374y", "375y375y", "376y376y", "377y377y", "378y378y", "379y379y", "380y380y", "381y381y", "382y382y", "383y383y", "384y384y", "385y385y", "386y386y", "387y387y", "388y388y", "389y389y", "390y390y", "391y391y", "392y392y", "393y393y", "394y394y", "395y395y", "396y396y", "397y397y", "398y398y", "399y399y", "400y400y", "401y401y", "402y402y", "403y403y", "404y404y", "405y405y", "406y406y", "407y407y", "408y408y", "409y409y", "410y410y", "411y411y", "412y412y", "413y413y", "414y414y", "415y415y", "416y416y", "417y417y", "418y418y", "419y419y", "420y420y", "421y421y", "422y422y", "423y423y", "424y424y", "425y425y", "426y426y", "427y427y", "428y428y", "429y429y", "430y430y", "431y431y", "432y432y", "433y433y", "434y434y", "435y435y", "436y436y", "437y437y", "438y438y", "439y439y", "440y440y", "441y441y", "442y442y", "443y443y", "444y444y", "445y445y", "446y446y", "447y447y", "448y448y", "449y449y", "450y450y", "451y451y", "452y452y", "453y453y", "454y454y", "455y455y", "456y456y", "457y457y", "458y458y", "459y459y", "460y460y", "461y461y", "462y462y", "463y463y", "464y464y", "465y465y", "466y466y", "467y467y", "468y468y", "469y469y", "470y470y", "471y471y", "472y472y", "473y473y", "474y474y", "475y475y", "476y476y", "477y477y", "478y478y", "479y479y", "480y480y", "481y481y", "482y482y", "483y483y", "484y484y", "485y485y", "486y486y", "487y487y", "488y488y", "489y489y", "490y490y", "491y491y", "492y492y", "493y493y", "494y494y", "495y495y", "496y496y", "497y497y", "498y498y", "499y499y"};
  SymbolTable *tableRoot = initSymbolTable();
  tables[0] = tableRoot;

  //create tables
  for(int i = 1; i < tableCount; i++){
    //for each new table find a speudorandom existing parent
    int j = 1; //randomization factor for finding parent
    int parentIndex = (i-j)*3 %20;
    while(tables[parentIndex] == NULL){
      j++;
      parentIndex = (i-j)*3 % 20;
    }
    //save child in list of tables for easy access
    tables[i] = scopeSymbolTable(tables[parentIndex]);
  }

  //insert 25 symbols into each table
  int j = -1;
  for(int i = 0; i<wordCount; i++){
    if((i % (wordCount/20)) == 0){
      j++;
      j = j%20;
    }
    putSymbol(tables[j], words[i], i, var); //add symbol to table
  }

  //add 1 string from each table to each table, including a repetition
  for(int i = 0; i<wordCount/20; i++){
    for(int j = 0; j<20; j++){
      putSymbol(tables[j], words[i*20], i+j*10000, var); //add symbol to table
    }
  }

  //add all the strings of table 0 to table 0 again (with new value)
  for(int i = 0; i<wordCount/20; i++){
    for(int j = 0; j<20; j++){
      putSymbol(tables[0], words[i], i+j*900000, var); //add symbol to table
    }
  }

}
