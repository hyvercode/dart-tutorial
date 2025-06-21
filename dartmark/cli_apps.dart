import 'dart:io';

void main() {
  print("========== Welcome to Hvercode Market ==========");

  stdout.writeln("========== Input Your Account :");
  print('Please input your name : ');
  final inputName = stdin.readLineSync();
  stdout.writeln();

  print('Please input your Phone : ');
  final inputPhone = stdin.readLineSync();

  stdout.writeln();
  print("========== Thnks You :");
  stdout.writeln('You Name  : $inputName');
  stdout.writeln('You Phone : $inputPhone');

  print("========== Menu Hvercode Market ==========");
  stdout.writeln("Drinks :");
  stdout.writeln("    001 Coca-Cola");
  stdout.writeln("    002 Mineral Watter 600ml");
  stdout.writeln("    003 Coffe Milk");

  stdout.writeln("Foods :");
  stdout.writeln("    004 Biscuit");
  stdout.writeln("    005 Chocolate");
  stdout.writeln("    006 Cookies Mik");

  double amount = 0;

  print('Please input your buy : ');
  final buy = stdin.readLineSync();
  switch (buy) {
    case "001":
      amount = 15;
      break;
    case "002":
      amount = 10;
      break;
    case "003":
      amount = 20;
      break;
    case "004":
      amount = 6;
      break;
    case "005":
      amount = 5;
      break;
    case "006":
      amount = 6;
      break;
    default:
      print("========== Thank you for comming ==========");
  }

  if (amount != 0) {
    stdout.writeln();
    print("========== Thank you for buying ==========");
    stdout.writeln("Total Amount : \$" + amount.toString());
    stdout.writeln();
    print("================== " + DateTime.now().toLocal().toString());
  }
}
