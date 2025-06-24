import 'dart:io';

import 'package:dart_sqlite/models/Product.dart';
import 'lib/database/database_helper.dart';

void main() async {
  final dbHelper = DatabaseHelper();
  dbHelper.database;

  print("========== Menu Hvercode Market ==========");
  stdout.writeln("(1) Create Product");
  stdout.writeln("(2) List Product");
  stdout.writeln();
  print('Please input : ');
  final input = stdin.readLineSync();

  if (input == '1') {
    // --- Create ---
    stdout.writeln();
    print('--- Creating Products ---');
    print('Input Product Name : ');
    final _name = stdin.readLineSync();
    print('Input Product Price : ');
    final _price = stdin.readLineSync();
    print('Input Product Stock : ');
    final _stock = stdin.readLineSync();

    stdout.writeln();
    Product newProduct1 = Product(
      name: _name.toString(),
      price: double.parse(_price.toString()),
      stock: int.parse(_stock.toString()),
    );

    bool id1 = await dbHelper.insertProduct(newProduct1);
    String status = id1 ? "Success" : "Failed";
    print('Inserted product : $status');
  } else if (input == '2') {
    // // --- Read All ---
    print('\n--- Reading All Products ---');
    List<Product> products = await dbHelper.getProducts();
    products.forEach((product) => print(product));
    stdout.writeln();
  } else {
    print("========== Thank you ==========");
  }
}
