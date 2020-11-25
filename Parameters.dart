
void main(){
  //printPerson("Jhon", 34);

  // print(say("Jhon", "Hello Dart"));
  message(name :"Cris");
}

void printPerson(String name, int age){
  print("Name is : $name  age : "+age.toString());
}

String say(String from,String msg,[String? device]){
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}


void message({String name ="Jhon" ,String msg = 'Hello Dart'}){
  print("Name is : $name message :$msg");
}