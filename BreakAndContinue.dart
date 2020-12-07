void main(){
  exBreak();
  exContinue();
}

void exBreak(){
  var list =[1,2,3,4,5];

  for(int i in list){
    if(i==4) break;
    print(i);
  }
}

void exContinue(){
  var list =[1,2,3,4,5];

  for(int i in list){
    if(i==4) continue;
    print(i);
  }
}