
void doSomething();

void main(){
  int y=4;
  doSomething();
  y = 8;
  doSomething();
  void doSomething(){
    int x = 3;
    x = x+2;
  }
  doSomething();
}


void doSomething(){
  int x = 2;
  x = x+4;
}
