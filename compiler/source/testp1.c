#include "../header/symbol.h"
#include <stdio.h>
#include "../header/testp1.h"


SymbolTable *tables[tableCount]; //list of pointers to any symbolTable in the tree

void testTree(){
  printf("Hej\n");
  SymbolTable *table = initSymbolTable();
  printf("Symboltable = %p\n", (void*) table);
  SymbolTable *childTable = scopeSymbolTable(table);
  printf("Child Symboltable = %p\n", (void*) childTable);
  printf("parent of child Symboltable = %p\n", (void*) childTable->next);
  dumpSymbolTable(childTable);

  for(int i = 0; i<20; i++){
    //s = itoa(i,s,DECIMAL);
    putSymbol(table, "blah" , i);
  }
  putSymbol(table, "ikke chained", 42);
  for(int i = 0; i<16; i++){
    //s = itoa(i,s,DECIMAL);
    putSymbol(childTable, "blah2", i);
  }
  dumpSymbolTable(childTable);

  createTree();

  for(int i=0; i<tableCount; i++){
    printf("Table number %d\n", i);
    dumpSymbolTable(tables[i]);
    printf("\n\n\n\n\n\n\n");
  }
	
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
  


}


void createTree(){
  char* words[500] = {"0y0y", "1y1y", "2y2y", "3y3y", "4y4y", "5y5y", "6y6y", "7y7y", "8y8y", "9y9y", "10y10y", "11y11y", "12y12y", "13y13y", "14y14y", "15y15y", "16y16y", "17y17y", "18y18y", "19y19y", "20y20y", "21y21y", "22y22y", "23y23y", "24y24y", "25y25y", "26y26y", "27y27y", "28y28y", "29y29y", "30y30y", "31y31y", "32y32y", "33y33y", "34y34y", "35y35y", "36y36y", "37y37y", "38y38y", "39y39y", "40y40y", "41y41y", "42y42y", "43y43y", "44y44y", "45y45y", "46y46y", "47y47y", "48y48y", "49y49y", "50y50y", "51y51y", "52y52y", "53y53y", "54y54y", "55y55y", "56y56y", "57y57y", "58y58y", "59y59y", "60y60y", "61y61y", "62y62y", "63y63y", "64y64y", "65y65y", "66y66y", "67y67y", "68y68y", "69y69y", "70y70y", "71y71y", "72y72y", "73y73y", "74y74y", "75y75y", "76y76y", "77y77y", "78y78y", "79y79y", "80y80y", "81y81y", "82y82y", "83y83y", "84y84y", "85y85y", "86y86y", "87y87y", "88y88y", "89y89y", "90y90y", "91y91y", "92y92y", "93y93y", "94y94y", "95y95y", "96y96y", "97y97y", "98y98y", "99y99y", "100y100y", "101y101y", "102y102y", "103y103y", "104y104y", "105y105y", "106y106y", "107y107y", "108y108y", "109y109y", "110y110y", "111y111y", "112y112y", "113y113y", "114y114y", "115y115y", "116y116y", "117y117y", "118y118y", "119y119y", "120y120y", "121y121y", "122y122y", "123y123y", "124y124y", "125y125y", "126y126y", "127y127y", "128y128y", "129y129y", "130y130y", "131y131y", "132y132y", "133y133y", "134y134y", "135y135y", "136y136y", "137y137y", "138y138y", "139y139y", "140y140y", "141y141y", "142y142y", "143y143y", "144y144y", "145y145y", "146y146y", "147y147y", "148y148y", "149y149y", "150y150y", "151y151y", "152y152y", "153y153y", "154y154y", "155y155y", "156y156y", "157y157y", "158y158y", "159y159y", "160y160y", "161y161y", "162y162y", "163y163y", "164y164y", "165y165y", "166y166y", "167y167y", "168y168y", "169y169y", "170y170y", "171y171y", "172y172y", "173y173y", "174y174y", "175y175y", "176y176y", "177y177y", "178y178y", "179y179y", "180y180y", "181y181y", "182y182y", "183y183y", "184y184y", "185y185y", "186y186y", "187y187y", "188y188y", "189y189y", "190y190y", "191y191y", "192y192y", "193y193y", "194y194y", "195y195y", "196y196y", "197y197y", "198y198y", "199y199y", "200y200y", "201y201y", "202y202y", "203y203y", "204y204y", "205y205y", "206y206y", "207y207y", "208y208y", "209y209y", "210y210y", "211y211y", "212y212y", "213y213y", "214y214y", "215y215y", "216y216y", "217y217y", "218y218y", "219y219y", "220y220y", "221y221y", "222y222y", "223y223y", "224y224y", "225y225y", "226y226y", "227y227y", "228y228y", "229y229y", "230y230y", "231y231y", "232y232y", "233y233y", "234y234y", "235y235y", "236y236y", "237y237y", "238y238y", "239y239y", "240y240y", "241y241y", "242y242y", "243y243y", "244y244y", "245y245y", "246y246y", "247y247y", "248y248y", "249y249y", "250y250y", "251y251y", "252y252y", "253y253y", "254y254y", "255y255y", "256y256y", "257y257y", "258y258y", "259y259y", "260y260y", "261y261y", "262y262y", "263y263y", "264y264y", "265y265y", "266y266y", "267y267y", "268y268y", "269y269y", "270y270y", "271y271y", "272y272y", "273y273y", "274y274y", "275y275y", "276y276y", "277y277y", "278y278y", "279y279y", "280y280y", "281y281y", "282y282y", "283y283y", "284y284y", "285y285y", "286y286y", "287y287y", "288y288y", "289y289y", "290y290y", "291y291y", "292y292y", "293y293y", "294y294y", "295y295y", "296y296y", "297y297y", "298y298y", "299y299y", "300y300y", "301y301y", "302y302y", "303y303y", "304y304y", "305y305y", "306y306y", "307y307y", "308y308y", "309y309y", "310y310y", "311y311y", "312y312y", "313y313y", "314y314y", "315y315y", "316y316y", "317y317y", "318y318y", "319y319y", "320y320y", "321y321y", "322y322y", "323y323y", "324y324y", "325y325y", "326y326y", "327y327y", "328y328y", "329y329y", "330y330y", "331y331y", "332y332y", "333y333y", "334y334y", "335y335y", "336y336y", "337y337y", "338y338y", "339y339y", "340y340y", "341y341y", "342y342y", "343y343y", "344y344y", "345y345y", "346y346y", "347y347y", "348y348y", "349y349y", "350y350y", "351y351y", "352y352y", "353y353y", "354y354y", "355y355y", "356y356y", "357y357y", "358y358y", "359y359y", "360y360y", "361y361y", "362y362y", "363y363y", "364y364y", "365y365y", "366y366y", "367y367y", "368y368y", "369y369y", "370y370y", "371y371y", "372y372y", "373y373y", "374y374y", "375y375y", "376y376y", "377y377y", "378y378y", "379y379y", "380y380y", "381y381y", "382y382y", "383y383y", "384y384y", "385y385y", "386y386y", "387y387y", "388y388y", "389y389y", "390y390y", "391y391y", "392y392y", "393y393y", "394y394y", "395y395y", "396y396y", "397y397y", "398y398y", "399y399y", "400y400y", "401y401y", "402y402y", "403y403y", "404y404y", "405y405y", "406y406y", "407y407y", "408y408y", "409y409y", "410y410y", "411y411y", "412y412y", "413y413y", "414y414y", "415y415y", "416y416y", "417y417y", "418y418y", "419y419y", "420y420y", "421y421y", "422y422y", "423y423y", "424y424y", "425y425y", "426y426y", "427y427y", "428y428y", "429y429y", "430y430y", "431y431y", "432y432y", "433y433y", "434y434y", "435y435y", "436y436y", "437y437y", "438y438y", "439y439y", "440y440y", "441y441y", "442y442y", "443y443y", "444y444y", "445y445y", "446y446y", "447y447y", "448y448y", "449y449y", "450y450y", "451y451y", "452y452y", "453y453y", "454y454y", "455y455y", "456y456y", "457y457y", "458y458y", "459y459y", "460y460y", "461y461y", "462y462y", "463y463y", "464y464y", "465y465y", "466y466y", "467y467y", "468y468y", "469y469y", "470y470y", "471y471y", "472y472y", "473y473y", "474y474y", "475y475y", "476y476y", "477y477y", "478y478y", "479y479y", "480y480y", "481y481y", "482y482y", "483y483y", "484y484y", "485y485y", "486y486y", "487y487y", "488y488y", "489y489y", "490y490y", "491y491y", "492y492y", "493y493y", "494y494y", "495y495y", "496y496y", "497y497y", "498y498y", "499y499y"};
  //char* words[500] = {"0-0-0-", "1-1-1-", "2-2-2-", "3-3-3-", "4-4-4-", "5-5-5-", "6-6-6-", "7-7-7-", "8-8-8-", "9-9-9-", "10-10-10-", "11-11-11-", "12-12-12-", "13-13-13-", "14-14-14-", "15-15-15-", "16-16-16-", "17-17-17-", "18-18-18-", "19-19-19-", "20-20-20-", "21-21-21-", "22-22-22-", "23-23-23-", "24-24-24-", "25-25-25-", "26-26-26-", "27-27-27-", "28-28-28-", "29-29-29-", "30-30-30-", "31-31-31-", "32-32-32-", "33-33-33-", "34-34-34-", "35-35-35-", "36-36-36-", "37-37-37-", "38-38-38-", "39-39-39-", "40-40-40-", "41-41-41-", "42-42-42-", "43-43-43-", "44-44-44-", "45-45-45-", "46-46-46-", "47-47-47-", "48-48-48-", "49-49-49-", "50-50-50-", "51-51-51-", "52-52-52-", "53-53-53-", "54-54-54-", "55-55-55-", "56-56-56-", "57-57-57-", "58-58-58-", "59-59-59-", "60-60-60-", "61-61-61-", "62-62-62-", "63-63-63-", "64-64-64-", "65-65-65-", "66-66-66-", "67-67-67-", "68-68-68-", "69-69-69-", "70-70-70-", "71-71-71-", "72-72-72-", "73-73-73-", "74-74-74-", "75-75-75-", "76-76-76-", "77-77-77-", "78-78-78-", "79-79-79-", "80-80-80-", "81-81-81-", "82-82-82-", "83-83-83-", "84-84-84-", "85-85-85-", "86-86-86-", "87-87-87-", "88-88-88-", "89-89-89-", "90-90-90-", "91-91-91-", "92-92-92-", "93-93-93-", "94-94-94-", "95-95-95-", "96-96-96-", "97-97-97-", "98-98-98-", "99-99-99-", "100-100-100-", "101-101-101-", "102-102-102-", "103-103-103-", "104-104-104-", "105-105-105-", "106-106-106-", "107-107-107-", "108-108-108-", "109-109-109-", "110-110-110-", "111-111-111-", "112-112-112-", "113-113-113-", "114-114-114-", "115-115-115-", "116-116-116-", "117-117-117-", "118-118-118-", "119-119-119-", "120-120-120-", "121-121-121-", "122-122-122-", "123-123-123-", "124-124-124-", "125-125-125-", "126-126-126-", "127-127-127-", "128-128-128-", "129-129-129-", "130-130-130-", "131-131-131-", "132-132-132-", "133-133-133-", "134-134-134-", "135-135-135-", "136-136-136-", "137-137-137-", "138-138-138-", "139-139-139-", "140-140-140-", "141-141-141-", "142-142-142-", "143-143-143-", "144-144-144-", "145-145-145-", "146-146-146-", "147-147-147-", "148-148-148-", "149-149-149-", "150-150-150-", "151-151-151-", "152-152-152-", "153-153-153-", "154-154-154-", "155-155-155-", "156-156-156-", "157-157-157-", "158-158-158-", "159-159-159-", "160-160-160-", "161-161-161-", "162-162-162-", "163-163-163-", "164-164-164-", "165-165-165-", "166-166-166-", "167-167-167-", "168-168-168-", "169-169-169-", "170-170-170-", "171-171-171-", "172-172-172-", "173-173-173-", "174-174-174-", "175-175-175-", "176-176-176-", "177-177-177-", "178-178-178-", "179-179-179-", "180-180-180-", "181-181-181-", "182-182-182-", "183-183-183-", "184-184-184-", "185-185-185-", "186-186-186-", "187-187-187-", "188-188-188-", "189-189-189-", "190-190-190-", "191-191-191-", "192-192-192-", "193-193-193-", "194-194-194-", "195-195-195-", "196-196-196-", "197-197-197-", "198-198-198-", "199-199-199-", "200-200-200-", "201-201-201-", "202-202-202-", "203-203-203-", "204-204-204-", "205-205-205-", "206-206-206-", "207-207-207-", "208-208-208-", "209-209-209-", "210-210-210-", "211-211-211-", "212-212-212-", "213-213-213-", "214-214-214-", "215-215-215-", "216-216-216-", "217-217-217-", "218-218-218-", "219-219-219-", "220-220-220-", "221-221-221-", "222-222-222-", "223-223-223-", "224-224-224-", "225-225-225-", "226-226-226-", "227-227-227-", "228-228-228-", "229-229-229-", "230-230-230-", "231-231-231-", "232-232-232-", "233-233-233-", "234-234-234-", "235-235-235-", "236-236-236-", "237-237-237-", "238-238-238-", "239-239-239-", "240-240-240-", "241-241-241-", "242-242-242-", "243-243-243-", "244-244-244-", "245-245-245-", "246-246-246-", "247-247-247-", "248-248-248-", "249-249-249-", "250-250-250-", "251-251-251-", "252-252-252-", "253-253-253-", "254-254-254-", "255-255-255-", "256-256-256-", "257-257-257-", "258-258-258-", "259-259-259-", "260-260-260-", "261-261-261-", "262-262-262-", "263-263-263-", "264-264-264-", "265-265-265-", "266-266-266-", "267-267-267-", "268-268-268-", "269-269-269-", "270-270-270-", "271-271-271-", "272-272-272-", "273-273-273-", "274-274-274-", "275-275-275-", "276-276-276-", "277-277-277-", "278-278-278-", "279-279-279-", "280-280-280-", "281-281-281-", "282-282-282-", "283-283-283-", "284-284-284-", "285-285-285-", "286-286-286-", "287-287-287-", "288-288-288-", "289-289-289-", "290-290-290-", "291-291-291-", "292-292-292-", "293-293-293-", "294-294-294-", "295-295-295-", "296-296-296-", "297-297-297-", "298-298-298-", "299-299-299-", "300-300-300-", "301-301-301-", "302-302-302-", "303-303-303-", "304-304-304-", "305-305-305-", "306-306-306-", "307-307-307-", "308-308-308-", "309-309-309-", "310-310-310-", "311-311-311-", "312-312-312-", "313-313-313-", "314-314-314-", "315-315-315-", "316-316-316-", "317-317-317-", "318-318-318-", "319-319-319-", "320-320-320-", "321-321-321-", "322-322-322-", "323-323-323-", "324-324-324-", "325-325-325-", "326-326-326-", "327-327-327-", "328-328-328-", "329-329-329-", "330-330-330-", "331-331-331-", "332-332-332-", "333-333-333-", "334-334-334-", "335-335-335-", "336-336-336-", "337-337-337-", "338-338-338-", "339-339-339-", "340-340-340-", "341-341-341-", "342-342-342-", "343-343-343-", "344-344-344-", "345-345-345-", "346-346-346-", "347-347-347-", "348-348-348-", "349-349-349-", "350-350-350-", "351-351-351-", "352-352-352-", "353-353-353-", "354-354-354-", "355-355-355-", "356-356-356-", "357-357-357-", "358-358-358-", "359-359-359-", "360-360-360-", "361-361-361-", "362-362-362-", "363-363-363-", "364-364-364-", "365-365-365-", "366-366-366-", "367-367-367-", "368-368-368-", "369-369-369-", "370-370-370-", "371-371-371-", "372-372-372-", "373-373-373-", "374-374-374-", "375-375-375-", "376-376-376-", "377-377-377-", "378-378-378-", "379-379-379-", "380-380-380-", "381-381-381-", "382-382-382-", "383-383-383-", "384-384-384-", "385-385-385-", "386-386-386-", "387-387-387-", "388-388-388-", "389-389-389-", "390-390-390-", "391-391-391-", "392-392-392-", "393-393-393-", "394-394-394-", "395-395-395-", "396-396-396-", "397-397-397-", "398-398-398-", "399-399-399-", "400-400-400-", "401-401-401-", "402-402-402-", "403-403-403-", "404-404-404-", "405-405-405-", "406-406-406-", "407-407-407-", "408-408-408-", "409-409-409-", "410-410-410-", "411-411-411-", "412-412-412-", "413-413-413-", "414-414-414-", "415-415-415-", "416-416-416-", "417-417-417-", "418-418-418-", "419-419-419-", "420-420-420-", "421-421-421-", "422-422-422-", "423-423-423-", "424-424-424-", "425-425-425-", "426-426-426-", "427-427-427-", "428-428-428-", "429-429-429-", "430-430-430-", "431-431-431-", "432-432-432-", "433-433-433-", "434-434-434-", "435-435-435-", "436-436-436-", "437-437-437-", "438-438-438-", "439-439-439-", "440-440-440-", "441-441-441-", "442-442-442-", "443-443-443-", "444-444-444-", "445-445-445-", "446-446-446-", "447-447-447-", "448-448-448-", "449-449-449-", "450-450-450-", "451-451-451-", "452-452-452-", "453-453-453-", "454-454-454-", "455-455-455-", "456-456-456-", "457-457-457-", "458-458-458-", "459-459-459-", "460-460-460-", "461-461-461-", "462-462-462-", "463-463-463-", "464-464-464-", "465-465-465-", "466-466-466-", "467-467-467-", "468-468-468-", "469-469-469-", "470-470-470-", "471-471-471-", "472-472-472-", "473-473-473-", "474-474-474-", "475-475-475-", "476-476-476-", "477-477-477-", "478-478-478-", "479-479-479-", "480-480-480-", "481-481-481-", "482-482-482-", "483-483-483-", "484-484-484-", "485-485-485-", "486-486-486-", "487-487-487-", "488-488-488-", "489-489-489-", "490-490-490-", "491-491-491-", "492-492-492-", "493-493-493-", "494-494-494-", "495-495-495-", "496-496-496-", "497-497-497-", "498-498-498-", "499-499-499-", "500-500-500-"};
  //char* words[500] = {"IoIgvobF3X", "BU76Ai4byb", "cKWiADApfH", "ATi4msdbPQ", "4V83qmtChS", "umkF3dDYrI", "1t7rixGncC", "w0vSlfX0Pe", "ZIOMADfuxh", "mm5Xxxlkkl", "d3tm79naDh", "EoqqZcBDJR", "XQ4O4zbr1Y", "Xlr7lWGNHJ", "YNlNhfWQ3K", "8vuvestkxz", "5P6pNBHHMY", "HlEhFbley8", "b15ZnD51FU", "wlty95kzj1", "aP4sAuRccG", "smsqMQJnFg", "3awKKoMKNa", "AucxCcmri8", "I4h6QnfQUT", "Z2BeVuHW5S", "vhKvkpWPb3", "cAkEM2Jj1W", "94KuHZTdQq", "5xTCZ4KxBe", "Zg8ZhyAT2o", "0PlZ2z8XVI", "NZ2adOXOdb", "ixz9W1vQRW", "PfOEqvf7uy", "bbl5U5piNJ", "86eX9kykvZ", "PzSukIoSKj", "fmk1kgJT4I", "xBytPEF2t7", "R0BCNdQxIm", "uxtY7AAP7G", "nimNeoiHc7", "WJxtpRCrHL", "dUfIXHXjQ5", "rLhg4rapKj", "JqrLzBFVQ0", "U8SDhk60pY", "kBzDxmdO9M", "2vK0RoTzF9", "YfOC3Btjn2", "kQxv3EOmfW", "aBFvfs5d1r", "dfu800eG0I", "SaPJDbdVjs", "v4foEchvWm", "l7nxKsHb39", "hEehxUAsKg", "NU5JoAtbuI", "CaTQb9GkTk", "EBEvd9yWej", "PT5G3lR9mp", "trHZyqL88L", "3OaCpwlhtS", "GgXfDKKvy3", "fqwXT4k1wb", "UebchG3Bws", "44UZ8xE1dj", "AVWyO2kSJG", "eDoT6M3QOa", "zGAn5G09GK", "nZxGpufowm", "9Qkn3iwhWp", "S2nIabyGMn", "OeARvUeyMi", "34qyXeSDMu", "AK1qSSvkOk", "7cEbFW1Tvv", "W4UKoAtn01", "44Gh6RB1cW", "ScSbJp2azd", "uvm6cawM7M", "Q1du6ungtE", "wwSXlddKSs", "5BAAYfeKXk", "4pAbvwaGix", "8N7FQqJzXK", "rRlBsh9eTS", "u5gx742lDG", "zUlghrnydA", "HRLs2u4m2p", "HwVqMo4OI7", "oZxXb4vGme", "uNnPXlXXEC", "HLHoSUWLek", "eBMHJV4gVP", "0okpFyhqow", "a74nMBCoAZ", "cWVSjJpPzX", "DfVVXyyJDi", "IymXT9iPtb", "e0xis8qrLF", "hdXWaRVt57", "06llMYOlAU", "UKCgQ1qVZn", "wjCAwkeVWH", "t2daxJpI32", "oGR0I7bKI7", "Q9jNgfiLAd", "tk3yheDL6H", "gHf9Nsp2mV", "AuYE72ztAZ", "JH3Ojwoiuf", "l3uyhhlv8B", "moHSjLcn7o", "lOd2KvI9bg", "0pEFhYukYl", "A7l3Qw0Uca", "EaQBXS9fWM", "McYVizUbMQ", "RDNSSmdpKy", "GzoFJSri1w", "9md9v7inc0", "j4OqoUgAmV", "TgCZkPf9Jo", "zKvdlMGUav", "bYBLMGATEd", "2wYZ1QUUfB", "JXklFCyF3h", "DtLt3QVa98", "OlbMlbZk47", "LLRXKTehLr", "CN6T7kcYrF", "pshmntToRF", "IJPBMEeJYV", "j8lzZBbWAd", "E0bZnffyzC", "nOcktqdkVD", "siVtoDmEix", "t5RoGSr6Xd", "n1oNBzeezr", "LfhEvmTyGW", "SH22vcXDdx", "ueiHDWhpIx", "JJwckEwysr", "sqiCCP63lh", "4kipL557pe", "uzdMPrNVcX", "aTGNj55GFZ", "KnlnCUSCmM", "ePJ2FMxodk", "gccnyZyMDt", "CZvB1TULhs", "ADRi2Xtos2", "TXkOubR75m", "apAQxkPj30", "K44addeKkD", "pXkJVRswbo", "pu9fjES7ri", "PfNGrL5EyU", "SdxtHN8n0q", "N1eQfCJLCg", "71Sm0cJteX", "4mNCSCnDCP", "MV454KCS0t", "yOb11PMmuP", "BAWX1VVdYp", "YT6FbcEGi0", "9jmMZMG95c", "HY6YevSdAi", "7iBmG0TX4s", "k3eZB2ErWY", "opLaVshZPr", "9m69HE8PUa", "20o05VkzLq", "Ubq9f45zDe", "eixee9mJCj", "HM5X9gQ4Nm", "FJHVMWV8rd", "lxZ6hm351s", "fJqGdA0s13", "ldRORseoKT", "ghVB6yqNpY", "3RerLHVRp6", "453pqPm3JD", "izZEFJNtIk", "y2gCvWfyZt", "0e6CP1BqFR", "8weFbX1G8q", "8cIhWboXKj", "LE3SROJEsO", "GtUHICRJZF", "59pLODGfxJ", "MOSGzdlGma", "uOCei8SuJs", "aNmdJoNfvJ", "wTLzCboBjO", "MEyHCGy7YU", "VpbNlH9Z8C", "Hs8T9uPzaD", "CjD1qs7pvJ", "F5EqEJW5FR", "3fITy0eLjy", "e0Lg43Sgx7", "sHqbndXbxe", "F2Vm5AMT6W", "RgLzh9d5C5", "A3lWHjZQlj", "HsONHX8S3E", "ReF5stWzx9", "NGD5s9RZv2", "lSmR6DZxE5", "s89ytGAWAS", "UxOIEfNkZr", "g42U0FB4IN", "Z9JiGvf1tx", "wXd1uigzpF", "GLOZyzJPjh", "bmCyV0wWuu", "HBZGBETbrx", "wPmY5QFnUo", "tnT1xIIiOb", "Evef5O0FI5", "iHSrjPLDQU", "C5RCpWDQT6", "sRJwnfzmPi", "mFqbQzVVIU", "pyVMhmLZxZ", "BcwiBgSYRn", "X9lNXfvwhA", "bor3kVmuMj", "2jIX7UUla0", "ccQCBEd29f", "wUL0spUTt2", "MMg4B4BWj6", "XBdc379oXu", "jkiXABaJCj", "FDbJe3GFne", "Jg8MNlV8ED", "pSUmfNM9Ng", "WX1jG1us2n", "1OqliFeE9L", "jTYWSZlyRl", "Rzjs4812p2", "yQWO4OYqyt", "RgvRxUnt2D", "r0StpXEeDy", "zc0Dik01qV", "xY9ESAqdkX", "KRLowRUJzY", "yYWvsneCU5", "3XQEow3qDu", "39AzAjPWj4", "0m4oRnFORj", "TkOhfxsodc", "SHhwvSvlp7", "LxqWKKVsO5", "ToNitAZ0Ok", "SK2zJx0jmw", "zDBj4wSA5V", "jTaWCkErt7", "i1miGzEiXv", "wxF7FqNeKz", "ZPhEEvv5K6", "qiRKQY1Z5R", "ENi4ax8p2U", "Mgk84CcuMA", "TNaP4FMJ7A", "gi7DJdQOVw", "m7f9QNvJNb", "ZdMhibFRy8", "0ylROoWpfg", "fyuQ1Z6kBa", "5LL2DL82iL", "kapJKCa7G4", "vpdUYsiIae", "eSGJXPrpTk", "85uonS0fjw", "uidQOtzbFq", "m0iroAYdB1", "AgguU01FlE", "38zvN0KWdo", "UyD9YtMnWh", "x9Y3JuryQs", "lplpXYmrVO", "mBkE72oObx", "bhEQ9pRbiq", "rlvNJu2ASU", "iUnQcvqSPe", "GpHBtuEFAo", "55k8Zix44Q", "OWSjVvX6Oq", "JiLEJinDg4", "sUnyW193nF", "Cw2tybFi3z", "RMWIAwfZhz", "mVYiIrOII1", "y48AkdepOV", "XASFfyUpWK", "SXaYTcOUl2", "RYnUtazq02", "GTbuU7jSG6", "mHQgz9CIsX", "Pfu7g56Xn7", "pngJRBleJC", "U9BPuDKeAC", "S2UNDF3XMs", "csoGPIzEHu", "hNchco4MEv", "NEBRgkX6c0", "RgMRWyWNkr", "PtWaXGgvSg", "mNxSDG9ZK9", "74uGFRAmmE", "pRzuGFuDw1", "hVKGJEdkDa", "IicnxizbJQ", "3LVr2nrSq0", "GqZLFkpp1v", "ZkFH53HyrQ", "PFokl1umFv", "ady0h1ZYDU", "IcRvOXuWrk", "YjJXsWXsq2", "Zw4ezvO0u2", "CftJ9SbCae", "sMCxVoZcsZ", "INpZR9fD78", "T9hfceMx1k", "zx5YG60Xdk", "eth52g6uZW", "vFdWQJ3a2u", "6XHLTBl3Rc", "Bx0ANmIGxW", "MNK4GjOEsE", "Vpz4CKtSC3", "NGCwtO6rWa", "sBV52vffCD", "i6iOPeCwpk", "TewACNffwA", "7gr1XeRdcv", "9Wv6OMZtNF", "WGbDYt0ZJy", "4klRI4Jp95", "mS6Fybf76j", "z3tdXDUOGG", "bY1x0kzS5A", "DpzdUjRZJN", "kiEa00xJWT", "ztimqaNzhU", "xzqZozMhkF", "whRetzOXIz", "CRaiNeM5Ua", "WauCa3PF58", "oj1ypCjSBg", "FRSkwBNTfi", "pvm3RyTLIq", "0vMv1Gaqip", "2xnr81mdnr", "7IipYFWXg4", "jdYaqoHtiq", "tkOBuqfqK7", "Toh0jFYeCS", "Ab9lP2lwrh", "0sxEKmcPu7", "n1jkee4I97", "PYAmfeB2gF", "0BDCJVtkgq", "qCXIMTgCWt", "meIJgSTHUz", "SJYkNp4htZ", "ySlG3foCt0", "2Y8jQqKDFB", "c6guoto8Ry", "GBp0IVSIuB", "4HFzbk16jQ", "IptzBRDLNq", "laarf7efG4", "OsCTNhHkNW", "yrMaYNfqbE", "ckS2ovY4RK", "hTqYKLYEz5", "P25oGyYyX9", "wOCzBwY0zF", "4K6TyX6iIp", "QpEnebDWW1", "Zxm4EGeBs9", "JHUk8tUnvI", "xBx5AqdK4n", "32Qs7SBzN2", "4wBkpSGiaz", "jMltVhmTfs", "89od5FvPi8", "CjTfC5hcYa", "MfOR6TtR4h", "d3VmwHn4JD", "F4N6nToYEv", "dMwZI7pT9Z", "9yIPACfhHc", "y1oav83S7s", "NhPETp639A", "K1qYKahbEx", "lt4K4fnKEm", "024JbQN3nA", "vBGoa4wKBz", "ksOrUN6Cxe", "iEky8bpN2X", "8EHkXz9cAz", "m7HsCnhAo5", "l7XyV4m66M", "UeTzmks1l5", "jEAKl9hUH7", "5uwZtoCT0f", "KeMD00wje5", "wOXjUGHsFD", "y1uYAaq4MC", "ZrZrnu5eRF", "KZRC89CA1W", "7dHyB7gCWt", "K6feDb45Hz", "Q6GDbdUmIs", "54JxNjwbBW", "K9PSZ7hRcc", "JQ3uHSjAKl", "MhiHDGGFRo", "VWBp35OVdw", "uJJ09O67tB", "YWyc8GPDcO", "gIwVDYI48Y", "J74OFeSpI3", "QGiJ6LkqTt", "jGK5iTSTkg", "3Ogjd1GFE7", "0ibO0540v6", "6YYZySyZJh", "ulrmb1MCAK", "iR8cENaQoq", "np4aEWhzux", "Ln2BxxEqsM", "xfralMDAqN", "OVFh1SgEyF", "FctyErRWHW", "OBWlwE2TeD", "VZhkSLTjqV", "6QNZyhf92i", "PNS9v2LXJU", "T9wVmT2gTq", "xA5lhMOUZC", "yph0LU1uaT", "nX2JOLXsBb", "YSOgGNQljq", "Ws8qTvLO5s", "nDnyDOcNSf", "7zhqpLwIUr", "tQXPrePO0J", "yVk1SFNWuH", "AqkjVJkXje", "wcD16waqZt", "nO31AxRerO", "UFPn7NVIJa", "23ltzWtMbU", "lAnl18VSCm", "XyxVBLqRJh", "CmpJN5XlMT", "YfFG0BFlTW", "90A4JXOmvv", "YMLNJ5uAIm", "zOXz428gRu", "VBoeWUXWoF", "XmtycaeuFK", "JHKma4rfsB", "jvcptI9Yor", "ISeLNxmxAN", "99tevzlnrA", "xQ3DR3mKan", "5TklF15eYw", "SLEhoaaGnk", "Vfz5oDs8zk", "kE132XVLOf", "cfjA2pNCrS", "JQzYyxmZS9", "9bmFdFy9jJ", "iW9v8hBUbn", "Hsxrdh904G", "RARYrQo1sW", "ts2kWQ4O58", "6HKEkKH6wb", "z6ThtnSVtu", "NI7E0tzAVb", "tjuhZBeIQ0", "TAaLnSMVF7", "jIJhmN6Dbv", "2ksXcwLecV", "CKpKHmRJh4", "9KgNhD9uu0", "EhTnNpRVx9", "UtLtjrkhA7", "dTJ2ZQoksP", "xHw1FRda6Z", "BBCCLoAGbj"};
  //char* words[wordCount] = {"IoIgvobF3X", "BU76Ai4byb", "cKWiADApfH", "ATi4msdbPQ", "4V83qmtChS", "umkF3dDYrI", "1t7rixGncC", "w0vSlfX0Pe", "ZIOMADfuxh", "mm5Xxxlkkl", "d3tm79naDh", "EoqqZcBDJR", "XQ4O4zbr1Y", "Xlr7lWGNHJ", "YNlNhfWQ3K", "8vuvestkxz", "5P6pNBHHMY", "HlEhFbley8", "b15ZnD51FU", "wlty95kzj1"};
  //printf("%s", words[0]);
  //int tableCount = 20;
  SymbolTable *tableRoot = initSymbolTable();
  tables[0] = tableRoot;

  //create tables
  for(int i = 1; i < tableCount; i++){
    //printf("i %d\n", i);
    //int search = 1; //continue to search for parent
    int j = 1; //randomization factor for finding parent
    //int parentIndex = i*j*300 % 20;
    int parentIndex = (i-j)*3 %20;
    while(tables[parentIndex] == NULL){
      j++;
      //int parentIndex = i*j*300 % 20;
      parentIndex = (i-j)*3 % 20;
    }
    //SymbolTable *childTable = scopeSymbolTable(tables[parentIndex]); //set parent of child
    tables[i] = scopeSymbolTable(tables[parentIndex]); //save child i table
  }

  //insert symbol into the tables
  int j = -1; //0%25 is 0
  for(int i = 0; i<wordCount; i++){
  //printf("(i,j)=(%d,%d)\n",i,j);
    if((i % (wordCount/20)) == 0){
      j++;
      j = j%20;
    }
    //SymbolTable *table = tables[(i*319)%20];
    SymbolTable *table = tables[j];
    putSymbol(table, words[i], i);
  }

//add 1 string from each table to each table, including a repetition
  for(int i = 0; i<wordCount/20; i++){
    for(int j = 0; j<20; j++){
      SymbolTable *table = tables[j];
      putSymbol(table, words[i*20], i+10000);
      //printf("(i,j,words[i],i*wordCount/20)=(%d,%d,%c,%d)\n", i,j,words[i],i*wordCount/20);
    }
  }

  //add all the strings of table 0 to table 0 again
  for(int i = 0; i<wordCount/20; i++){
    for(int j = 0; j<20; j++){
      SymbolTable *table = tables[0];
      putSymbol(table, words[i], i+10000);
      //printf("(i,j,words[i],i*wordCount/20)=(%d,%d,%c,%d)\n", i,j,words[i],i*wordCount/20);
    }
  }

}
