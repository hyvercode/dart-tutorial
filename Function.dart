void main(){
  print(isActive(0));
  showMessage();
}

bool isActive(int active){
  return active !=1;
}

void showMessage() => print("This is void function");
