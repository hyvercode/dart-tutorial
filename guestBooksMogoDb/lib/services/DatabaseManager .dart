import 'package:mongo_dart/mongo_dart.dart';

class DatabaseManager {
  static const String _connectionString =
      'mongodb://admin:admin@localhost:27017/guestbook?authSource=admin';
  static const String _collectionName = 'guest';

  late Db _db;
  late DbCollection _collection;
  bool _isConnected = false;

  // Initialize database connection
  Future<void> connect() async {
    try {
      _db = await Db.create(_connectionString);
      await _db.open();
      _collection = _db.collection(_collectionName);
      _isConnected = true;
      print('Connected to MongoDB successfully!');
    } catch (e) {
      print('Error connecting to MongoDB: $e');
      print('Please ensure MongoDB is running on localhost:27017');
      rethrow;
    }
  }

  // Close database connection
  Future<void> close() async {
    if (_isConnected) {
      await _db.close();
      _isConnected = false;
      print('Database connection closed.');
    }
  }

  // Get collection reference
  DbCollection get collection {
    if (!_isConnected) {
      throw Exception('Database not connected. Call connect() first.');
    }
    return _collection;
  }

  // Check if connected
  bool get isConnected => _isConnected;
}
