#include "../header/symbol.h"
#include <stdio.h>
#include "../header/testp1.h"


SymbolTable *tables[tableCount]; //list of pointers to any symbolTable in the tree

int testTree(){
  /*printf("Hej\n");
  SymbolTable *table = initSymbolTable();
  printf("Symboltable = %p\n", table);
  SymbolTable *childTable = scopeSymbolTable(table);
  printf("Child Symboltable = %p\n", childTable);
  printf("parent of child Symboltable = %p\n", childTable->next);
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
*/
  createTree();
  for(int i=0; i<tableCount; i++){
    printf("Table number %d\n", i);
    dumpSymbolTable(tables[i]);
    printf("\n\n\n\n\n\n\n");
  }
  return 0;
}


void createTree(){
  char* words[500] = {"IoIgvobF3X", "BU76Ai4byb", "cKWiADApfH", "ATi4msdbPQ", "4V83qmtChS", "umkF3dDYrI", "1t7rixGncC", "w0vSlfX0Pe", "ZIOMADfuxh", "mm5Xxxlkkl", "d3tm79naDh", "EoqqZcBDJR", "XQ4O4zbr1Y", "Xlr7lWGNHJ", "YNlNhfWQ3K", "8vuvestkxz", "5P6pNBHHMY", "HlEhFbley8", "b15ZnD51FU", "wlty95kzj1", "aP4sAuRccG", "smsqMQJnFg", "3awKKoMKNa", "AucxCcmri8", "I4h6QnfQUT", "Z2BeVuHW5S", "vhKvkpWPb3", "cAkEM2Jj1W", "94KuHZTdQq", "5xTCZ4KxBe", "Zg8ZhyAT2o", "0PlZ2z8XVI", "NZ2adOXOdb", "ixz9W1vQRW", "PfOEqvf7uy", "bbl5U5piNJ", "86eX9kykvZ", "PzSukIoSKj", "fmk1kgJT4I", "xBytPEF2t7", "R0BCNdQxIm", "uxtY7AAP7G", "nimNeoiHc7", "WJxtpRCrHL", "dUfIXHXjQ5", "rLhg4rapKj", "JqrLzBFVQ0", "U8SDhk60pY", "kBzDxmdO9M", "2vK0RoTzF9", "YfOC3Btjn2", "kQxv3EOmfW", "aBFvfs5d1r", "dfu800eG0I", "SaPJDbdVjs", "v4foEchvWm", "l7nxKsHb39", "hEehxUAsKg", "NU5JoAtbuI", "CaTQb9GkTk", "EBEvd9yWej", "PT5G3lR9mp", "trHZyqL88L", "3OaCpwlhtS", "GgXfDKKvy3", "fqwXT4k1wb", "UebchG3Bws", "44UZ8xE1dj", "AVWyO2kSJG", "eDoT6M3QOa", "zGAn5G09GK", "nZxGpufowm", "9Qkn3iwhWp", "S2nIabyGMn", "OeARvUeyMi", "34qyXeSDMu", "AK1qSSvkOk", "7cEbFW1Tvv", "W4UKoAtn01", "44Gh6RB1cW", "ScSbJp2azd", "uvm6cawM7M", "Q1du6ungtE", "wwSXlddKSs", "5BAAYfeKXk", "4pAbvwaGix", "8N7FQqJzXK", "rRlBsh9eTS", "u5gx742lDG", "zUlghrnydA", "HRLs2u4m2p", "HwVqMo4OI7", "oZxXb4vGme", "uNnPXlXXEC", "HLHoSUWLek", "eBMHJV4gVP", "0okpFyhqow", "a74nMBCoAZ", "cWVSjJpPzX", "DfVVXyyJDi", "IymXT9iPtb", "e0xis8qrLF", "hdXWaRVt57", "06llMYOlAU", "UKCgQ1qVZn", "wjCAwkeVWH", "t2daxJpI32", "oGR0I7bKI7", "Q9jNgfiLAd", "tk3yheDL6H", "gHf9Nsp2mV", "AuYE72ztAZ", "JH3Ojwoiuf", "l3uyhhlv8B", "moHSjLcn7o", "lOd2KvI9bg", "0pEFhYukYl", "A7l3Qw0Uca", "EaQBXS9fWM", "McYVizUbMQ", "RDNSSmdpKy", "GzoFJSri1w", "9md9v7inc0", "j4OqoUgAmV", "TgCZkPf9Jo", "zKvdlMGUav", "bYBLMGATEd", "2wYZ1QUUfB", "JXklFCyF3h", "DtLt3QVa98", "OlbMlbZk47", "LLRXKTehLr", "CN6T7kcYrF", "pshmntToRF", "IJPBMEeJYV", "j8lzZBbWAd", "E0bZnffyzC", "nOcktqdkVD", "siVtoDmEix", "t5RoGSr6Xd", "n1oNBzeezr", "LfhEvmTyGW", "SH22vcXDdx", "ueiHDWhpIx", "JJwckEwysr", "sqiCCP63lh", "4kipL557pe", "uzdMPrNVcX", "aTGNj55GFZ", "KnlnCUSCmM", "ePJ2FMxodk", "gccnyZyMDt", "CZvB1TULhs", "ADRi2Xtos2", "TXkOubR75m", "apAQxkPj30", "K44addeKkD", "pXkJVRswbo", "pu9fjES7ri", "PfNGrL5EyU", "SdxtHN8n0q", "N1eQfCJLCg", "71Sm0cJteX", "4mNCSCnDCP", "MV454KCS0t", "yOb11PMmuP", "BAWX1VVdYp", "YT6FbcEGi0", "9jmMZMG95c", "HY6YevSdAi", "7iBmG0TX4s", "k3eZB2ErWY", "opLaVshZPr", "9m69HE8PUa", "20o05VkzLq", "Ubq9f45zDe", "eixee9mJCj", "HM5X9gQ4Nm", "FJHVMWV8rd", "lxZ6hm351s", "fJqGdA0s13", "ldRORseoKT", "ghVB6yqNpY", "3RerLHVRp6", "453pqPm3JD", "izZEFJNtIk", "y2gCvWfyZt", "0e6CP1BqFR", "8weFbX1G8q", "8cIhWboXKj", "LE3SROJEsO", "GtUHICRJZF", "59pLODGfxJ", "MOSGzdlGma", "uOCei8SuJs", "aNmdJoNfvJ", "wTLzCboBjO", "MEyHCGy7YU", "VpbNlH9Z8C", "Hs8T9uPzaD", "CjD1qs7pvJ", "F5EqEJW5FR", "3fITy0eLjy", "e0Lg43Sgx7", "sHqbndXbxe", "F2Vm5AMT6W", "RgLzh9d5C5", "A3lWHjZQlj", "HsONHX8S3E", "ReF5stWzx9", "NGD5s9RZv2", "lSmR6DZxE5", "s89ytGAWAS", "UxOIEfNkZr", "g42U0FB4IN", "Z9JiGvf1tx", "wXd1uigzpF", "GLOZyzJPjh", "bmCyV0wWuu", "HBZGBETbrx", "wPmY5QFnUo", "tnT1xIIiOb", "Evef5O0FI5", "iHSrjPLDQU", "C5RCpWDQT6", "sRJwnfzmPi", "mFqbQzVVIU", "pyVMhmLZxZ", "BcwiBgSYRn", "X9lNXfvwhA", "bor3kVmuMj", "2jIX7UUla0", "ccQCBEd29f", "wUL0spUTt2", "MMg4B4BWj6", "XBdc379oXu", "jkiXABaJCj", "FDbJe3GFne", "Jg8MNlV8ED", "pSUmfNM9Ng", "WX1jG1us2n", "1OqliFeE9L", "jTYWSZlyRl", "Rzjs4812p2", "yQWO4OYqyt", "RgvRxUnt2D", "r0StpXEeDy", "zc0Dik01qV", "xY9ESAqdkX", "KRLowRUJzY", "yYWvsneCU5", "3XQEow3qDu", "39AzAjPWj4", "0m4oRnFORj", "TkOhfxsodc", "SHhwvSvlp7", "LxqWKKVsO5", "ToNitAZ0Ok", "SK2zJx0jmw", "zDBj4wSA5V", "jTaWCkErt7", "i1miGzEiXv", "wxF7FqNeKz", "ZPhEEvv5K6", "qiRKQY1Z5R", "ENi4ax8p2U", "Mgk84CcuMA", "TNaP4FMJ7A", "gi7DJdQOVw", "m7f9QNvJNb", "ZdMhibFRy8", "0ylROoWpfg", "fyuQ1Z6kBa", "5LL2DL82iL", "kapJKCa7G4", "vpdUYsiIae", "eSGJXPrpTk", "85uonS0fjw", "uidQOtzbFq", "m0iroAYdB1", "AgguU01FlE", "38zvN0KWdo", "UyD9YtMnWh", "x9Y3JuryQs", "lplpXYmrVO", "mBkE72oObx", "bhEQ9pRbiq", "rlvNJu2ASU", "iUnQcvqSPe", "GpHBtuEFAo", "55k8Zix44Q", "OWSjVvX6Oq", "JiLEJinDg4", "sUnyW193nF", "Cw2tybFi3z", "RMWIAwfZhz", "mVYiIrOII1", "y48AkdepOV", "XASFfyUpWK", "SXaYTcOUl2", "RYnUtazq02", "GTbuU7jSG6", "mHQgz9CIsX", "Pfu7g56Xn7", "pngJRBleJC", "U9BPuDKeAC", "S2UNDF3XMs", "csoGPIzEHu", "hNchco4MEv", "NEBRgkX6c0", "RgMRWyWNkr", "PtWaXGgvSg", "mNxSDG9ZK9", "74uGFRAmmE", "pRzuGFuDw1", "hVKGJEdkDa", "IicnxizbJQ", "3LVr2nrSq0", "GqZLFkpp1v", "ZkFH53HyrQ", "PFokl1umFv", "ady0h1ZYDU", "IcRvOXuWrk", "YjJXsWXsq2", "Zw4ezvO0u2", "CftJ9SbCae", "sMCxVoZcsZ", "INpZR9fD78", "T9hfceMx1k", "zx5YG60Xdk", "eth52g6uZW", "vFdWQJ3a2u", "6XHLTBl3Rc", "Bx0ANmIGxW", "MNK4GjOEsE", "Vpz4CKtSC3", "NGCwtO6rWa", "sBV52vffCD", "i6iOPeCwpk", "TewACNffwA", "7gr1XeRdcv", "9Wv6OMZtNF", "WGbDYt0ZJy", "4klRI4Jp95", "mS6Fybf76j", "z3tdXDUOGG", "bY1x0kzS5A", "DpzdUjRZJN", "kiEa00xJWT", "ztimqaNzhU", "xzqZozMhkF", "whRetzOXIz", "CRaiNeM5Ua", "WauCa3PF58", "oj1ypCjSBg", "FRSkwBNTfi", "pvm3RyTLIq", "0vMv1Gaqip", "2xnr81mdnr", "7IipYFWXg4", "jdYaqoHtiq", "tkOBuqfqK7", "Toh0jFYeCS", "Ab9lP2lwrh", "0sxEKmcPu7", "n1jkee4I97", "PYAmfeB2gF", "0BDCJVtkgq", "qCXIMTgCWt", "meIJgSTHUz", "SJYkNp4htZ", "ySlG3foCt0", "2Y8jQqKDFB", "c6guoto8Ry", "GBp0IVSIuB", "4HFzbk16jQ", "IptzBRDLNq", "laarf7efG4", "OsCTNhHkNW", "yrMaYNfqbE", "ckS2ovY4RK", "hTqYKLYEz5", "P25oGyYyX9", "wOCzBwY0zF", "4K6TyX6iIp", "QpEnebDWW1", "Zxm4EGeBs9", "JHUk8tUnvI", "xBx5AqdK4n", "32Qs7SBzN2", "4wBkpSGiaz", "jMltVhmTfs", "89od5FvPi8", "CjTfC5hcYa", "MfOR6TtR4h", "d3VmwHn4JD", "F4N6nToYEv", "dMwZI7pT9Z", "9yIPACfhHc", "y1oav83S7s", "NhPETp639A", "K1qYKahbEx", "lt4K4fnKEm", "024JbQN3nA", "vBGoa4wKBz", "ksOrUN6Cxe", "iEky8bpN2X", "8EHkXz9cAz", "m7HsCnhAo5", "l7XyV4m66M", "UeTzmks1l5", "jEAKl9hUH7", "5uwZtoCT0f", "KeMD00wje5", "wOXjUGHsFD", "y1uYAaq4MC", "ZrZrnu5eRF", "KZRC89CA1W", "7dHyB7gCWt", "K6feDb45Hz", "Q6GDbdUmIs", "54JxNjwbBW", "K9PSZ7hRcc", "JQ3uHSjAKl", "MhiHDGGFRo", "VWBp35OVdw", "uJJ09O67tB", "YWyc8GPDcO", "gIwVDYI48Y", "J74OFeSpI3", "QGiJ6LkqTt", "jGK5iTSTkg", "3Ogjd1GFE7", "0ibO0540v6", "6YYZySyZJh", "ulrmb1MCAK", "iR8cENaQoq", "np4aEWhzux", "Ln2BxxEqsM", "xfralMDAqN", "OVFh1SgEyF", "FctyErRWHW", "OBWlwE2TeD", "VZhkSLTjqV", "6QNZyhf92i", "PNS9v2LXJU", "T9wVmT2gTq", "xA5lhMOUZC", "yph0LU1uaT", "nX2JOLXsBb", "YSOgGNQljq", "Ws8qTvLO5s", "nDnyDOcNSf", "7zhqpLwIUr", "tQXPrePO0J", "yVk1SFNWuH", "AqkjVJkXje", "wcD16waqZt", "nO31AxRerO", "UFPn7NVIJa", "23ltzWtMbU", "lAnl18VSCm", "XyxVBLqRJh", "CmpJN5XlMT", "YfFG0BFlTW", "90A4JXOmvv", "YMLNJ5uAIm", "zOXz428gRu", "VBoeWUXWoF", "XmtycaeuFK", "JHKma4rfsB", "jvcptI9Yor", "ISeLNxmxAN", "99tevzlnrA", "xQ3DR3mKan", "5TklF15eYw", "SLEhoaaGnk", "Vfz5oDs8zk", "kE132XVLOf", "cfjA2pNCrS", "JQzYyxmZS9", "9bmFdFy9jJ", "iW9v8hBUbn", "Hsxrdh904G", "RARYrQo1sW", "ts2kWQ4O58", "6HKEkKH6wb", "z6ThtnSVtu", "NI7E0tzAVb", "tjuhZBeIQ0", "TAaLnSMVF7", "jIJhmN6Dbv", "2ksXcwLecV", "CKpKHmRJh4", "9KgNhD9uu0", "EhTnNpRVx9", "UtLtjrkhA7", "dTJ2ZQoksP", "xHw1FRda6Z", "BBCCLoAGbj"};
  //char* words[wordCount] = {"IoIgvobF3X", "BU76Ai4byb", "cKWiADApfH", "ATi4msdbPQ", "4V83qmtChS", "umkF3dDYrI", "1t7rixGncC", "w0vSlfX0Pe", "ZIOMADfuxh", "mm5Xxxlkkl", "d3tm79naDh", "EoqqZcBDJR", "XQ4O4zbr1Y", "Xlr7lWGNHJ", "YNlNhfWQ3K", "8vuvestkxz", "5P6pNBHHMY", "HlEhFbley8", "b15ZnD51FU", "wlty95kzj1"};
  //printf("%s", words[0]);
  //int tableCount = 20;
  SymbolTable *tableRoot = initSymbolTable();
  tables[0] = tableRoot;

  //create tables
  for(int i = 1; i < tableCount; i++){
    printf("i %d", i);
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
  for(int i = 0; i<wordCount; i++){
    SymbolTable *table = tables[(i*319)%20];
    putSymbol(table, words[i], i);
  }

}
