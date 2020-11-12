void main() {
  // varibales
  print("========Var===========");
  var message = "Dart";
  print("Welcome $message");

  print("========Number===========");
  exNumber();
  exDouble();

  print("=======String===========");
  exString();

  print("======Boolena===========");
  exBoolean();

}

void exNumber(){
  int numA=10;
  int numB=5;

  int numC = numA + numB;

  print("Number A + Number B = $numC");
}

void exDouble(){
  double numA = 10.5;
  double numB = 5.5;
  double numC = numA * numB;

  print("Number A x Number B = $numC");
}

void exString(){
  String message ="Hello Dart";
  print(message);
}

void exBoolean(){
  bool num;
  num = 0<10;

  print("0 < 10 = $num");
}

