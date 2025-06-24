import 'package:dart_sqlite/models/Product.dart';
import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final db = sqlite3.open('letix_pos.db');
    _onCreate(db);

    return db;
  }

  Future<void> _onCreate(Database db) async {
    db.execute('''
      CREATE TABLE IF NOT EXISTS products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        stock INTEGER NOT NULL
      )
    ''');
  }

  // --- CRUD Operations ---

  // Create
  Future<bool> insertProduct(Product product) async {
    final db = await database;
    try {
      final insertProductStmt = db.prepare(
        'INSERT INTO products (name, price, stock) VALUES (?,?,?)',
      );

      // Execute using a Map for named parameters
      insertProductStmt.execute([product.name, product.price, product.stock]);

      insertProductStmt.dispose();

      return true;
    } catch (e) {
      print('Error inserting product: $e');
      return false;
    }
  }

  // Read all
  Future<List<Product>> getProducts() async {
    final db = await database;
    final ResultSet resultSet = db.select('SELECT * FROM products');
    final List<Map<String, dynamic>> maps = resultSet;
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }
}
